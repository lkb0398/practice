import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tap_debouncer/tap_debouncer.dart';
import 'package:vitameal/core/theme/app_theme.dart';
import 'package:vitameal/domain/entity/notifications_entity.dart';
import 'package:vitameal/presentation/widget/button/done_button.dart';
import 'package:vitameal/presentation/widget/validate_textformfield.dart';

class AddNotiBottomSheet extends HookConsumerWidget {
  const AddNotiBottomSheet({
    super.key,
    this.noti,
    required this.controller,
    required this.initialTime,
    required this.onConfirm,
  });

  final NotificationsEntity? noti;
  final TextEditingController controller;
  final TimeOfDay initialTime;
  final void Function(TimeOfDay newTime) onConfirm;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    TimeOfDay selectedTime = initialTime;

    // 알림명 : 입력값 검증 메시지
    String? validateLabel(String? value) {
      if (value == null || value.trim().isEmpty) {
        return '알림 이름을 입력해주세요.'; // 입력값 없을 때
      }
      return null; // 통과
    }

    // 수정 화면에서 기존값 불러오기
    final didInit = useRef(false);
    final savedGoalRef = useRef<NotificationsEntity?>(null);
    useEffect(() {
      if (noti == null) return null;
      if (didInit.value) return null;
      didInit.value = true;
      controller.text = noti!.label;
      savedGoalRef.value = noti;
      return null;
    }, [noti]);

    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: SizedBox(
        height: 380,
        child: Column(
          spacing: 10,
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

            /// 알림명 입력창
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 10,
                children: [
                  Text("알림 이름", style: TextStyle(fontSize: 16)),
                  ValidateTextformfield(
                    readOnly: false,
                    hintText: "아침",
                    validator: validateLabel,
                    controller: controller,
                  ),
                ],
              ),
            ),

            /// 시간 선택
            SizedBox(
              height: 120,
              child: CupertinoDatePicker(
                mode: CupertinoDatePickerMode.time,
                use24hFormat: false,
                initialDateTime: DateTime(
                  0,
                  0,
                  0,
                  initialTime.hour,
                  initialTime.minute,
                ),
                onDateTimeChanged: (dateTime) {
                  selectedTime = TimeOfDay(
                    hour: dateTime.hour,
                    minute: dateTime.minute,
                  );
                },
              ),
            ),

            /// 완료 버튼
            TapDebouncer(
              onTap: () async {
                // 사용자 입력값 검증 > 통과 안되면 진행 막기
                final label = controller.text.trim();
                if (validateLabel(label) != null) {
                  return;
                }
                onConfirm(selectedTime);
                controller.clear();
                Navigator.pop(context);
              },
              builder: (BuildContext context, TapDebouncerFunc? onTap) {
                return DoneButton(
                  onTap: onTap,
                  backgroundColor: fxc(context).primary100!,
                  text: "완료",
                  textColor: fxc(context).primary600!,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
