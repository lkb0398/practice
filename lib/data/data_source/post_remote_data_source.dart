import 'dart:io';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:vitameal/data/dto/tag_dto.dart';
import '../dto/post_dto.dart';

// 1. 인터페이스 (규격)
abstract class PostRemoteDataSource {
  Future<List<PostDto>> fetchPosts({required int from, required int to});
  Future<Map<String, dynamic>?> getBookmark({
    required String userId,
    required String postId,
  });
  Future<void> insertBookmark(String userId, String postId);
  Future<void> deleteBookmark(String userId, String postId);
  Future<List<Map<String, dynamic>>> fetchBookmarkedPosts(String userId);
  Future<String> uploadImage(File file, String bucket, String path);
  Future<Map<String, dynamic>> createPost(Map<String, dynamic> postMap);
  Future<void> insertPostTags(List<Map<String, dynamic>> tagData);
  Future<void> insertRecipeSteps(List<Map<String, dynamic>> stepsData);
  Future<List<TagDto>> fetchAllTags();
}

// 2. 실제 구현부 (Impl)
class PostRemoteDataSourceImpl implements PostRemoteDataSource {
  final SupabaseClient _client;
  PostRemoteDataSourceImpl(this._client);

  @override
  Future<List<TagDto>> fetchAllTags() async {
    final response = await _client.from('tags').select().order('id');
    return (response as List).map((json) => TagDto.fromJson(json)).toList();
  }

  @override
  Future<List<PostDto>> fetchPosts({required int from, required int to}) async {
    final response = await _client
        .from('posts')
        .select('*, recipe_steps(*), post_bookmarks(user_id)')
        .order('created_at', ascending: false)
        .range(from, to);
    return (response as List).map((json) => PostDto.fromJson(json)).toList();
  }

  @override
  Future<Map<String, dynamic>?> getBookmark({
    required String userId,
    required String postId,
  }) async {
    return await _client.from('post_bookmarks').select().match({
      'user_id': userId,
      'post_id': postId,
    }).maybeSingle();
  }

  @override
  Future<void> insertBookmark(String userId, String postId) async {
    await _client.from('post_bookmarks').insert({
      'user_id': userId,
      'post_id': postId,
    });
  }

  @override
  Future<void> deleteBookmark(String userId, String postId) async {
    await _client.from('post_bookmarks').delete().match({
      'user_id': userId,
      'post_id': postId,
    });
  }

  @override
  Future<List<Map<String, dynamic>>> fetchBookmarkedPosts(String userId) async {
    final response = await _client
        .from('post_bookmarks')
        .select('posts(*, recipe_steps(*))')
        .eq('user_id', userId);
    return List<Map<String, dynamic>>.from(response);
  }

  @override
  Future<String> uploadImage(File file, String bucket, String path) async {
    await _client.storage.from(bucket).upload(path, file);
    return _client.storage.from(bucket).getPublicUrl(path);
  }

  @override
  Future<Map<String, dynamic>> createPost(Map<String, dynamic> postMap) async {
    return await _client.from('posts').insert(postMap).select().single();
  }

  @override
  Future<void> insertPostTags(List<Map<String, dynamic>> tagData) async {
    await _client.from('post_tags').insert(tagData);
  }

  @override
  Future<void> insertRecipeSteps(List<Map<String, dynamic>> stepsData) async {
    await _client.from('recipe_steps').insert(stepsData);
  }
}
