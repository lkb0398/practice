import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tap_debouncer/tap_debouncer.dart';
import 'package:vitameal/core/theme/app_theme.dart';
import 'package:vitameal/presentation/goal/view/function/show_gray_snackbar.dart';
import 'package:vitameal/presentation/goal/view/widget/add_data_bottom_sheet.dart';
import 'package:vitameal/presentation/goal/view_model/goal_datas_view_model.dart';
import 'package:vitameal/presentation/ui_provider/goals_provider.dart';
import 'package:vitameal/presentation/widget/dialog/delete_dialog.dart';

class DataPage extends HookConsumerWidget {
  const DataPage({super.key, required this.goalId});

  final String goalId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // 상태 선언
    final goalsAsync = ref.watch(getAllGoalsProvider); // 전체 목표 목록
    final selectedGoalId = useState<String>(goalId); // 초기값
    final isReversed = useState(false); // false = 최신순, true = 오래된순

    // 선택된 목표 + 데이터 불러오기
    final selectedGoal = ref.watch(getGoalProvider(selectedGoalId.value));
    final datasAsync = ref.watch(getGoalDatasProvider(selectedGoalId.value));

    // 달성된 목표 여부
    final isDone = selectedGoal!.isDone == true;

    // 삭제 선택값들
    final selectedDataIds = useState<Set<String>>({});
    final hasSelected = selectedDataIds.value.isNotEmpty;

    String formatNumber(double value) {
      if (value % 1 == 0) {
        return value.toInt().toString(); // 소수점 없음
      }
      return value.toString(); // 소수점 있음
    }

