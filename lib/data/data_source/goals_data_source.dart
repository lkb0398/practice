import 'dart:developer';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:vitameal/data/dto/goals_dto.dart';

abstract interface class GoalsDataSource {
  Future<List<GoalsDto>?> getAllGoals();
  Future<void> saveGoal(GoalsDto dto);
  Future<void> updateGoal(GoalsDto dto);
  Future<void> deleteGoal(String goalId);
}

class GoalsDataSourceImpl implements GoalsDataSource {
  GoalsDataSourceImpl(this.client);

  final SupabaseClient client;

  @override // R (전체)
  Future<List<GoalsDto>?> getAllGoals() async {
    try {
      final response = await client
          .from('goals')
          .select()
          .order('is_done', ascending: true) // 1. 완료 여부에 따라 정렬
          .order('created_at', ascending: false); // 2. 최신순 정렬
      return (response as List).map((e) => GoalsDto.fromJson(e)).toList();
    } on PostgrestException catch (e, s) {
      log('DB 오류로 인한 getAllGoals 실패 : ${e.message}', error: e, stackTrace: s);
      rethrow;
    } catch (e, s) {
      log('알 수 없는 오류로 인한 getAllGoals 실패 : e', error: e, stackTrace: s);
      rethrow;
    }
  }

  @override // C
  Future<void> saveGoal(GoalsDto dto) async {
    try {
      final map = {
        'user_id': dto.userId,
        'goal_title': dto.goalTitle,
        'goal_unit': dto.goalUnit,
        'goal_value': dto.goalValue,
        'goal_date': dto.goalDate,
        'is_done': dto.isDone,
        'is_main': dto.isMain,
      };
      await client.from('goals').insert(map);
    } on PostgrestException catch (e, s) {
      log('DB 오류로 인한 saveGoal 실패 : ${e.message}', error: e, stackTrace: s);
      rethrow;
    } catch (e, s) {
      log('알 수 없는 오류로 인한 saveGoal 실패 : e', error: e, stackTrace: s);
      rethrow;
    }
  }

  @override // U
  Future<void> updateGoal(GoalsDto dto) async {
    try {
      final map = {
        'goal_title': dto.goalTitle,
        'goal_unit': dto.goalUnit,
        'goal_value': dto.goalValue,
        'goal_date': dto.goalDate,
        'is_done': dto.isDone,
        'is_main': dto.isMain,
      };
      await client.from('goals').update(map).eq('goal_id', dto.goalId!);
    } on PostgrestException catch (e, s) {
      log('DB 오류로 인한 updateGoal 실패 : ${e.message}', error: e, stackTrace: s);
      rethrow;
    } catch (e, s) {
      log('알 수 없는 오류로 인한 updateGoal 실패 : e', error: e, stackTrace: s);
      rethrow;
    }
  }

  @override // D
  Future<void> deleteGoal(String goalId) async {
    try {
      await client.from('goals').delete().eq('goal_id', goalId);
    } on PostgrestException catch (e, s) {
      log('DB 오류로 인한 deleteGoal 실패 : ${e.message}', error: e, stackTrace: s);
      rethrow;
    } catch (e, s) {
      log('알 수 없는 오류로 인한 deleteGoal 실패 : e', error: e, stackTrace: s);
      rethrow;
    }
  }
}
