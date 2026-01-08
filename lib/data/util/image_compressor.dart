import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart';

/// 이미지 압축 유틸리티
class ImageCompressor {
  ImageCompressor._();

  /// 이미지 압축
  /// [file]: 압축할 이미지 파일
  /// [quality]: 압축 품질 (1-100, 기본값: 85)
  /// [maxWidth]: 최대 너비 (기본값: 1920)
  /// [maxHeight]: 최대 높이 (기본값: 1920)
  static Future<File> compress({
    required File file,
    int quality = 85,
    int maxWidth = 1920,
    int maxHeight = 1920,
  }) async {
    try {
      // 임시 디렉토리 가져오기
      final tempDir = await getTemporaryDirectory();
      final targetPath = path.join(
        tempDir.path,
        '${DateTime.now().millisecondsSinceEpoch}_compressed.jpg',
      );

      // 이미지 압축
      final compressedFile = await FlutterImageCompress.compressAndGetFile(
        file.absolute.path,
        targetPath,
        quality: quality,
        minWidth: maxWidth,
        minHeight: maxHeight,
        format: CompressFormat.jpeg,
      );

      if (compressedFile == null) {
        // 압축 실패 시 원본 반환
        debugPrint('🎞️ 이미지 압축 실패, 원본 사용');
        return file;
      }

      return File(compressedFile.path);
    } catch (e) {
      // 압축 실패 시 원본 반환
      debugPrint('🎞️ 이미지 압축 실패, 원본 사용');
      return file;
    }
  }

  /// 압축된 임시 파일 삭제
  /// [file]: 삭제할 파일
  static Future<void> deleteTempFile(File file) async {
    try {
      if (await file.exists()) {
        await file.delete();
      }
    } catch (e) {
      debugPrint('🎞️ 임시 파일 삭제 실패 $e');
    }
  }
}
