// lib/presentation/post/view_model/tag_view_model.dart

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:vitameal/core/di/provider.dart';
import 'package:vitameal/domain/entity/tag_entity.dart';

part 'tag_view_model.g.dart';

@riverpod
Future<List<TagEntity>> allTags(Ref ref) async {
  // AllTagsRef 대신 Ref를 사용해 보세요 (임시 에러 방지)
  return await ref.watch(postRepositoryProvider).fetchAllTags();
}
