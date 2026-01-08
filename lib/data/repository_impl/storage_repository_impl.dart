import 'dart:io';
import 'package:path/path.dart' as path;
import 'package:uuid/uuid.dart';
import 'package:vitameal/data/data_source/storage_data_source.dart';
import 'package:vitameal/data/util/image_compressor.dart';
import 'package:vitameal/domain/repository/storage_repository.dart';

class StorageRepositoryImpl implements StorageRepository {
  StorageRepositoryImpl(this._storageDataSource);

  final StorageDataSource _storageDataSource;
  final Uuid _uuid = const Uuid();

  @override
  Future<String> uploadMealImage({required File file, required String userId}) async {
    File? compressedFile;
    try {
      // 이미지 압축
      compressedFile = await ImageCompressor.compress(file: file);
      // 파일명 생성 (UUID + 확장자)
      final extension = path.extension(file.path);
      final fileName = '${_uuid.v4()}$extension';
      // Storage 경로 (userId/fileName)
      final storagePath = '$userId/$fileName';
      // Storage 업로드
      final publicUrl = await _storageDataSource.uploadFile(file: compressedFile, storagePath: storagePath);
      // Url 반환
      return publicUrl;
    } catch (e) {
      rethrow;
    } finally {
      // 압축된 임시 파일 삭제
      if (compressedFile != null && compressedFile.path != file.path) {
        await ImageCompressor.deleteTempFile(compressedFile);
      }
    }
  }

  @override
  Future<void> deleteMealImage(String imageUrl) async {
    try {
      final storagePath = _storageDataSource.extractStoragePathFromUrl(imageUrl);
      await _storageDataSource.deleteFile(storagePath: storagePath);
    } catch (e) {
      rethrow;
    }
  }
}
