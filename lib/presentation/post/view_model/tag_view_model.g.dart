// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tag_view_model.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(allTags)
const allTagsProvider = AllTagsProvider._();

final class AllTagsProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<TagEntity>>,
          List<TagEntity>,
          FutureOr<List<TagEntity>>
        >
    with $FutureModifier<List<TagEntity>>, $FutureProvider<List<TagEntity>> {
  const AllTagsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'allTagsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$allTagsHash();

  @$internal
  @override
  $FutureProviderElement<List<TagEntity>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<TagEntity>> create(Ref ref) {
    return allTags(ref);
  }
}

String _$allTagsHash() => r'0a0b122526d3c051a2ca69be51ca73e353ac475d';
