import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tap_debouncer/tap_debouncer.dart';
import 'package:vitameal/core/theme/app_theme.dart';
import 'package:vitameal/presentation/goal/view_model/goal_datas_view_model.dart';
import 'package:vitameal/presentation/ui_provider/goals_provider.dart';
import 'package:vitameal/presentation/widget/button/done_button.dart';
import 'package:vitameal/presentation/goal/view/function/pick_datetime.dart.dart';
import 'package:vitameal/presentation/widget/validate_textformfield.dart';

class AddDataBottomSheet extends HookConsumerWidget {
  const AddDataBottomSheet({super.key, required this.goalId});

  final String goalId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // 사용자 입력값 받기 + 입력값 검증
    final dataDateController = useTextEditingController();
    final dataValueController = useTextEditingController();
    String? validateDouble(String? value) {
      if (value == null || value.isEmpty) {
        return null;
      }
      final height = double.tryParse(value);
      if (height == null) {
        return '숫자를 입력해주세요.'; // 숫자가 아닐 때
      }
      return null;
    }

    // 날짜+시간 선택
    final selectedDataDate = useState<DateTime?>(null);

    // 버튼 활성화 여부
    final isButtonEnabled = useState(false);
    useEffect(() {
      void listener() {
        final hasDataDate = selectedDataDate.value != null;
        final hasDataValue = double.tryParse(dataValueController.text) != null;
        isButtonEnabled.value = hasDataDate && hasDataValue;
      }

      dataValueController.addListener(listener);
      return () {
        dataValueController.removeListener(listener);
      };
    }, [selectedDataDate.value]);

    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: SizedBox(
        height: 350,
        child: Column(
          children: [
            SizedBox(height: 10),

            /// 상단 바
            Container(
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(2),
              ),
            ),

            /// 데이터 입력창
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 10,
                children: [
                  Text("데이터 추가", style: TextStyle(fontSize: 16)),
                  ValidateTextformfield(
                    readOnly: true,
                    title: "일자",
                    hintText: "ex. 2025-12-22 14:20",
                    controller: dataDateController,
                    onTap: () async {
                      final dataDate = await pickDateTime(context);
                      if (dataDate == null) return;

                      selectedDataDate.value = DateTime(
                        dataDate.year,
                        dataDate.month,
                        dataDate.day,
                        dataDate.hour,
                        dataDate.minute,
                      );

                      dataDateController.text =
                          '${dataDate.year}.${dataDate.month.toString().padLeft(2, '0')}.${dataDate.day.toString().padLeft(2, '0')} ${dataDate.hour.toString().padLeft(2, '0')}:${dataDate.minute.toString().padLeft(2, '0')}';
                    },
                  ),
                  ValidateTextformfield(
                    readOnly: false,
                    title: "수치",
                    hintText: "ex. 5.0",
                    validator: validateDouble,
                    controller: dataValueController,
                    keyboardType: const TextInputType.numberWithOptions(
                      decimal: true,
                    ),
                  ),
                ],
              ),
            ),

            /// 완료 버튼
            TapDebouncer(
              onTap: isButtonEnabled.value
                  ? () async {
                      // 데이터 추가
                      await ref
                          .read(goalDatasViewModelProvider.notifier)
                          .saveData(
                            goalId: goalId,
                            dataDate: selectedDataDate.value!,
                            dataValue: double.tryParse(
                              dataValueController.text,
                            )!,
                          );
                      // mounted 체크
                      if (!context.mounted) return;
                      Navigator.pop(context);
                      // 입력값 초기화
                      dataDateController.clear();
                      dataValueController.clear();
                      selectedDataDate.value = null;
                      // UI 반영
                      ref.invalidate(getGoalDatasProvider);
                      ref.invalidate(getAllGoalsProvider);
                    }
                  : null,
              builder: (BuildContext context, TapDebouncerFunc? onTap) {
                return DoneButton(
                  onTap: onTap,
                  backgroundColor: isButtonEnabled.value
                      ? fxc(context).secondary100!
                      : fxc(context).textcolor300!,
                  text: "완료",
                  textColor: isButtonEnabled.value
                      ? fxc(context).secondary400!
                      : Colors.white,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