    return Scaffold(
      appBar: AppBar(title: Text("최신 데이터")),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          spacing: 10,
          children: [
            /// 목표 항목 선택 dropdown
            DropdownButtonFormField2<String>(
              hint: Text(
                '항목 선택하기',
                style: TextStyle(
                  color: fxc(context).textcolor300,
                  fontSize: 14,
                ),
              ),
              iconStyleData: IconStyleData(
                icon: Icon(
                  Icons.keyboard_arrow_down,
                  color: fxc(context).textcolor300,
                ),
              ),
              dropdownStyleData: DropdownStyleData(
                direction: DropdownDirection.textDirection,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.white,
                ),
              ),
              value: selectedGoalId.value,
              items: goalsAsync.when(
                loading: () => [],
                error: (_, __) => [],
                data: (goals) {
                  return goals!.map((goal) {
                    return DropdownMenuItem<String>(
                      value: goal.goalId,
                      child: Text(
                        goal.goalTitle,
                        style: TextStyle(color: vrc(context).text),
                      ),
                    );
                  }).toList();
                },
              ),
              onChanged: (value) {
                if (value == null) return;
                selectedGoalId.value = value;
                selectedDataIds.value = {};
              },

              decoration: InputDecoration(
                filled: true,
                fillColor: vrc(context).greyBackground,
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 12,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
              ),
            ),

            /// 목표 정보
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: isDone
                    ? fxc(context).textcolor200
                    : fxc(context).secondary50,
              ),
              padding: EdgeInsets.symmetric(vertical: 12),
              width: double.infinity,
              height: 40,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: Text(
                      selectedGoal.goalTitle,
                      style: TextStyle(
                        fontSize: 12,
                        color: fxc(context).textcolor700,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  VerticalDivider(
                    color: isDone
                        ? fxc(context).textcolor300
                        : fxc(context).secondary200,
                  ),
                  Expanded(
                    child: Text(
                      '${formatNumber(selectedGoal.goalValue)} ${selectedGoal.goalUnit}',
                      style: TextStyle(
                        fontSize: 12,
                        color: fxc(context).textcolor700,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  VerticalDivider(
                    color: isDone
                        ? fxc(context).textcolor300
                        : fxc(context).secondary200,
                  ),
                  Expanded(
                    child: Text(
                      '${selectedGoal.goalDate.year}.${selectedGoal.goalDate.month.toString().padLeft(2, '0')}.${selectedGoal.goalDate.day.toString().padLeft(2, '0')}',
                      style: TextStyle(
                        fontSize: 12,
                        color: fxc(context).textcolor700,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
            isDone
                ? Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "🥳 이미 달성한 목표입니다!",
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: fxc(context).secondary400,
                      ),
                    ),
                  )
                : SizedBox.shrink(),

            Container(
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(color: fxc(context).textcolor200!),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  /// 데이터 정렬 dropdown
                  DropdownButton2<bool>(
                    isDense: true,
                    underline: const SizedBox(),
                    value: isReversed.value,

                    items: const [
                      DropdownMenuItem(
                        value: false,
                        child: Text('최신순', style: TextStyle(fontSize: 12)),
                      ),
                      DropdownMenuItem(
                        value: true,
                        child: Text('오래된순', style: TextStyle(fontSize: 12)),
                      ),
                    ],
                    onChanged: (value) {
                      if (value == null) return;
                      isReversed.value = value;
                    },

                    iconStyleData: IconStyleData(
                      icon: Icon(
                        Icons.keyboard_arrow_down,
                        size: 20,
                        color: fxc(context).textcolor300,
                      ),
                    ),

                    dropdownStyleData: DropdownStyleData(
                      direction: DropdownDirection.textDirection,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),

                  /// 삭제 버튼
                  TapDebouncer(
                    onTap: hasSelected
                        ? () async {
                            showDialog(
                              context: context,
                              builder: (context) {
                                return DeleteDialog(
                                  onDelete: () async {
                                    // 데이터 삭제
                                    await ref
                                        .read(
                                          goalDatasViewModelProvider.notifier,
                                        )
                                        .deleteDatas(
                                          selectedDataIds.value.toList(),
                                        );
                                    // mounted 체크
                                    if (!context.mounted) return;
                                    Navigator.pop(context);
                                    // 선택 초기화
                                    selectedDataIds.value = {};
                                    // UI 반영
                                    ref.invalidate(getGoalDatasProvider);
                                  },
                                );
                              },
                            );
                          }
                        : null,
                    builder: (BuildContext context, TapDebouncerFunc? onTap) {
                      return TextButton(
                        onPressed: onTap,
                        child: Text(
                          "삭제",
                          style: TextStyle(
                            fontSize: 12,
                            color: hasSelected
                                ? fxc(context).secondary400
                                : Colors.grey,
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
            datasAsync.when(
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (e, _) => Center(child: Text('에러 발생: $e')),
              data: (datas) {
                // 데이터 없을 때 화면
                if (datas == null || datas.isEmpty) {
                  return SizedBox(
                    height: 50,
                    width: double.infinity,
                    child: Center(child: Text("데이터 없음")),
                  );
                }
                final displayDatas = isReversed.value
                    ? datas.reversed.toList()
                    : datas;

                /// 데이터 리스트
                return AbsorbPointer(
                  absorbing: isDone ? true : false, // true 면 터치 차단
                  child: Container(
                    decoration: BoxDecoration(
                      color: isDone ? Colors.grey[200] : null,
                    ),
                    child: ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: displayDatas.length,
                      itemBuilder: (BuildContext context, int index) {
                        final data = displayDatas[index];
                        final isSelected = selectedDataIds.value.contains(
                          data.dataId,
                        );

                        return Container(
                          padding: EdgeInsets.only(left: 10),
                          decoration: BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                color: fxc(context).textcolor200!,
                              ),
                            ),
                          ),
                          height: 58,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                '${data.dataDate.year}.${data.dataDate.month.toString().padLeft(2, '0')}.${data.dataDate.day.toString().padLeft(2, '0')}\n${data.dataDate.hour.toString().padLeft(2, '0')}:${data.dataDate.minute.toString().padLeft(2, '0')}',
                                style: TextStyle(
                                  color: fxc(context).textcolor400,
                                  fontSize: 11,
                                ),
                              ),
                              Row(
                                spacing: 10,
                                children: [
                                  Text(
                                    "${formatNumber(data.dataValue)} ${selectedGoal.goalUnit}",
                                    style: TextStyle(fontSize: 14),
                                  ),
                                  IconButton(
                                    icon: Icon(
                                      isSelected
                                          ? Icons.check_circle
                                          : Icons.radio_button_unchecked,
                                      color: isSelected
                                          ? fxc(context).secondary400
                                          : Colors.grey,
                                    ),
                                    onPressed: () {
                                      final newSet = {...selectedDataIds.value};
                                      if (isSelected) {
                                        newSet.remove(data.dataId);
                                      } else {
                                        newSet.add(data.dataId!);
                                      }
                                      selectedDataIds.value = newSet;
                                    },
                                  ),
                                ],
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),

      /// 데이터 추가 버튼
      floatingActionButton: RawMaterialButton(
        onPressed: () async {
          if (isDone) {
            // 스낵바
            showGraySnackBar(context, '이미 달성한 목표에는 데이터를 추가할 수 없어요.');
            // 완료 시 비활성화
            return;
          } else {
            showModalBottomSheet(
              isScrollControlled: true,
              context: context,
              backgroundColor: Colors.white,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
              ),
              builder: (context) {
                return AddDataBottomSheet(goalId: selectedGoal.goalId!);
              },
            );
          }
        },

        fillColor: fxc(context).secondary400,
        shape: const CircleBorder(),
        constraints: const BoxConstraints(minWidth: 72, minHeight: 72),
        elevation: 8,
        child: Icon(Icons.add, size: 40, color: Colors.white),
      ),
    );
  }
}
