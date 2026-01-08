import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:vitameal/core/config/routes.dart';
import 'package:vitameal/presentation/intro/model/intro_content.dart';
import 'package:vitameal/presentation/intro/view/widgets/intro_controls.dart';
import 'package:vitameal/presentation/intro/view/widgets/intro_item.dart';

class IntroPage extends HookConsumerWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pageController = usePageController();
    final currentPage = useState(0);

    final introItems = [
      IntroContent(
        title: "오늘의 식단을\n손쉽게 기록해 보세요",
        highlight: "기록",
        image: "assets/images/intro_1.png",
      ),
      IntroContent(
        title: "식사 알림으로\n내 건강정보를 한눈에",
        highlight: "건강정보",
        image: "assets/images/intro_2.png",
      ),
      IntroContent(
        title: "나만의 건강 레시피를\n사람들과 공유해요",
        highlight: "건강 레시피",
        image: "assets/images/intro_3.png",
      ),
      IntroContent(
        title: "위젯으로 식단 관리를\n더욱 더 간편하게",
        highlight: "위젯",
        image: "assets/images/intro_4.png",
      ),
    ];

    void navigateToOnboarding() => context.go(AppRoutePath.onboardingProfile);

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            // 슬라이더 영역
            Expanded(
              child: PageView.builder(
                controller: pageController,
                onPageChanged: (value) => currentPage.value = value,
                itemCount: introItems.length,
                itemBuilder: (context, index) =>
                    IntroItem(item: introItems[index]),
              ),
            ),
            // 하단 컨트롤 영역
            IntroControls(
              itemsCount: introItems.length,
              currentIndex: currentPage.value,
              onNext: () {
                if (currentPage.value < introItems.length - 1) {
                  pageController.nextPage(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                  );
                } else {
                  navigateToOnboarding();
                }
              },
              onSkip: navigateToOnboarding,
            ),
          ],
        ),
      ),
    );
  }
}
