import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tap_debouncer/tap_debouncer.dart';
import 'package:vitameal/core/theme/app_theme.dart';
import 'package:vitameal/domain/entity/goals_entity.dart';
import 'package:vitameal/presentation/goal/view_model/goals_view_model.dart';
import 'package:vitameal/presentation/ui_provider/goals_provider.dart';
import 'package:vitameal/presentation/goal/view/function/pick_date.dart';
import 'package:vitameal/presentation/widget/dialog/delete_dialog.dart';
import 'package:vitameal/presentation/widget/button/done_button.dart';
import 'package:vitameal/presentation/widget/validate_textformfield.dart';

class AddGoalPage extends HookConsumerWidget {
  const AddGoalPage({super.key, this.goalId});

  final String? goalId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final goal = goalId == null
        ? null // goal == null > 추가 화면
        : ref.watch(getGoalProvider(goalId!)); // goal != null > 수정 화면

    // 사용자 입력값 받기 + 입력값 검증
    final goalTitleController = useTextEditingController();
    final goalUnitController = useTextEditingController();
    final goalValueController = useTextEditingController();
    final goalDateController = useTextEditingController();
    String? validateDouble(String? value) {
      if (value == null || value.isEmpty) {
        return null;
      }
      final height = double.tryParse(value);
      if (height == null) {
        return '숫자를 입력해주세요.'; // 숫자가 아닐 때
      }
      return null; // 통과
    }

    // 날짜 선택
    final selectedGoalDate = useState<DateTime?>(null);

    // 수정 화면에서 기존값 불러오기
    final didInit = useRef(false);
    final savedGoalRef = useRef<GoalsEntity?>(null);
    useEffect(() {
      if (goal == null) return null;
      if (didInit.value) return null;
      didInit.value = true;
      goalTitleController.text = goal.goalTitle;
      goalUnitController.text = goal.goalUnit;
      goalValueController.text = goal.goalValue.toString();
      selectedGoalDate.value = goal.goalDate;
      goalDateController.text =
          '${goal.goalDate.year}.${goal.goalDate.month.toString().padLeft(2, '0')}.${goal.goalDate.day.toString().padLeft(2, '0')}';
      savedGoalRef.value = goal;
      return null;
    }, [goal]);

    // 기존값 변경 여부
    bool isChanged() {
      final saved = savedGoalRef.value;
      if (saved == null) return true;
      return goalTitleController.text.trim() != saved.goalTitle ||
          goalUnitController.text.trim() != saved.goalUnit ||
          double.tryParse(goalValueController.text) != saved.goalValue ||
          selectedGoalDate.value != saved.goalDate;
    }

    // 버튼 활성화 여부
    final isButtonEnabled = useState(false);
    useEffect(() {
      void listener() {
        final hasGoalTitle = goalTitleController.text.trim().isNotEmpty;
        final hasGoalUnit = goalUnitController.text.trim().isNotEmpty;
        final hasGoalValue = double.tryParse(goalValueController.text) != null;
        final hasGoalDate = selectedGoalDate.value != null;
        final baseValid =
            hasGoalTitle && hasGoalUnit && hasGoalValue && hasGoalDate;
        if (goal == null) {
          isButtonEnabled.value = baseValid;
        } else {
          isButtonEnabled.value = baseValid && isChanged();
        }
      }

      goalTitleController.addListener(listener);
      goalUnitController.addListener(listener);
      goalValueController.addListener(listener);
      return () {
        goalTitleController.removeListener(listener);
        goalUnitController.removeListener(listener);
        goalValueController.removeListener(listener);
      };
    }, [goal, selectedGoalDate.value]);

