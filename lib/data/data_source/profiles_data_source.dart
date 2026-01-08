import 'dart:developer';
import 'dart:io';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:vitameal/data/dto/profiles_dto.dart';
import 'package:vitameal/data/mapper/profiles_mapper.dart';
import 'package:vitameal/domain/entity/profiles_entity.dart';

// profiles 테이블 CRUD
abstract interface class ProfilesDataSource {
  Future<ProfilesDto?> getMyProfile(String userId);
  Future<void> updateProfile(ProfilesEntity entity);
  Future<String> uploadProfileImage({
    required String userId,
    required File file,
  });
  Future<bool> checkNickname(String nickname);
}

class ProfilesDataSourceImpl implements ProfilesDataSource {
  ProfilesDataSourceImpl(this.client);

  final SupabaseClient client;

  @override // R
  Future<ProfilesDto?> getMyProfile(String userId) async {
    try {
      final data = await client
          .from('profiles')
          .select()
          .eq('user_id', userId)
          .maybeSingle();
      if (data == null) return null;
      return ProfilesDto.fromJson(data);
    } on PostgrestException catch (e, s) {
      log('DB 오류로 인한 getMyProfile 실패 : ${e.message}', error: e, stackTrace: s);
      rethrow;
    } catch (e, s) {
      log('알 수 없는 오류로 인한 getMyProfile 실패 : e', error: e, stackTrace: s);
      rethrow;
    }
  }

  @override // U
  Future<void> updateProfile(ProfilesEntity entity) async {
    try {
      final map = ProfilesMapper.toUpdateMap(entity);
      await client.from('profiles').update(map).eq('user_id', entity.userId);
    } on PostgrestException catch (e, s) {
      if (e.code == '23505') {
        throw DuplicateNicknameException();
      }
      log('DB 오류로 인한 updateProfile 실패 : ${e.message}', error: e, stackTrace: s);
      rethrow;
    } catch (e, s) {
      log('알 수 없는 오류로 인한 updateProfile 실패 : e', error: e, stackTrace: s);
      rethrow;
    }
  }

  @override // C (프로필 이미지)
  Future<String> uploadProfileImage({
    required String userId,
    required File file,
  }) async {
    try {
      final filePath = '$userId/profileimg.jpg';
      await client.storage
          .from('profile-images')
          .upload(filePath, file, fileOptions: const FileOptions(upsert: true));
      final baseUrl = client.storage
          .from('profile-images')
          .getPublicUrl(filePath);
      return '$baseUrl?t=${DateTime.now().millisecondsSinceEpoch}';
    } on PostgrestException catch (e, s) {
      log(
        'DB 오류로 인한 uploadProfileImage 실패 : ${e.message}',
        error: e,
        stackTrace: s,
      );
      rethrow;
    } catch (e, s) {
      log('알 수 없는 오류로 인한 uploadProfileImage 실패 : e', error: e, stackTrace: s);
      rethrow;
    }
  }

  @override
  Future<bool> checkNickname(String nickname) async {
    try {
      final result = await client
          .from('profiles')
          .select('user_id')
          .eq('nickname', nickname)
          .limit(1);
      return result.isNotEmpty;
    } on PostgrestException catch (e, s) {
      log('DB 오류로 인한 checkNickname 실패 : ${e.message}', error: e, stackTrace: s);
      rethrow;
    } catch (e, s) {
      log('알 수 없는 오류로 인한 checkNickname 실패 : e', error: e, stackTrace: s);
      rethrow;
    }
  }
}

class DuplicateNicknameException implements Exception {
  @override
  String toString() => '이미 사용 중인 닉네임입니다.';
}
