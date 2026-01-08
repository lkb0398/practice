import 'dart:developer';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:vitameal/data/dto/allergies_dto.dart';

abstract interface class AllergiesDataSource {
  Future<List<AllergiesDto>> fetchAll();
  Future<List<int>> findIdsByNames(List<String> names);
  Future<List<String>> findNamesByIds(List<int> ids);
}

class AllergiesDataSourceImpl implements AllergiesDataSource {
  AllergiesDataSourceImpl(this.client);

  final SupabaseClient client;

  @override
  Future<List<AllergiesDto>> fetchAll() async {
    try {
      final result = await client
          .from('allergies')
          .select('id, name')
          .order('name', ascending: true);
      return (result as List).map((e) => AllergiesDto.fromJson(e)).toList();
    } on PostgrestException catch (e, s) {
      log('DB 오류로 인한 fetchAll 실패 : ${e.message}', error: e, stackTrace: s);
      rethrow;
    } catch (e, s) {
      log('알 수 없는 오류로 인한 fetchAll 실패 : e', error: e, stackTrace: s);
      rethrow;
    }
  }

  @override
  Future<List<int>> findIdsByNames(List<String> names) async {
    try {
      if (names.isEmpty) return [];
      final result = await client
          .from('allergies')
          .select('id')
          .inFilter('name', names);
      return (result as List).map((e) => e['id'] as int).toList();
    } on PostgrestException catch (e, s) {
      log(
        'DB 오류로 인한 findIdsByNames 실패 : ${e.message}',
        error: e,
        stackTrace: s,
      );
      rethrow;
    } catch (e, s) {
      log('알 수 없는 오류로 인한 findIdsByNames 실패 : e', error: e, stackTrace: s);
      rethrow;
    }
  }

  @override
  Future<List<String>> findNamesByIds(List<int> ids) async {
    try {
      if (ids.isEmpty) return [];
      final result = await client
          .from('allergies')
          .select('name')
          .inFilter('id', ids);
      return (result as List).map((e) => e['name'] as String).toList();
    } on PostgrestException catch (e, s) {
      log(
        'DB 오류로 인한 findNamesByIds 실패 : ${e.message}',
        error: e,
        stackTrace: s,
      );
      rethrow;
    } catch (e, s) {
      log('알 수 없는 오류로 인한 findNamesByIds 실패 : e', error: e, stackTrace: s);
      rethrow;
    }
  }
}
