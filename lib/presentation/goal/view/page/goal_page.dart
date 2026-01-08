import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:vitameal/core/theme/app_theme.dart';
import 'package:vitameal/presentation/goal/view_model/goals_view_model.dart';
import 'package:vitameal/presentation/ui_provider/goals_provider.dart';
import 'package:vitameal/presentation/widget/button/add_button.dart';
import 'package:vitameal/presentation/widget/dialog/custom_dialog.dart';

class GoalPage extends HookConsumerWidget {
  const GoalPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final goalsAsync = ref.watch(getAllGoalsProvider);

    String formatNumber(double value) {
      if (value % 1 == 0) {
        return value.toInt().toString(); // 소수점 없음
      }
      return value.toString(); // 소수점 있음
    }

    return Scaffold(
      appBar: AppBar(title: Text("건강 목표")),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            /// 제목 행
            Container(
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(color: fxc(context).textcolor200!),
                ),
              ),
              height: 40,
              child: Row(
                children: [
                  SizedBox(width: 100, child: Center(child: Text("목표명"))),
                  Expanded(child: Center(child: Text("목표 수치값"))),
                  SizedBox(
                    width: 100,
                    child: Center(
                      child: Text(
                        "대표설정",
                        style: TextStyle(color: fxc(context).secondary400),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: goalsAsync.when(
                loading: () => const Center(child: CircularProgressIndicator()),
                error: (e, _) => Center(child: Text('에러 발생: $e')),
                data: (goals) {
                  final list = goals ?? [];

                  /// 목표 리스트
                  return ListView.builder(
                    itemCount: list.length + 1,
                    itemBuilder: (context, index) {
                      if (index == list.length) {
                        return Column(
                          spacing: 30,
                          children: [
                            // 목표 없을 때 화면
                            list.isEmpty
                                ? Image.asset(
                                    "assets/images/no_goal.webp",
                                    height: 300,
                                    width: 300,
                                  )
                                : SizedBox.shrink(),

                            /// 목표 추가 버튼
                            AddButton(
                              onTap: () => context.push('/add/goal'),
                              borderColor: fxc(context).secondary400!,
                              text: "목표 추가하기",
                              textColor: fxc(context).secondary400!,
                            ),
                          ],
                        );
                      }

                      /// 목표 리스트
                      final goal = list[index];

                      /// 스와이프 > 수정 페이지 이동 + goalId 전달
                      return Slidable(
                        key: ValueKey(goal.goalId),
                        endActionPane: ActionPane(
                          motion: DrawerMotion(),
                          extentRatio: 0.25,
                          children: [
                            SlidableAction(
                              onPressed: (context) => context.push(
                                '/edit/goal',
                                extra: goal.goalId,
                              ),
                              backgroundColor: Color(0xFFFCA400),
                              icon: Icons.edit,
                            ),
                          ],
                        ),
                        child: InkWell(
                          // 길게 탭 > 대표설정 변경
                          onLongPress: () {
                            if (goal.isDone) return;
                            showDialog(
                              context: context,
                              builder: (context) {
                                return CustomDialog(
                                  tapYes: () async {
                                    // 목표 업데이트
                                    await ref
                                        .read(goalsViewModelProvider.notifier)
                                        .updateGoal(
                                          goalId: goal.goalId!,
                                          goalTitle: goal.goalTitle,
                                          goalUnit: goal.goalUnit,
                                          goalValue: goal.goalValue,
                                          goalDate: goal.goalDate,
                                          isDone: goal.isDone,
                                          isMain: !goal.isMain,
                                        );
                                    // mounted 체크
                                    if (!context.mounted) return;
                                    Navigator.pop(context);
                                    // UI 반영
                                    ref.invalidate(getAllGoalsProvider);
                                  },
                                  title: "대표로 설정할까요?",
                                  yesText: "확인",
                                );
                              },
                            );
                          },
                          // 탭 > 데이터 페이지 이동 + goalId 전달
                          onTap: () =>
                              context.push('/data', extra: goal.goalId),
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border(
                                bottom: BorderSide(
                                  color: fxc(context).textcolor200!,
                                ),
                              ),
                              color: goal.isDone
                                  ? fxc(context).textcolor200!
                                  : null,
                            ),
                            height: 50,
                            child: Row(
                              children: [
                                SizedBox(
                                  width: 100,
                                  child: Center(child: Text(goal.goalTitle)),
                                ),
                                Expanded(
                                  child: Center(
                                    child: Text(
                                      '${formatNumber(goal.goalValue)} ${goal.goalUnit}',
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 100,
                                  child: goal.isDone
                                      ? Icon(Icons.remove)
                                      : goal.isMain
                                      ? Icon(
                                          Icons.check,
                                          color: fxc(context).secondary400,
                                        )
                                      : SizedBox.shrink(),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
