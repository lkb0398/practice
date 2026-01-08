import 'dart:io';
import 'package:vitameal/domain/entity/profiles_entity.dart';

abstract class ProfilesRepository {
  Future<ProfilesEntity?> getMyProfile(String userId);
  Future<String> uploadProfileImage({
    required String userId,
    required File file,
  });
  Future<void> updateProfile(ProfilesEntity profile);
  Future<bool> isNicknameDuplicated(String nickname);
}
