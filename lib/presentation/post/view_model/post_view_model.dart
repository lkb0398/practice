import 'dart:io';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:vitameal/presentation/ui_provider/profiles_provider.dart';
import '../../../domain/entity/post_entity.dart';
import '../../../core/di/provider.dart';

part 'post_view_model.g.dart';

@riverpod
class PostViewModel extends _$PostViewModel {
  // 페이징 및 상태 관리를 위한 변수
  bool _hasNextPage = true;
  int _currentPage = 0;
  final int _pageSize = 20;

  @override
  Future<List<PostEntity>> build() async {
    ref.watch(userIdProvider);
    // 초기 데이터 로드 (0번 페이지)
    return await _fetchPosts(0);
  }

  /// 공통 데이터 페칭 로직
  Future<List<PostEntity>> _fetchPosts(int page) async {
    final repository = ref.read(postRepositoryProvider);
    final userId = (ref.watch(supabaseClientProvider).auth.currentUser?.id)
        .toString();

    final from = page * _pageSize;
    final to = from + _pageSize - 1;

    return await repository.fetchPosts(from: from, to: to, userId: userId);
  }

  /// 다음 페이지 로드 (무한 스크롤)
  Future<void> fetchNextPage() async {
    if (state.isLoading || !_hasNextPage) return;

    final previousState = state.value ?? [];

    try {
      _currentPage++;
      final nextPosts = await _fetchPosts(_currentPage);

      if (nextPosts.length < _pageSize) {
        _hasNextPage = false;
      }

      state = AsyncValue.data([...previousState, ...nextPosts]);
    } catch (e, stack) {
      state = AsyncValue.error(e, stack);
    }
  }

  /// 북마크 토글 (낙관적 업데이트 적용)
  Future<void> toggleBookmark(String postId) async {
    final userId = ref.read(userIdProvider);
    final repository = ref.read(postRepositoryProvider);

    final previousState = state.value ?? [];

    // 1. UI 즉시 반영
    state = AsyncValue.data(
      previousState.map((post) {
        if (post.id == postId) {
          return post.copyWith(isBookmarked: !post.isBookmarked);
        }
        return post;
      }).toList(),
    );

    try {
      // 2. 서버 통신
      await repository.toggleBookmark(userId: userId, postId: postId);
    } catch (e) {
      // 실패 시 원래 상태로 복구 (재조회)
      ref.invalidateSelf();
    }
  }

  /// 새 레시피 추가
  Future<void> addPost({
    required String title,
    required String ingredient,
    File? imageFile,
    required List<int> selectedTagIds,
    required List<Map<String, dynamic>> steps,
  }) async {
    // 필수 데이터 검증
    if (title.trim().isEmpty || ingredient.trim().isEmpty) {
      throw Exception('제목과 재료를 모두 입력해주세요.');
    }

    state = const AsyncValue.loading();
    final repository = ref.read(postRepositoryProvider);
    final userId = ref.read(userIdProvider);

    try {
      // 1. 대표 이미지 업로드 (PostRepositoryImpl의 post_images 경로 활용)
      String? imageUrl;
      if (imageFile != null) {
        // bucket 이름은 Supabase 설정에 맞춰 'meal-images' 혹은 'posts'로 확인 필요
        imageUrl = await repository.uploadImage(
          imageFile,
          "post-images",
          userId,
        );
      }

      // 2. 게시글 및 레시피 단계 생성
      await repository.createPost(
        title: title,
        ingredient: ingredient,
        imageUrl: imageUrl,
        userId: userId,
        selectedTagIds: selectedTagIds,
        steps: steps,
      );

      // 3. 성공 시 상태 초기화 및 목록 새로고침
      _currentPage = 0;
      _hasNextPage = true;
      ref.invalidateSelf();
    } catch (e, stack) {
      state = AsyncValue.error(e, stack);
      rethrow;
    }
  }
}
