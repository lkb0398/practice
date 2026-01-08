import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:vitameal/data/data_source/allergies_data_source.dart';
import 'package:vitameal/data/data_source/diseases_data_source.dart';
import 'package:vitameal/data/data_source/meal_analysis_data_source.dart';
import 'package:vitameal/data/data_source/meal_local_data_source.dart';
import 'package:vitameal/data/data_source/meal_remote_data_source.dart';
import 'package:vitameal/data/data_source/post_remote_data_source.dart';
import 'package:vitameal/data/data_source/profiles_data_source.dart';
import 'package:vitameal/data/data_source/storage_data_source.dart';
import 'package:vitameal/data/data_source/user_allergies_data_source.dart';
import 'package:vitameal/data/data_source/user_diseases_data_source.dart';
import 'package:vitameal/data/data_source/goal_datas_data_source.dart';
import 'package:vitameal/data/database/database.dart';
import 'package:vitameal/data/repository_impl/meal_analysis_repository_impl.dart';
import 'package:vitameal/data/repository_impl/meal_repository_impl.dart';
import 'package:vitameal/data/repository_impl/post_repository_impl.dart';
import 'package:vitameal/data/repository_impl/storage_repository_impl.dart';
import 'package:vitameal/data/service/sync_service.dart';
import 'package:vitameal/domain/repository/goal_datas_repository.dart';
import 'package:vitameal/data/repository_impl/goal_datas_repository_impl.dart';
import 'package:vitameal/data/data_source/goals_data_source.dart';
import 'package:vitameal/data/repository_impl/allergies_repository_impl.dart';
import 'package:vitameal/data/repository_impl/diseases_repository_impl.dart';
import 'package:vitameal/data/repository_impl/profiles_repository_impl.dart';
import 'package:vitameal/data/repository_impl/user_allergies_repository_impl.dart';
import 'package:vitameal/data/repository_impl/user_diseases_repository_impl.dart';
import 'package:vitameal/domain/repository/allergies_repository.dart';
import 'package:vitameal/domain/repository/diseases_repository.dart';
import 'package:vitameal/domain/repository/meal_analysis_repository.dart';
import 'package:vitameal/domain/repository/meal_repository.dart';
import 'package:vitameal/domain/repository/post_repository.dart';
import 'package:vitameal/domain/repository/profiles_repository.dart';
import 'package:vitameal/domain/repository/storage_repository.dart';
import 'package:vitameal/domain/repository/user_allergies_repository.dart';
import 'package:vitameal/domain/repository/user_diseases_repository.dart';
import 'package:vitameal/domain/repository/goals_repository.dart';
import 'package:vitameal/data/repository_impl/goals_repository_impl.dart';
import 'package:vitameal/data/data_source/auth_data_source.dart';
import 'package:vitameal/data/repository_impl/auth_repository_impl.dart';
import 'package:vitameal/domain/repository/auth_repository.dart';
import 'package:vitameal/domain/usecase/login_usecase.dart';
import 'package:vitameal/domain/usecase/logout_usecase.dart';
import 'package:vitameal/data/data_source/notifications_data_source.dart';
import 'package:vitameal/domain/repository/notifications_repository.dart';
import 'package:vitameal/data/repository_impl/notifications_repository_impl.dart';

part 'provider.g.dart';

// 🤍 Supabase Client
@riverpod
SupabaseClient supabaseClient(Ref ref) {
  return Supabase.instance.client;
}

// 🤍 Drift Database
@Riverpod(keepAlive: true)
AppDatabase appDatabase(Ref ref) {
  final database = AppDatabase();
  ref.onDispose(() {
    database.close();
  });
  return database;
}

// 🤍 DataSource
@riverpod
ProfilesDataSource profilesDataSource(Ref ref) {
  final client = ref.read(supabaseClientProvider);
  return ProfilesDataSourceImpl(client);
}

@riverpod
UserDiseasesDataSource userDiseasesDataSource(Ref ref) {
  final client = ref.read(supabaseClientProvider);
  return UserDiseasesDataSourceImpl(client);
}

@riverpod
DiseasesDataSource diseasesDataSource(Ref ref) {
  final client = ref.read(supabaseClientProvider);
  return DiseasesDataSourceImpl(client);
}

@riverpod
UserAllergiesDataSource userAllergiesDataSource(Ref ref) {
  final client = ref.read(supabaseClientProvider);
  return UserAllergiesDataSourceImpl(client);
}

@riverpod
AllergiesDataSource allergiesDataSource(Ref ref) {
  final client = ref.read(supabaseClientProvider);
  return AllergiesDataSourceImpl(client);
}

@riverpod
GoalsDataSource goalsDataSource(Ref ref) {
  final client = ref.read(supabaseClientProvider);
  return GoalsDataSourceImpl(client);
}

@riverpod
GoalDatasDataSource goalDatasDataSource(Ref ref) {
  final client = ref.read(supabaseClientProvider);
  return GoalDatasDataSourceImpl(client);
}

@riverpod
AuthDataSource authDataSource(Ref ref) {
  final client = ref.watch(supabaseClientProvider);
  return AuthDataSource(client);
}

