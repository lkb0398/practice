import 'dart:io';
import 'package:vitameal/domain/entity/tag_entity.dart';

import '../entity/post_entity.dart';

abstract class PostRepository {
  /// 게시물 목록 페이징 조회
  Future<List<PostEntity>> fetchPosts({
    required int from,
    required int to,
    required String userId,
  });

  Future<List<TagEntity>> fetchAllTags();

  /// 북마크 토글
  Future<bool> toggleBookmark({required String userId, required String postId});

  /// 사용자가 북마크한 게시물 조회
  Future<List<PostEntity>> fetchBookmarkedPosts(String userId);

  /// 이미지 업로드
  Future<String?> uploadImage(File imageFile, String bucket, String userId);

  /// 새 레시피 게시물 생성
  Future<void> createPost({
    required String title,
    required String ingredient,
    String? imageUrl,
    required String userId,
    required List<int> selectedTagIds,
    required List<Map<String, dynamic>> steps, // ViewModel에서 가공해서 전달
  });
}
