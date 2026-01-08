import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:vitameal/core/theme/app_theme.dart';
import 'package:vitameal/presentation/auth/view_model/auth_view_model.dart';
import 'package:go_router/go_router.dart';
import 'package:vitameal/presentation/setting/view/widgets/custom_dialog.dart';
import 'package:vitameal/presentation/setting/view/widgets/menu_item.dart';

class SettingPage extends HookConsumerWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeVrc = vrc(context);
    final themeFxc = fxc(context);

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        leadingWidth: 64,
        leading: Padding(
          padding: const EdgeInsets.only(left: 16.0),
          child: IconButton(
            icon: Icon(
              Icons.arrow_back_ios_new,
              color: themeVrc.text,
              size: 28,
            ),
            onPressed: () => Navigator.maybePop(context),
          ),
        ),
        title: Text(
          "메뉴",
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w400,
            color: themeVrc.text,
          ),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            MenuItem(
              onTap: () {
                // TODO : 페이지 연결
                // context.go('/language');
              },
              title: "언어 설정",
              showArrow: true,
            ),
            const SizedBox(height: 3),

            MenuItem(
              onTap: () => context.push('/noti'),
              title: "알림 설정",
              showArrow: true,
            ),
            const SizedBox(height: 3),

            MenuItem(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) => CustomDialog(
                    title: "로그아웃 하시겠습니까?",
                    cancelText: "취소",
                    confirmText: "확인",
                    confirmColor: themeFxc.secondary400,
                    onCancel: () => Navigator.pop(context),
                    onConfirm: () async {
                      Navigator.pop(context);
                      await ref.read(authViewModelProvider.notifier).logout();
                    },
                  ),
                );
              },
              title: "로그아웃",
            ),
            const SizedBox(height: 3),

            MenuItem(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) => CustomDialog(
                    title: "정말 탈퇴하시겠습니까?",
                    titleFontFamily: 'Inter',
                    content: "탈퇴 시 데이터가 모두 삭제되며 복구되지 않습니다.",
                    cancelText: "탈퇴하기",
                    confirmText: "유지하기",
                    confirmColor: themeFxc.primary400,
                    reverseButtons: true,
                    onCancel: () async {
                      Navigator.pop(context);
                      await ref
                          .read(authViewModelProvider.notifier)
                          .withdraw(
                            onError: () {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text("회원 탈퇴 중 오류가 발생했습니다."),
                                ),
                              );
                            },
                          );
                    },
                    onConfirm: () => Navigator.pop(context),
                  ),
                );
              },
              title: "회원 탈퇴",
            ),
          ],
        ),
      ),
    );
  }
}
