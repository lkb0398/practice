import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:vitameal/presentation/info/view/widget/graph.dart';
import 'package:vitameal/presentation/info/view/widget/guage.dart';
import 'package:vitameal/presentation/ui_provider/goals_provider.dart';
import 'package:vitameal/presentation/info/view/widget/bordered_container.dart';

class ViewGoal extends HookConsumerWidget {
  const ViewGoal({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mainGoal = ref.watch(getMainGoalProvider);
    final startData = ref.watch(oldestMainGoalDataProvider);
    final currentData = ref.watch(latestMainGoalDataProvider);
    final current5Datas = ref.watch(latest5MainGoalDatasProvider);

    return Column(
      spacing: 20,
      children: [
        /// 건강 목표
        BorderedContainer(
          title: "건강 목표",
          subtitle: mainGoal != null
              ? '${mainGoal.goalTitle}  ${mainGoal.goalDate.year}.${mainGoal.goalDate.month.toString().padLeft(2, '0')}.${mainGoal.goalDate.day.toString().padLeft(2, '0')}'
              : null,
          onTap: () => context.push('/goal'),
          child: mainGoal != null
              ? Guage(
                  startData: startData,
                  currentData: currentData,
                  targetValue: mainGoal.goalValue,
                )
              : Center(
                  child: Text(
                    "대표 설정한 목표가 없어요 :(",
                    style: TextStyle(fontSize: 16),
                  ),
                ),
        ),

        /// 최근 그래프
        BorderedContainer(
          title: "최근 그래프",
          subtitle: mainGoal != null
              ? '${mainGoal.goalTitle}  ${mainGoal.goalUnit}'
              : null,
          onTap: () {
            mainGoal != null
                ? context.push('/data', extra: mainGoal.goalId)
                : null;
          },
          child: mainGoal != null
              ? Graph(datas: current5Datas ?? [])
              : Center(
                  child: Text("데이터를 추가해 주세요.", style: TextStyle(fontSize: 16)),
                ),
        ),
      ],
    );
  }
}
