import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:go_router/go_router.dart'; // GoRouter 임포트 추가
import 'package:vitameal/core/config/routes.dart';
import 'package:vitameal/presentation/post/view_model/tag_view_model.dart';
import '../view_model/post_view_model.dart';

class PostPage extends HookConsumerWidget {
  const PostPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final postAsync = ref.watch(postViewModelProvider);
    final scrollController = useScrollController();

    final allTagsAsync = ref.watch(allTagsProvider);
    final selectedTagIds = useState<List<int>>([]);

    useEffect(() {
      void listener() {
        if (scrollController.position.pixels >=
            scrollController.position.maxScrollExtent - 200) {
          ref.read(postViewModelProvider.notifier).fetchNextPage();
        }
      }

      scrollController.addListener(listener);
      return () => scrollController.removeListener(listener);
    }, [scrollController]);

    return Scaffold(
      appBar: AppBar(
        title: const Text("레시피 피드"),
        actions: [
          IconButton(
            icon: const Icon(Icons.bookmark, color: Color(0xFF89CC00)),
            onPressed: () => context.push('/bookmark'), // GoRouter 방식으로 변경
          ),
          const SizedBox(width: 10),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            SizedBox(
              height: 42,
              child: TextField(
                decoration: InputDecoration(
                  hintText: "원하는 레시피를 검색해보세요.",
                  suffixIcon: const Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 24),
            allTagsAsync.when(
              data: (tags) => SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: tags.map((tag) {
                    final isSelected = selectedTagIds.value.contains(tag.id);
                    return Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: ChoiceChip(
                        showCheckmark: false,
                        label: Text(
                          "#${tag.name}", // DB의 태그 이름 사용
                          style: TextStyle(
                            color: const Color(0xFF669900),
                            fontWeight: isSelected
                                ? FontWeight.bold
                                : FontWeight.normal,
                          ),
                        ),
                        selected: isSelected,
                        onSelected: (selected) {
                          if (selected) {
                            selectedTagIds.value = [
                              ...selectedTagIds.value,
                              tag.id,
                            ];
                          } else {
                            selectedTagIds.value = selectedTagIds.value
                                .where((id) => id != tag.id)
                                .toList();
                          }
                          // 💡 추가 팁: 여기서 선택된 태그 ID들로 포스트 필터링 기능을 추가할 수 있습니다.
                        },
                        selectedColor: const Color(0xFFD2F291),
                        backgroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                          side: const BorderSide(color: Color(0xFF89CC00)),
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
              loading: () => const SizedBox(
                height: 42,
                child: Center(child: CircularProgressIndicator(strokeWidth: 2)),
              ),
              error: (err, _) => const Text("태그 로드 실패"),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: postAsync.when(
                data: (posts) => ListView.separated(
                  controller: scrollController,
                  itemCount: posts.length,
                  itemBuilder: (context, index) {
                    final post = posts[index];
                    return GestureDetector(
                      onTap: () => context.push(
                        '/detail',
                        extra: post,
                      ), // GoRouter 상세 페이지 이동
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        child: Row(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child:
                                  post.imageUrl != null &&
                                      post.imageUrl!.isNotEmpty
                                  ? Image.network(
                                      post.imageUrl!,
                                      width: 96,
                                      height: 96,
                                      fit: BoxFit.cover,
                                      // 🔔 에러 발생 시(400 에러 포함) 보여줄 기본 이미지 설정
                                      errorBuilder:
                                          (context, error, stackTrace) {
                                            return Image.asset(
                                              "assets/images/profile2.png",
                                              width: 96,
                                              height: 96,
                                              fit: BoxFit.cover,
                                            );
                                          },
                                    )
                                  : Image.asset(
                                      "assets/images/profile_image.webp",
                                      width: 96,
                                      height: 96,
                                      fit: BoxFit.cover,
                                    ),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    post.title,
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      const Text(
                                        "작성자",
                                        style: TextStyle(color: Colors.grey),
                                      ),
                                      IconButton(
                                        onPressed: () => ref
                                            .read(
                                              postViewModelProvider.notifier,
                                            )
                                            .toggleBookmark(post.id!),
                                        icon: Icon(
                                          post.isBookmarked
                                              ? Icons.bookmark
                                              : Icons.bookmark_outline,
                                          color: post.isBookmarked
                                              ? const Color(0xFF89CC00)
                                              : Colors.grey,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (context, index) => const Divider(),
                ),
                loading: () => const Center(child: CircularProgressIndicator()),
                error: (err, stack) => Center(child: Text('에러: $err')),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.push(AppRoutePath.editPost),
        backgroundColor: const Color(0xFF89CC00),
        child: const Icon(Icons.edit, color: Colors.white),
      ),
    );
  }
}
