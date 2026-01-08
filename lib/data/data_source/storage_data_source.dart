import 'dart:io';
import 'package:supabase_flutter/supabase_flutter.dart';

class StorageDataSource {
  StorageDataSource(this._supabase);

  final SupabaseClient _supabase;

  /// 파일 업로드
  Future<String> uploadFile({
    required File file,
    required String storagePath, // Storage 내 경로
    String bucketName = 'meal-images', // 버킷 명 
  }) async {
    try {
      // Storage 업로드
      await _supabase.storage.from(bucketName).upload(
            storagePath,
            file,
            fileOptions: const FileOptions(
              cacheControl: '3600',
              upsert: false,
            ),
          );

      // Public URL 반환
      final publicUrl = _supabase.storage.from(bucketName).getPublicUrl(storagePath);
      return publicUrl;
    } catch (e) {
      throw Exception('파일 업로드 실패: $e');
    }
  }

  /// 파일 삭제
  Future<void> deleteFile({
    required String storagePath,
    String bucketName = 'meal-images',
  }) async {
    try {
      await _supabase.storage.from(bucketName).remove([storagePath]);
    } catch (e) {
      throw Exception('파일 삭제 실패: $e');
    }
  }

  /// Public URL에서 Storage 경로 추출
  String extractStoragePathFromUrl(String publicUrl) {
    try {
      final uri = Uri.parse(publicUrl);
      final pathSegments = uri.pathSegments;

      // 'object' 세그먼트 찾기
      final bucketIndex = pathSegments.indexOf('object');
      if (bucketIndex == -1 || bucketIndex + 2 >= pathSegments.length) {
        throw Exception('잘못된 Storage URL 형식');
      }

      // 'object/public/bucket-name/' 이후의 경로 추출
      return pathSegments.sublist(bucketIndex + 2).join('/');
    } catch (e) {
      throw Exception('Storage 경로 추출 실패: $e');
    }
  }
}
