import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:vitameal/core/config/routes.dart';
import 'package:vitameal/presentation/ui_provider/profiles_provider.dart';
// import 'package:shared_preferences/shared_preferences.dart';
import 'package:vitameal/core/theme/app_theme.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SplashPage extends HookConsumerWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeVrc = vrc(context);
    final themeFxc = fxc(context);

    final hasNavigated = useRef(false);

    useEffect(() {
      Future.microtask(() async {
        // 이미 네비게이션 수행되었으면 중복 실행 방지
        if (hasNavigated.value) return;
        try {
          // 최소 2초간 스플래시 유지
          await Future.delayed(const Duration(seconds: 2));

          // 로그인 여부 확인
          final session = Supabase.instance.client.auth.currentSession;

          if (!context.mounted) return;

          // 로그인 X > 로그인 페이지 이동
          if (session == null) {
            hasNavigated.value = true;
            context.go(AppRoutePath.login);
            return;
          }

          // 앱 최초 실행 여부
          // final prefs = await SharedPreferences.getInstance();
          // final isFirstRun = prefs.getBool('is_first_run') ?? true;

          // if (isFirstRun) {
          //   await prefs.setBool('is_first_run', false); // 다음 실행부터는 false
          //   hasNavigated.value = true;
          //   if (context.mounted) context.go(AppRoutePath.intro);
          //   return;
          // }

          // 온보딩 X > 온보딩 페이지 이동
          final isOnboarded = await ref.read(
            onboardingCompletedProvider.future,
          );
          if (!context.mounted) return;

          hasNavigated.value = true;
          if (!isOnboarded) {
            // 로그인 O & 온보딩 X > 온보딩 페이지 이동
            context.go(AppRoutePath.intro);
          } else {
            // 로그인 O & 온보딩 O > 홈페이지 이동
            context.go(AppRoutePath.home);
          }
        } catch (e) {
          // 에러 발생 > 로그인 페이지 이동
          debugPrint("SplashPage 초기화 중 에러: $e");
          if (context.mounted) {
            hasNavigated.value = true;
            context.go(AppRoutePath.login);
          }
        }
      });

      return null;
    }, const []);

    // 로고
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset('assets/images/logo.svg', height: 124, width: 162),
            const SizedBox(height: 40),
            // 로고 아래 연한 로딩 인디케이ㅌㅓ
            SizedBox(
              width: 24,
              height: 24,
              child: CircularProgressIndicator(
                strokeWidth: 2,
                valueColor: AlwaysStoppedAnimation<Color>(
                  themeFxc.primary400!.withOpacity(0.5),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