    return Scaffold(
      appBar: AppBar(
        title: Text(goal != null ? "목표 수정" : "새 목표"),
        actions: [
          /// 삭제 버튼
          goal != null
              ? TapDebouncer(
                  onTap: () async {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return DeleteDialog(
                          onDelete: () async {
                            // 목표 삭제
                            await ref
                                .read(goalsViewModelProvider.notifier)
                                .deleteGoal(goalId!);
                            // mounted 체크
                            if (!context.mounted) return;
                            Navigator.pop(context);
                            // 페이지 이동
                            context.pop();
                            // UI 반영
                            ref.invalidate(getAllGoalsProvider);
                          },
                        );
                      },
                    );
                  },
                  builder: (BuildContext context, TapDebouncerFunc? onTap) {
                    return TextButton(
                      onPressed: onTap,
                      child: Text(
                        "삭제",
                        style: TextStyle(color: fxc(context).secondary400),
                      ),
                    );
                  },
                )
              : SizedBox.shrink(),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 10,
            children: [
              Text("목표명", style: TextStyle(fontSize: 16)),
              ValidateTextformfield(
                readOnly: false,
                hintText: "ex. 요산",
                controller: goalTitleController,
              ),
              Text("단위", style: TextStyle(fontSize: 16)),
              ValidateTextformfield(
                readOnly: false,
                hintText: "ex. mg/dL",
                controller: goalUnitController,
              ),
              Text("목표 수치", style: TextStyle(fontSize: 16)),
              ValidateTextformfield(
                readOnly: false,
                hintText: "ex. 2.46",
                validator: validateDouble,
                controller: goalValueController,
                keyboardType: const TextInputType.numberWithOptions(
                  decimal: true,
                ),
              ),
              Text("목표 기간", style: TextStyle(fontSize: 16)),
              ValidateTextformfield(
                readOnly: true,
                hintText: "ex. 2025.01.23",
                controller: goalDateController,
                onTap: () async {
                  final date = await pickDate(context);
                  if (date == null) return;
                  selectedGoalDate.value = DateTime(
                    date.year,
                    date.month,
                    date.day,
                  );
                  goalDateController.text =
                      '${date.year}.${date.month.toString().padLeft(2, '0')}.${date.day.toString().padLeft(2, '0')}';
                },
              ),
            ],
          ),
        ),
      ),

      /// 수정/추가 버튼
      bottomNavigationBar: TapDebouncer(
        onTap: isButtonEnabled.value
            ? () async {
                if (goal != null) {
                  // 1. 목표 수정
                  await ref
                      .read(goalsViewModelProvider.notifier)
                      .updateGoal(
                        goalId: goal.goalId!,
                        goalTitle: goalTitleController.text,
                        goalUnit: goalUnitController.text,
                        goalValue: double.tryParse(goalValueController.text)!,
                        goalDate: selectedGoalDate.value!,
                        isDone: goal.isDone,
                        isMain: goal.isMain,
                      );
                  // 기존값 업데이트
                  savedGoalRef.value = GoalsEntity(
                    goalId: goal.goalId,
                    goalTitle: goalTitleController.text.trim(),
                    goalUnit: goalUnitController.text.trim(),
                    goalValue: double.tryParse(goalValueController.text)!,
                    goalDate: selectedGoalDate.value!,
                    isDone: goal.isDone,
                    isMain: goal.isMain,
                  );
                  // 버튼 비활성화
                  isButtonEnabled.value = false;
                  // mounted 체크
                  if (!context.mounted) return;
                  // 페이지 이동
                  context.pop();
                  // UI 반영
                  ref.invalidate(getAllGoalsProvider);
                } else {
                  // 2. 목표 추가
                  await ref
                      .read(goalsViewModelProvider.notifier)
                      .saveGoal(
                        goalTitle: goalTitleController.text,
                        goalUnit: goalUnitController.text,
                        goalValue: double.tryParse(goalValueController.text)!,
                        goalDate: selectedGoalDate.value!,
                        isDone: false,
                        isMain: false,
                      );
                  // mounted 체크
                  if (!context.mounted) return;
                  // 페이지 이동
                  context.pop();
                  // UI 반영
                  ref.invalidate(getAllGoalsProvider);
                }
              }
            : null,
        builder: (BuildContext context, TapDebouncerFunc? onTap) {
          return DoneButton(
            onTap: onTap,
            text: goal != null ? "수정" : "추가",
            backgroundColor: isButtonEnabled.value
                ? fxc(context).secondary400!
                : fxc(context).textcolor200!,
            textColor: Colors.white,
          );
        },
      ),
    );
  }
}
