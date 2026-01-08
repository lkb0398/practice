import 'package:flutter/foundation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:vitameal/data/dto/meal_analysis_dto.dart';

abstract class MealAnalysisDataSource {
  /// Edge Function을 호출하여 AI 분석 및 DB 저장
  Future<Map<String, dynamic>> requestAnalysis(String mealDayId);

  /// 특정 MealDay의 최신 분석 결과 조회
  Future<MealAnalysisDto?> getLatestAnalysis(String mealDayId);

  /// 오늘 분석 횟수 조회 (일일 한도 체크용)
  Future<int> getTodayAnalysisCount(String userId);
}

class MealAnalysisDataSourceImpl implements MealAnalysisDataSource {
  MealAnalysisDataSourceImpl(this._supabase);
  final SupabaseClient _supabase;

  @override
  Future<Map<String, dynamic>> requestAnalysis(String mealDayId) async {
    try {
      debugPrint('🤖 AI 분석 요청 시작 [$mealDayId]');
      // Edge Function : OpenAI API 호출 - DB에 저장 - 분석 결과 반환
      final response = await _supabase.functions.invoke(
        'analyze-meals',
        body: {'mealDayId': mealDayId},
      );
      if (response.status != 200) {
        throw Exception('AI 분석 실패 ${response.status}');
      }
      final result = response.data as Map<String, dynamic>;
      debugPrint('🤖 AI 분석 완료');
      return result;
    } catch (e) {
      debugPrint('🤖 requestAnalysis: $e');
      throw Exception('requestAnalysis: $e');
    }
  }

  @override
  Future<MealAnalysisDto?> getLatestAnalysis(String mealDayId) async {
    try {
      final response = await _supabase
          .from('meal_day_analyses')
          .select()
          .eq('meal_day_id', mealDayId)
          .order('created_at', ascending: false)
          .limit(1)
          .maybeSingle();

      if (response == null) {
        debugPrint('🌈 DB에서 최신 AI 분석 결과 조회, 분석 결과 없음');
        return null;
      }

      final result = MealAnalysisDto.fromJson(response);
      debugPrint('🌈 DB에서 최신 AI 분석 결과 조회 완료 [$mealDayId]');
      return result;
    } catch (e) {
      debugPrint('🌈 getLatestAnalysis: $e');
      throw Exception('getLatestAnalysis: $e');
    }
  }

  @override
  Future<int> getTodayAnalysisCount(String userId) async {
    try {
      final now = DateTime.now();
      final todayStart = DateTime(now.year, now.month, now.day).toUtc().toIso8601String();
      final todayEnd = DateTime(now.year, now.month, now.day, 23, 59, 59).toUtc().toIso8601String();

      final response = await _supabase
          .from('meal_day_analyses')
          .select('id')
          .eq('user_id', userId)
          .gte('created_at', todayStart)
          .lte('created_at', todayEnd);

      final count = (response as List).length;
      debugPrint('🤖 오늘 분석 횟수 조회 [$userId: $count회]');
      return count;
    } catch (e) {
      debugPrint('🤖 getTodayAnalysisCount: $e');
      throw Exception('getTodayAnalysisCount: $e');
    }
  }
}
