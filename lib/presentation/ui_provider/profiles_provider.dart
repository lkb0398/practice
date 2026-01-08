import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:vitameal/core/config/routes.dart';
import 'package:vitameal/core/di/provider.dart';
import 'package:vitameal/domain/entity/allergies_entity.dart';
import 'package:vitameal/domain/entity/diseases_entity.dart';
import 'package:vitameal/domain/entity/profiles_entity.dart';

part 'profiles_provider.g.dart';

/// 현재 로그인된 userId 가져오기 Provider
@riverpod
String userId(Ref ref) {
  return Supabase.instance.client.auth.currentUser!.id;
}

/// 현재 router location 얻기 Provider
@riverpod
String routerLocation(Ref ref) {
  final router = ref.watch(routerProvider);
  final configuration = router.routerDelegate.currentConfiguration;
  if (configuration.routes.isEmpty) {
    return '/';
  }
  return configuration.last.matchedLocation;
}

/// 수정모드 여부 Provider
@riverpod
bool isEditFlow(Ref ref) {
  final location = ref.watch(routerLocationProvider);
  return location.startsWith('/edit');
}

/// 온보딩 완료여부 Provider
@riverpod
class OnboardingState extends _$OnboardingState {
  @override
  bool build() => false;
  void set(bool value) => state = value;
}

@riverpod
Future<bool> onboardingCompleted(Ref ref) async {
  final userId = ref.read(userIdProvider);
  final profile = await ref
      .read(profilesRepositoryProvider)
      .getMyProfile(userId);
  return profile?.onboardingCompleted ?? false;
}

/// 사용자 정보 읽기 전용 Provider
@riverpod
Future<ProfilesEntity?> myProfile(Ref ref) async {
  final userId = ref.read(userIdProvider);
  return ref.read(profilesRepositoryProvider).getMyProfile(userId);
}

@riverpod
Future<List<DiseasesEntity>> diseasesList(Ref ref) {
  return ref.read(diseasesRepositoryProvider).getAllDiseases();
}

@riverpod
Future<List<String>> userSelectedDiseases(Ref ref) async {
  final userId = ref.read(userIdProvider);
  return ref.read(userDiseasesRepositoryProvider).getUserDiseaseNames(userId);
}

@riverpod
Future<List<AllergiesEntity>> allergiesList(Ref ref) {
  return ref.read(allergiesRepositoryProvider).getAllAllergies();
}

@riverpod
Future<List<String>> userSelectedAllergies(Ref ref) async {
  final userId = ref.read(userIdProvider);
  return ref.read(userAllergiesRepositoryProvider).getUserAllergyNames(userId);
}
