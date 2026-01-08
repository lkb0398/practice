import 'dart:io';
import 'package:vitameal/data/mapper/tag_mapper.dart';
import 'package:vitameal/domain/entity/tag_entity.dart';

import '../../domain/entity/post_entity.dart';
import '../../domain/repository/post_repository.dart';
import '../data_source/post_remote_data_source.dart';
import '../dto/post_dto.dart';
import '../mapper/post_mapper.dart';

class PostRepositoryImpl implements PostRepository {
  // 핵심: 클래스가 아니라 '인터페이스'인 PostRemoteDataSource를 바라보게 합니다.
  final PostRemoteDataSource _dataSource;

  PostRepositoryImpl(this._dataSource);

  @override
  Future<List<TagEntity>> fetchAllTags() async {
    final dtos = await _dataSource.fetchAllTags();
    // 분리된 매퍼를 사용하여 변환
    return dtos.map((dto) => dto.toEntity()).toList();
  }

  @override
  Future<List<PostEntity>> fetchPosts({
    required int from,
    required int to,
    required String userId,
  }) async {
    final dtos = await _dataSource.fetchPosts(from: from, to: to);
    return dtos.map((dto) {
      final bookmarks = (dto as dynamic).bookmarks as List?;
      final isMine = bookmarks?.any((b) => b['user_id'] == userId) ?? false;
      return dto.toEntity(isBookmarked: isMine);
    }).toList();
  }

  @override
  Future<bool> toggleBookmark({
    required String userId,
    required String postId,
  }) async {
    final existing = await _dataSource.getBookmark(
      userId: userId,
      postId: postId,
    );
    if (existing != null) {
      await _dataSource.deleteBookmark(userId, postId);
      return false;
    } else {
      await _dataSource.insertBookmark(userId, postId);
      return true;
    }
  }

  @override
  Future<List<PostEntity>> fetchBookmarkedPosts(String userId) async {
    final data = await _dataSource.fetchBookmarkedPosts(userId);
    return data.map((json) {
      final postJson = json['posts'];
      return PostDto.fromJson(postJson).toEntity(isBookmarked: true);
    }).toList();
  }

  @override
  Future<String?> uploadImage(File imageFile, String bucket) async {
    final fileName = '${DateTime.now().millisecondsSinceEpoch}.png';
    final path = 'post_images/$fileName';
    return await _dataSource.uploadImage(imageFile, bucket, path);
  }

  @override
  Future<void> createPost({
    required String title,
    required String ingredient,
    String? imageUrl,
    required String userId,
    required List<int> selectedTagIds,
    required List<Map<String, dynamic>> steps,
  }) async {
    final postData = await _dataSource.createPost({
      'title': title,
      'ingredient': ingredient,
      'image_url': imageUrl,
      'user_id': userId,
    });
    final String postId = postData['id'];

    if (selectedTagIds.isNotEmpty) {
      final tagMaps = selectedTagIds
          .map((id) => {'post_id': postId, 'tag_id': id})
          .toList();
      await _dataSource.insertPostTags(tagMaps);
    }

    if (steps.isNotEmpty) {
      final stepsWithId = steps.map((s) => {...s, 'post_id': postId}).toList();
      await _dataSource.insertRecipeSteps(stepsWithId);
    }
  }
}
