import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TimeSelector extends StatelessWidget {
  /// 시간 선택
  const TimeSelector({super.key, this.selectedTime, required this.date, required this.onTimeChanged});

  final DateTime? selectedTime;
  final DateTime date;
  final ValueChanged<DateTime?> onTimeChanged;

  /// TimePicker 바텀시트
  Future<void> _showTimePicker(BuildContext context) async {
    final now = DateTime.now();
    DateTime tempTime = selectedTime ?? now;

    await showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) => Container(
        height: 300,
        padding: const EdgeInsets.symmetric(vertical: 16),
        child: Column(
          children: [
            // 라벨
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    '시간 선택',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      color: Colors.black87,
                    ),
                  ),
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: const Icon(Icons.close, color: Colors.black54),
                  ),
                ],
              ),
            ),
            const Divider(height: 24, thickness: 1),

            // Cupertino TimePicker (IOS)
            Expanded(
              child: CupertinoDatePicker(
                mode: CupertinoDatePickerMode.time,
                use24hFormat: false,
                initialDateTime: tempTime,
                onDateTimeChanged: (DateTime newTime) {
                  tempTime = newTime;
                },
              ),
            ),

            // 완료 버튼
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
              child: SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    onTimeChanged(DateTime(
                      date.year,
                      date.month,
                      date.day,
                      tempTime.hour,
                      tempTime.minute,
                    ));
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFB7E600),
                    foregroundColor: Colors.black87,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text(
                    '완료',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "시간",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700, color: Colors.black87),
        ),
        const SizedBox(height: 10),
        GestureDetector(
          onTap: () => _showTimePicker(context),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: const Color(0xFFDDDDDD)),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  selectedTime == null
                      ? "시간 선택"
                      : "${selectedTime!.hour.toString().padLeft(2, '0')} : ${selectedTime!.minute.toString().padLeft(2, '0')}",
                  style: TextStyle(
                    fontSize: 16,
                    color: selectedTime == null ? Colors.black26 : Colors.black87,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(width: 8),
                Icon(
                  Icons.access_time,
                  size: 18,
                  color: selectedTime == null ? Colors.black26 : Colors.black87,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
