import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:vitameal/core/config/routes.dart';
import 'package:vitameal/presentation/ui_provider/profiles_provider.dart';
import 'package:vitameal/presentation/auth/view_model/auth_view_model.dart';
import 'package:vitameal/presentation/auth/view/widgets/social_login_button.dart';

class LoginPage extends HookConsumerWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // 세션 상태 감시 (로그인 여부)
    final session = ref.watch(authViewModelProvider);
    final vm = ref.watch(authViewModelProvider.notifier);

    final double horizontalPadding = MediaQuery.of(context).size.width * 0.07;

    // 로그인 성공 이후 라우팅 처리
    useEffect(() {
      if (session == null) return null;
      Future.microtask(() async {
        if (!context.mounted) return;
        final isOnboarded = await ref.read(onboardingCompletedProvider.future);
        if (!context.mounted) return;
        if (isOnboarded) {
          context.go(AppRoutePath.home); // 온보딩 O > 홈 페이지
        } else {
          context.go(AppRoutePath.intro); // 온보딩 X > 온보딩 페이지
        }
      });
      return null;
    }, [session]);

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Stack(
        children: [
          SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
              child: session != null
                  ? const Center(child: CircularProgressIndicator())
                  : _buildLoginState(context, ref), // ref를 전달하여 내부에서 vm 접근
            ),
          ),

          // 로딩 오버레이 레이어 (로그인 진행 중일 때만 표시)
          if (vm.isLoading)
            Container(
              color: Colors.black.withOpacity(0.3), // 배경을 어둡게 해서 터치 차단
              child: const Center(
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                ),
              ),
            ),
        ],
      ),
    );
  }

  // 로그인 전 상태의 UI
  Widget _buildLoginState(BuildContext context, WidgetRef ref) {
    final vm = ref.read(authViewModelProvider.notifier);

    return Column(
      children: [
        const Spacer(flex: 2),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SvgPicture.asset(
            'assets/images/logo.svg',
            width: MediaQuery.of(context).size.width * 0.45,
            fit: BoxFit.contain,
          ),
        ),

        const Spacer(flex: 2),

        // 애플 로그인
        SocialLoginButton(
          label: 'Apple 로그인',
          backgroundColor: Colors.black,
          textColor: Colors.white,
          fontFamily: 'SF Pro',
          iconPath: 'assets/images/apple_icon.svg',
          iconWidth: 14,
          iconHeight: 17,
          // 로딩 중이면 버튼 클릭 무시
          onPressed: vm.isLoading ? () {} : () => vm.login(OAuthProvider.apple),
        ),
        const SizedBox(height: 12),

        // 카카오 로그인
        SocialLoginButton(
          label: 'Kakao 로그인',
          backgroundColor: const Color(0xfffee500),
          textColor: Colors.black.withValues(alpha: 0.85),
          fontFamily: 'Apple SD Gothic Neo',
          height: 1.50,
          iconPath: 'assets/images/kakao_icon.svg',
          iconWidth: 18,
          iconHeight: 16.8,
          onPressed: vm.isLoading ? () {} : () => vm.login(OAuthProvider.kakao),
        ),
        const SizedBox(height: 12),

        // 구글 로그인
        SocialLoginButton(
          label: 'Google 로그인',
          backgroundColor: const Color(0xfff2f2f2),
          textColor: Colors.black,
          fontFamily: 'ROBOTO',
          fontWeight: FontWeight.w500,
          iconPath: 'assets/images/google_icon.svg',
          iconWidth: 20,
          iconHeight: 20,
          onPressed: vm.isLoading
              ? () {}
              : () => vm.login(OAuthProvider.google),
        ),

        const Spacer(flex: 2),
      ],
    );
  }
}
