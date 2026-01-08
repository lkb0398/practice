import 'dart:developer';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:vitameal/data/dto/goal_datas_dto.dart';

abstract interface class GoalDatasDataSource {
  Future<List<GoalDatasDto>?> getGoalDatas(String goalId);
  Future<void> saveData(GoalDatasDto dto);
  Future<void> deleteDatas(List<String> dataIds);
}

class GoalDatasDataSourceImpl implements GoalDatasDataSource {
  GoalDatasDataSourceImpl(this.client);

  final SupabaseClient client;

  @override // R (전체)
  Future<List<GoalDatasDto>?> getGoalDatas(String goalId) async {
    try {
      final response = await client
          .from('goal_datas')
          .select()
          .eq('goal_id', goalId)
          .order('data_date', ascending: false); // 일자 최신순 정렬
      return (response as List).map((e) => GoalDatasDto.fromJson(e)).toList();
    } on PostgrestException catch (e, s) {
      log('DB 오류로 인한 getGoalDatas 실패 : ${e.message}', error: e, stackTrace: s);
      rethrow;
    } catch (e, s) {
      log('알 수 없는 오류로 인한 getGoalDatas 실패 : e', error: e, stackTrace: s);
      rethrow;
    }
  }

  @override // C
  Future<void> saveData(GoalDatasDto dto) async {
    try {
      final map = {
        'goal_id': dto.goalId,
        'data_date': dto.dataDate,
        'data_value': dto.dataValue,
      };
      await client.from('goal_datas').insert(map);
    } on PostgrestException catch (e, s) {
      log('DB 오류로 인한 saveData 실패 : ${e.message}', error: e, stackTrace: s);
      rethrow;
    } catch (e, s) {
      log('알 수 없는 오류로 인한 saveData 실패 : e', error: e, stackTrace: s);
      rethrow;
    }
  }

  @override // D (다중)
  Future<void> deleteDatas(List<String> dataIds) async {
    try {
      await client.from('goal_datas').delete().inFilter('data_id', dataIds);
    } on PostgrestException catch (e, s) {
      log('DB 오류로 인한 deleteDatas 실패 : ${e.message}', error: e, stackTrace: s);
      rethrow;
    } catch (e, s) {
      log('알 수 없는 오류로 인한 deleteDatas 실패 : e', error: e, stackTrace: s);
      rethrow;
    }
  }
}
