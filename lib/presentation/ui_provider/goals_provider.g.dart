// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'goals_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// 전체 목표 가져오기 Provider

@ProviderFor(getAllGoals)
const getAllGoalsProvider = GetAllGoalsProvider._();

/// 전체 목표 가져오기 Provider

final class GetAllGoalsProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<GoalsEntity>?>,
          List<GoalsEntity>?,
          FutureOr<List<GoalsEntity>?>
        >
    with
        $FutureModifier<List<GoalsEntity>?>,
        $FutureProvider<List<GoalsEntity>?> {
  /// 전체 목표 가져오기 Provider
  const GetAllGoalsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'getAllGoalsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$getAllGoalsHash();

  @$internal
  @override
  $FutureProviderElement<List<GoalsEntity>?> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<GoalsEntity>?> create(Ref ref) {
    return getAllGoals(ref);
  }
}

String _$getAllGoalsHash() => r'0a643bdc144f0314f36a8bcba4eec8c132404ade';

/// 특정 목표 가져오기 Provider

@ProviderFor(getGoal)
const getGoalProvider = GetGoalFamily._();

/// 특정 목표 가져오기 Provider

final class GetGoalProvider
    extends $FunctionalProvider<GoalsEntity?, GoalsEntity?, GoalsEntity?>
    with $Provider<GoalsEntity?> {
  /// 특정 목표 가져오기 Provider
  const GetGoalProvider._({
    required GetGoalFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'getGoalProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$getGoalHash();

  @override
  String toString() {
    return r'getGoalProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $ProviderElement<GoalsEntity?> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  GoalsEntity? create(Ref ref) {
    final argument = this.argument as String;
    return getGoal(ref, argument);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(GoalsEntity? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<GoalsEntity?>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is GetGoalProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$getGoalHash() => r'e17ec3203137bbd93b5cfede02ed2f02ac1be072';

/// 특정 목표 가져오기 Provider

final class GetGoalFamily extends $Family
    with $FunctionalFamilyOverride<GoalsEntity?, String> {
  const GetGoalFamily._()
    : super(
        retry: null,
        name: r'getGoalProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  /// 특정 목표 가져오기 Provider

  GetGoalProvider call(String goalId) =>
      GetGoalProvider._(argument: goalId, from: this);

  @override
  String toString() => r'getGoalProvider';
}

/// 대표 설정된 목표 가져오기 Provider

@ProviderFor(getMainGoal)
const getMainGoalProvider = GetMainGoalProvider._();

/// 대표 설정된 목표 가져오기 Provider

final class GetMainGoalProvider
    extends $FunctionalProvider<GoalsEntity?, GoalsEntity?, GoalsEntity?>
    with $Provider<GoalsEntity?> {
  /// 대표 설정된 목표 가져오기 Provider
  const GetMainGoalProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'getMainGoalProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$getMainGoalHash();

  @$internal
  @override
  $ProviderElement<GoalsEntity?> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  GoalsEntity? create(Ref ref) {
    return getMainGoal(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(GoalsEntity? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<GoalsEntity?>(value),
    );
  }
}

String _$getMainGoalHash() => r'8a520d44dfa874f9dfd6499ea890f39894b4768f';

/// 특정 목표의 전체 데이터 가져오기 Provider

@ProviderFor(getGoalDatas)
const getGoalDatasProvider = GetGoalDatasFamily._();

/// 특정 목표의 전체 데이터 가져오기 Provider

final class GetGoalDatasProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<GoalDatasEntity>?>,
          List<GoalDatasEntity>?,
          FutureOr<List<GoalDatasEntity>?>
        >
    with
        $FutureModifier<List<GoalDatasEntity>?>,
        $FutureProvider<List<GoalDatasEntity>?> {
  /// 특정 목표의 전체 데이터 가져오기 Provider
  const GetGoalDatasProvider._({
    required GetGoalDatasFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'getGoalDatasProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$getGoalDatasHash();

  @override
  String toString() {
    return r'getGoalDatasProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<List<GoalDatasEntity>?> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<GoalDatasEntity>?> create(Ref ref) {
    final argument = this.argument as String;
    return getGoalDatas(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is GetGoalDatasProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$getGoalDatasHash() => r'1c4af42b2c4214c14eb54759b2a004b10d36f113';

/// 특정 목표의 전체 데이터 가져오기 Provider

final class GetGoalDatasFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<List<GoalDatasEntity>?>, String> {
  const GetGoalDatasFamily._()
    : super(
        retry: null,
        name: r'getGoalDatasProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  /// 특정 목표의 전체 데이터 가져오기 Provider

  GetGoalDatasProvider call(String goalId) =>
      GetGoalDatasProvider._(argument: goalId, from: this);

  @override
  String toString() => r'getGoalDatasProvider';
}

/// 대표 설정한 목표의 데이터 가져오기 Provider

@ProviderFor(getMainGoalDatas)
const getMainGoalDatasProvider = GetMainGoalDatasProvider._();

/// 대표 설정한 목표의 데이터 가져오기 Provider

final class GetMainGoalDatasProvider
    extends
        $FunctionalProvider<
          List<GoalDatasEntity>?,
          List<GoalDatasEntity>?,
          List<GoalDatasEntity>?
        >
    with $Provider<List<GoalDatasEntity>?> {
  /// 대표 설정한 목표의 데이터 가져오기 Provider
  const GetMainGoalDatasProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'getMainGoalDatasProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$getMainGoalDatasHash();

  @$internal
  @override
  $ProviderElement<List<GoalDatasEntity>?> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  List<GoalDatasEntity>? create(Ref ref) {
    return getMainGoalDatas(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<GoalDatasEntity>? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<GoalDatasEntity>?>(value),
    );
  }
}

String _$getMainGoalDatasHash() => r'1cb9423963bb975003787eb0b2e0c0047f9b4887';

@ProviderFor(oldestMainGoalData)
const oldestMainGoalDataProvider = OldestMainGoalDataProvider._();

final class OldestMainGoalDataProvider
    extends
        $FunctionalProvider<
          GoalDatasEntity?,
          GoalDatasEntity?,
          GoalDatasEntity?
        >
    with $Provider<GoalDatasEntity?> {
  const OldestMainGoalDataProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'oldestMainGoalDataProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$oldestMainGoalDataHash();

  @$internal
  @override
  $ProviderElement<GoalDatasEntity?> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  GoalDatasEntity? create(Ref ref) {
    return oldestMainGoalData(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(GoalDatasEntity? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<GoalDatasEntity?>(value),
    );
  }
}

String _$oldestMainGoalDataHash() =>
    r'bcfc087cc832c3845effdcb0511968515f2aa9f0';

@ProviderFor(latestMainGoalData)
const latestMainGoalDataProvider = LatestMainGoalDataProvider._();

final class LatestMainGoalDataProvider
    extends
        $FunctionalProvider<
          GoalDatasEntity?,
          GoalDatasEntity?,
          GoalDatasEntity?
        >
    with $Provider<GoalDatasEntity?> {
  const LatestMainGoalDataProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'latestMainGoalDataProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$latestMainGoalDataHash();

  @$internal
  @override
  $ProviderElement<GoalDatasEntity?> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  GoalDatasEntity? create(Ref ref) {
    return latestMainGoalData(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(GoalDatasEntity? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<GoalDatasEntity?>(value),
    );
  }
}

String _$latestMainGoalDataHash() =>
    r'55c04a3bd477e6633ad8d8ca2394de9cc20099c5';

@ProviderFor(latest5MainGoalDatas)
const latest5MainGoalDatasProvider = Latest5MainGoalDatasProvider._();

final class Latest5MainGoalDatasProvider
    extends
        $FunctionalProvider<
          List<GoalDatasEntity>?,
          List<GoalDatasEntity>?,
          List<GoalDatasEntity>?
        >
    with $Provider<List<GoalDatasEntity>?> {
  const Latest5MainGoalDatasProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'latest5MainGoalDatasProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$latest5MainGoalDatasHash();

  @$internal
  @override
  $ProviderElement<List<GoalDatasEntity>?> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  List<GoalDatasEntity>? create(Ref ref) {
    return latest5MainGoalDatas(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<GoalDatasEntity>? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<GoalDatasEntity>?>(value),
    );
  }
}

String _$latest5MainGoalDatasHash() =>
    r'd8e46099826f2667e2729365097a3b2c0c6b3612';
