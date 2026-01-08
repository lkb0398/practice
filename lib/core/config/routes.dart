import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:vitameal/presentation/goal/view/page/add_goal_page.dart';
import 'package:vitameal/presentation/goal/view/page/data_page.dart';
import 'package:vitameal/presentation/goal/view/page/goal_page.dart';
import 'package:vitameal/presentation/home/view/page/home_page.dart';
import 'package:vitameal/presentation/meal_editor/view/meal_editor_page.dart';
import 'package:vitameal/presentation/notification/view/page/notification_page.dart';
import 'package:vitameal/presentation/onboarding/view/page/onboarding_allergy_page.dart';
import 'package:vitameal/presentation/onboarding/view/page/onboarding_disease_page.dart';
import 'package:vitameal/presentation/onboarding/view/page/onboarding_done_page.dart';
import 'package:vitameal/presentation/onboarding/view/page/onboarding_physical_page.dart';
import 'package:vitameal/presentation/onboarding/view/page/onboarding_profile_page.dart';
import 'package:vitameal/presentation/post/view/edit_post.dart';
import 'package:vitameal/presentation/post/view/post_detail_page.dart';
import 'package:vitameal/presentation/post/view/post_page.dart';
import 'package:vitameal/presentation/setting/view/setting_page.dart';
import 'package:vitameal/presentation/splash/view/splash_page.dart';
import 'package:vitameal/presentation/auth/view/login_page.dart';
import 'package:vitameal/presentation/auth/view_model/auth_view_model.dart';
import 'package:vitameal/presentation/intro/view/intro_page.dart';

class AppRoutePath {
  static const setting = '/setting';
  static const melon = '/melon';
  static const login = '/login';
  static const splash = '/splash';
  static const intro = '/intro';
  static const home = '/';
  // 사용자 정보 입력/수정
  static const noti = '/noti';
  // 사용자 정보 입력
  static const onboardingProfile = '/onboarding/profile';
  static const onboardingPhysical = '/onboarding/physical';
  static const onboardingDisease = '/onboarding/disease';
  static const onboardingAllergy = '/onboarding/allergy';
  static const onboardingDone = '/onboarding/done';
  static const editProfile = '/edit/profile';
  static const editPhysical = '/edit/physical';
  static const editDisease = '/edit/disease';
  static const editAllergy = '/edit/allergy';
  // 목표,데이터 입력/수정
  static const goal = '/goal';
  static const addGoal = '/add/goal';
  static const editGoal = '/edit/goal';
  static const data = '/data';
  // 식단 작성 및 편집 페이지
  static const mealEditor = '/meal-editor';

  // 뭔지 알지?
  static const post = '/post';
  static const editPost = '/edit/post';
}

final routerProvider = Provider<GoRouter>((ref) {
  // authViewModelProvider의 상태(Session?)를 실시간으로 감시
  //  final authState = ref.watch(authViewModelProvider);

  return GoRouter(
    initialLocation: AppRoutePath.splash,

    refreshListenable: _RouterRefreshListenable(ref),

    redirect: (context, state) {
      final session = Supabase.instance.client.auth.currentSession;
      final location = state.matchedLocation;

      print('현재 위치: $location | 세션 존재 여부: ${session != null}');

      // 비로그인 접근 차단
      if (session == null && location != AppRoutePath.login) {
        return AppRoutePath.login;
      }
      return null;
    },

    routes: [
      GoRoute(
        path: AppRoutePath.splash,
        builder: (context, state) => const SplashPage(),
      ),

      GoRoute(
        path: AppRoutePath.login,
        builder: (context, state) => const LoginPage(),
      ),
      GoRoute(
        path: AppRoutePath.intro,
        builder: (context, state) => const IntroPage(),
      ),
      GoRoute(
        path: AppRoutePath.onboardingProfile,
        builder: (context, state) => const OnboardingProfilePage(),
      ),
      GoRoute(
        path: AppRoutePath.onboardingPhysical,
        builder: (context, state) => const OnboardingPhysicalPage(),
      ),
      GoRoute(
        path: AppRoutePath.onboardingDisease,
        builder: (context, state) => const OnboardingDiseasePage(),
      ),
      GoRoute(
        path: AppRoutePath.onboardingAllergy,
        builder: (context, state) => const OnboardingAllergyPage(),
      ),
      GoRoute(
        path: AppRoutePath.onboardingDone,
        builder: (context, state) => const OnboardingDonePage(),
      ),
      GoRoute(
        path: AppRoutePath.editProfile,
        builder: (context, state) => const OnboardingProfilePage(),
      ),
      GoRoute(
        path: AppRoutePath.editPhysical,
        builder: (context, state) => const OnboardingPhysicalPage(),
      ),
      GoRoute(
        path: AppRoutePath.editDisease,
        builder: (context, state) => const OnboardingDiseasePage(),
      ),
      GoRoute(
        path: AppRoutePath.editAllergy,
        builder: (context, state) => const OnboardingAllergyPage(),
      ),
      GoRoute(
        path: AppRoutePath.home,
        builder: (context, state) => const HomePage(),
      ),
      GoRoute(
        path: AppRoutePath.setting,
        builder: (context, state) => const SettingPage(),
      ),
      GoRoute(
        path: AppRoutePath.goal,
        builder: (context, state) => const GoalPage(),
      ),
      GoRoute(
        path: AppRoutePath.addGoal,
        builder: (context, state) => const AddGoalPage(),
      ),
      GoRoute(
        path: AppRoutePath.editGoal,
        builder: (context, state) {
          final goalId = state.extra as String;
          return AddGoalPage(goalId: goalId);
        },
      ),
      GoRoute(
        path: AppRoutePath.data,
        builder: (context, state) {
          final goalId = state.extra as String;
          return DataPage(goalId: goalId);
        },
      ),

      GoRoute(
        path: AppRoutePath.mealEditor,
        builder: (context, state) {
          final extra = state.extra as Map<String, dynamic>?;
          return MealEditorPage(
            mealEntryId: extra?['mealEntryId'] as String?,
            mealDayId: extra?['mealDayId'] as String?,
            date: extra?['date'] as DateTime? ?? DateTime.now(),
          );
        },
      ),
      GoRoute(
        path: AppRoutePath.noti,
        builder: (context, state) => const NotificationPage(),
      ),

      // 포스트
      GoRoute(
        path: AppRoutePath.editPost,
        builder: (context, state) => const EditPost(),
      ),

      GoRoute(
        path: AppRoutePath.post,
        builder: (context, state) => PostPage(),
        routes: [
          GoRoute(
            path: ":id",
            builder: (context, state) {
              final String? pId = state.pathParameters['id'];
              if (pId == null) {
                return PostPage();
              }
              return PostDetailPage(pId: pId);
            },
          ),
        ],
      ),
    ],
  );
});

class _RouterRefreshListenable extends ChangeNotifier {
  _RouterRefreshListenable(Ref ref) {
    // authViewModelProvider의 상태가 변할 때마다 notifyListeners() 호출
    ref.listen(authViewModelProvider, (_, __) => notifyListeners());
  }
}
