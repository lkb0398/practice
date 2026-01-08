// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notifications_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// 전체 알람 가져오기 Provider

@ProviderFor(getAllNotis)
const getAllNotisProvider = GetAllNotisProvider._();

/// 전체 알람 가져오기 Provider

final class GetAllNotisProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<NotificationsEntity>?>,
          List<NotificationsEntity>?,
          FutureOr<List<NotificationsEntity>?>
        >
    with
        $FutureModifier<List<NotificationsEntity>?>,
        $FutureProvider<List<NotificationsEntity>?> {
  /// 전체 알람 가져오기 Provider
  const GetAllNotisProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'getAllNotisProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$getAllNotisHash();

  @$internal
  @override
  $FutureProviderElement<List<NotificationsEntity>?> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<NotificationsEntity>?> create(Ref ref) {
    return getAllNotis(ref);
  }
}

String _$getAllNotisHash() => r'572805f956caefc8b568707cf2bbe53104c8d957';
