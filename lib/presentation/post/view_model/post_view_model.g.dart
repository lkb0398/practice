// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_view_model.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(PostViewModel)
const postViewModelProvider = PostViewModelProvider._();

final class PostViewModelProvider
    extends $AsyncNotifierProvider<PostViewModel, List<PostEntity>> {
  const PostViewModelProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'postViewModelProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$postViewModelHash();

  @$internal
  @override
  PostViewModel create() => PostViewModel();
}

String _$postViewModelHash() => r'8d0a09dd2c10832739aeac4b207235c840dc6276';

abstract class _$PostViewModel extends $AsyncNotifier<List<PostEntity>> {
  FutureOr<List<PostEntity>> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref =
        this.ref as $Ref<AsyncValue<List<PostEntity>>, List<PostEntity>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<List<PostEntity>>, List<PostEntity>>,
              AsyncValue<List<PostEntity>>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