@riverpod
MealLocalDataSource mealLocalDataSource(Ref ref) {
  final database = ref.watch(appDatabaseProvider);
  return MealLocalDataSourceImpl(database);
}

@riverpod
MealRemoteDataSource mealRemoteDataSource(Ref ref) {
  final supabase = ref.watch(supabaseClientProvider);
  return MealRemoteDataSourceImpl(supabase);
}

@riverpod
StorageDataSource storageDataSource(Ref ref) {
  final supabase = ref.watch(supabaseClientProvider);
  return StorageDataSource(supabase);
}

@riverpod
MealAnalysisDataSource mealAnalysisDataSource(Ref ref) {
  final supabase = ref.watch(supabaseClientProvider);
  return MealAnalysisDataSourceImpl(supabase);
}

@riverpod
NotificationDataSource notificationsDataSource(Ref ref) {
  final client = ref.read(supabaseClientProvider);
  return NotificationsDataSourceImpl(client);
}

/// 🤍 Repository
@riverpod
ProfilesRepository profilesRepository(Ref ref) {
  final dataSource = ref.read(profilesDataSourceProvider);
  return ProfilesRepositoryImpl(dataSource);
}

@riverpod
UserDiseasesRepository userDiseasesRepository(Ref ref) {
  final userDiseasesDS = ref.read(userDiseasesDataSourceProvider);
  final diseasesDS = ref.read(diseasesDataSourceProvider);
  return UserDiseasesRepositoryImpl(userDiseasesDS, diseasesDS);
}

@riverpod
DiseasesRepository diseasesRepository(Ref ref) {
  final dataSource = ref.read(diseasesDataSourceProvider);
  return DiseasesRepositoryImpl(dataSource);
}

@riverpod
UserAllergiesRepository userAllergiesRepository(Ref ref) {
  final userAllergiesDS = ref.read(userAllergiesDataSourceProvider);
  final allergiesDS = ref.read(allergiesDataSourceProvider);
  return UserAllergiesRepositoryImpl(userAllergiesDS, allergiesDS);
}

@riverpod
AllergiesRepository allergiesRepository(Ref ref) {
  final dataSource = ref.read(allergiesDataSourceProvider);
  return AllergiesRepositoryImpl(dataSource);
}

@riverpod
GoalsRepository goalsRepository(Ref ref) {
  final dataSource = ref.read(goalsDataSourceProvider);
  return GoalsRepositoryImpl(dataSource);
}

@riverpod
GoalDatasRepository goalDatasRepository(Ref ref) {
  final dataSource = ref.read(goalDatasDataSourceProvider);
  return GoalDatasRepositoryImpl(dataSource);
}

@riverpod
AuthRepository authRepository(Ref ref) {
  final dataSource = ref.watch(authDataSourceProvider);
  return AuthRepositoryImpl(dataSource);
}

@riverpod
MealRepository mealRepository(Ref ref) {
  final localDataSource = ref.watch(mealLocalDataSourceProvider);
  final database = ref.watch(appDatabaseProvider);
  final syncService = ref.watch(syncServiceProvider);

  return MealRepositoryImpl(localDataSource, database, syncService);
}

@riverpod
StorageRepository storageRepository(Ref ref) {
  final storageDataSource = ref.watch(storageDataSourceProvider);
  return StorageRepositoryImpl(storageDataSource);
}

@riverpod
MealAnalysisRepository mealAnalysisRepository(Ref ref) {
  final dataSource = ref.watch(mealAnalysisDataSourceProvider);
  return MealAnalysisRepositoryImpl(dataSource);
}

@riverpod
NotificationsRepository notificationsRepository(Ref ref) {
  final dataSource = ref.read(notificationsDataSourceProvider);
  return NotificationsRepositoryImpl(dataSource);
}

// 포스트
@riverpod
PostRemoteDataSource postRemoteDataSource(Ref ref) {
  final client = ref.watch(supabaseClientProvider);
  // Impl 클래스를 생성해서 인터페이스 타입으로 반환합니다.
  return PostRemoteDataSourceImpl(client);
}

@riverpod
PostRepository postRepository(Ref ref) {
  final dataSource = ref.watch(postRemoteDataSourceProvider);
  return PostRepositoryImpl(dataSource);
}

// 🤍 UseCase
@riverpod
LoginUseCase loginUseCase(Ref ref) {
  return LoginUseCase(ref.watch(authRepositoryProvider));
}

@riverpod
LogoutUseCase logoutUseCase(Ref ref) {
  return LogoutUseCase(ref.watch(authRepositoryProvider));
}

// 🤍 Sync Service
@Riverpod(keepAlive: true)
SyncService syncService(Ref ref) {
  final database = ref.watch(appDatabaseProvider);
  final remoteDataSource = ref.watch(mealRemoteDataSourceProvider);
  final supabase = ref.watch(supabaseClientProvider);

  final service = SyncService(
    database: database,
    remoteDataSource: remoteDataSource,
    supabase: supabase,
    connectivity: Connectivity(),
  );

  // 서비스 시작
  service.start();

  // 앱 종료 시 서비스 중지
  ref.onDispose(() {
    service.stop();
  });
  return service;
}
