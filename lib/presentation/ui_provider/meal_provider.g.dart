// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'meal_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// 선택된 날짜의 MealEntry 목록을 조회하는 프로바이더
/// TODO : 나중에 vm에서 state 클래스로 관리하도록 리펙토링 고려

@ProviderFor(mealEntries)
const mealEntriesProvider = MealEntriesFamily._();

/// 선택된 날짜의 MealEntry 목록을 조회하는 프로바이더
/// TODO : 나중에 vm에서 state 클래스로 관리하도록 리펙토링 고려

final class MealEntriesProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<MealEntryEntity>>,
          List<MealEntryEntity>,
          FutureOr<List<MealEntryEntity>>
        >
    with
        $FutureModifier<List<MealEntryEntity>>,
        $FutureProvider<List<MealEntryEntity>> {
  /// 선택된 날짜의 MealEntry 목록을 조회하는 프로바이더
  /// TODO : 나중에 vm에서 state 클래스로 관리하도록 리펙토링 고려
  const MealEntriesProvider._({
    required MealEntriesFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'mealEntriesProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$mealEntriesHash();

  @override
  String toString() {
    return r'mealEntriesProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<List<MealEntryEntity>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<MealEntryEntity>> create(Ref ref) {
    final argument = this.argument as String;
    return mealEntries(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is MealEntriesProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$mealEntriesHash() => r'75da4b2a16b2b0dbfedcfb0029731050455ec77e';

/// 선택된 날짜의 MealEntry 목록을 조회하는 프로바이더
/// TODO : 나중에 vm에서 state 클래스로 관리하도록 리펙토링 고려

final class MealEntriesFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<List<MealEntryEntity>>, String> {
  const MealEntriesFamily._()
    : super(
        retry: null,
        name: r'mealEntriesProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  /// 선택된 날짜의 MealEntry 목록을 조회하는 프로바이더
  /// TODO : 나중에 vm에서 state 클래스로 관리하도록 리펙토링 고려

  MealEntriesProvider call(String mealDayId) =>
      MealEntriesProvider._(argument: mealDayId, from: this);

  @override
  String toString() => r'mealEntriesProvider';
}

/// 특정 MealDay의 최신 AI 분석 결과를 조회하는 프로바이더
/// TODO : 나중에 vm에서 state 클래스로 관리하도록 리펙토링 고려

@ProviderFor(latestMealAnalysis)
const latestMealAnalysisProvider = LatestMealAnalysisFamily._();

/// 특정 MealDay의 최신 AI 분석 결과를 조회하는 프로바이더
/// TODO : 나중에 vm에서 state 클래스로 관리하도록 리펙토링 고려

final class LatestMealAnalysisProvider
    extends
        $FunctionalProvider<
          AsyncValue<MealAnalysisEntity?>,
          MealAnalysisEntity?,
          FutureOr<MealAnalysisEntity?>
        >
    with
        $FutureModifier<MealAnalysisEntity?>,
        $FutureProvider<MealAnalysisEntity?> {
  /// 특정 MealDay의 최신 AI 분석 결과를 조회하는 프로바이더
  /// TODO : 나중에 vm에서 state 클래스로 관리하도록 리펙토링 고려
  const LatestMealAnalysisProvider._({
    required LatestMealAnalysisFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'latestMealAnalysisProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$latestMealAnalysisHash();

  @override
  String toString() {
    return r'latestMealAnalysisProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<MealAnalysisEntity?> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<MealAnalysisEntity?> create(Ref ref) {
    final argument = this.argument as String;
    return latestMealAnalysis(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is LatestMealAnalysisProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$latestMealAnalysisHash() =>
    r'469deb66027a047e079f5a614b4238faad240ef4';

/// 특정 MealDay의 최신 AI 분석 결과를 조회하는 프로바이더
/// TODO : 나중에 vm에서 state 클래스로 관리하도록 리펙토링 고려

final class LatestMealAnalysisFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<MealAnalysisEntity?>, String> {
  const LatestMealAnalysisFamily._()
    : super(
        retry: null,
        name: r'latestMealAnalysisProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  /// 특정 MealDay의 최신 AI 분석 결과를 조회하는 프로바이더
  /// TODO : 나중에 vm에서 state 클래스로 관리하도록 리펙토링 고려

  LatestMealAnalysisProvider call(String mealDayId) =>
      LatestMealAnalysisProvider._(argument: mealDayId, from: this);

  @override
  String toString() => r'latestMealAnalysisProvider';
}
