import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:vitameal/presentation/home/view/widget/custom_bottomnavi.dart';
import 'package:vitameal/presentation/info/view/page/info_page.dart';
import 'package:vitameal/presentation/meal_calendar/view/meal_calendar_page.dart';
import 'package:vitameal/presentation/post/view/post_page.dart';
import 'package:vitameal/presentation/ui_provider/home_tab_provider.dart';

class HomePage extends HookConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final index = ref.watch(homeTabProvider);

    final pages = [
      const MealCalendarPage(),
      const PostPage(), // TODO : 레시피 페이지로 바꾸기 - 감사합니다
      const InfoPage(),
    ];

    return Scaffold(
      body: pages[index],
      bottomNavigationBar: CustomBottomNavi(
        currentIndex: index,
        onTap: (i) {
          ref.read(homeTabProvider.notifier).change(i);
        },
      ),
    );
  }
}
