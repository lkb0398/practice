import 'dart:io';

abstract class StorageRepository {
  /// 식단 이미지 업로드 (압축 + 업로드)
  Future<String> uploadMealImage({
    required File file,
    required String userId,
  });

  /// 식단 이미지 삭제
  Future<void> deleteMealImage(String imageUrl);
}