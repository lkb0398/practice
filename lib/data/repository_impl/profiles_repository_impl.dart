import 'dart:io';
import 'package:vitameal/data/data_source/profiles_data_source.dart';
import 'package:vitameal/data/mapper/profiles_mapper.dart';
import 'package:vitameal/domain/entity/profiles_entity.dart';
import 'package:vitameal/domain/repository/profiles_repository.dart';

class ProfilesRepositoryImpl implements ProfilesRepository {
  ProfilesRepositoryImpl(this.dataSource);

  final ProfilesDataSource dataSource;

  @override
  Future<ProfilesEntity?> getMyProfile(String userId) async {
    final dto = await dataSource.getMyProfile(userId);
    if (dto == null) return null;
    return ProfilesMapper.toEntity(dto);
  }

  @override
  Future<String> uploadProfileImage({
    required String userId,
    required File file,
  }) {
    return dataSource.uploadProfileImage(userId: userId, file: file);
  }

  @override
  Future<void> updateProfile(ProfilesEntity profile) {
    return dataSource.updateProfile(profile);
  }

  @override
  Future<bool> isNicknameDuplicated(String nickname) {
    return dataSource.checkNickname(nickname);
  }
}
