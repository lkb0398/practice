import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vitameal/core/theme/app_theme.dart';

Future<DateTime?> pickDateTime(BuildContext context) async {
  final date = await _pickCupertinoDate(context);
  if (date == null) return null;

  final time = await _pickCupertinoTime(context);
  if (time == null) return null;

  return DateTime(date.year, date.month, date.day, time.hour, time.minute);
}

// 날짜 선택 팝업
Future<DateTime?> _pickCupertinoDate(BuildContext context) async {
  DateTime selectedDate = DateTime.now();

  return showCupertinoModalPopup<DateTime>(
    context: context,
    builder: (_) {
      return Container(
        height: 300,
        color: CupertinoColors.systemBackground.resolveFrom(context),
        child: Column(
          children: [
            _CupertinoActionBar(
              onCancel: () => Navigator.pop(context),
              onDone: () {
                Navigator.pop(
                  context,
                  DateTime(
                    selectedDate.year,
                    selectedDate.month,
                    selectedDate.day,
                  ),
                );
              },
            ),
            Expanded(
              child: CupertinoDatePicker(
                key: UniqueKey(),
                mode: CupertinoDatePickerMode.date,
                initialDateTime: DateTime.now(),
                minimumDate: DateTime(2000),
                maximumDate: DateTime(2100),
                onDateTimeChanged: (date) {
                  selectedDate = date;
                },
              ),
            ),
          ],
        ),
      );
    },
  );
}

// 시간 선택 팝업
Future<TimeOfDay?> _pickCupertinoTime(BuildContext context) async {
  TimeOfDay selectedTime = TimeOfDay.now();

  return showCupertinoModalPopup<TimeOfDay>(
    context: context,
    builder: (_) {
      return Container(
        height: 300,
        color: CupertinoColors.systemBackground.resolveFrom(context),
        child: Column(
          children: [
            _CupertinoActionBar(
              onCancel: () => Navigator.pop(context),
              onDone: () => Navigator.pop(context, selectedTime),
            ),
            Expanded(
              child: CupertinoDatePicker(
                key: UniqueKey(),
                mode: CupertinoDatePickerMode.time,
                use24hFormat: false,
                initialDateTime: DateTime.now(),
                onDateTimeChanged: (dateTime) {
                  selectedTime = TimeOfDay(
                    hour: dateTime.hour,
                    minute: dateTime.minute,
                  );
                },
              ),
            ),
          ],
        ),
      );
    },
  );
}

class _CupertinoActionBar extends StatelessWidget {
  final VoidCallback onCancel;
  final VoidCallback onDone;

  const _CupertinoActionBar({required this.onCancel, required this.onDone});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: fxc(context).textcolor200!)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CupertinoButton(
            padding: EdgeInsets.zero,
            onPressed: onCancel,
            child: Text(
              '취소',
              style: TextStyle(color: fxc(context).textcolor300),
            ),
          ),
          CupertinoButton(
            padding: EdgeInsets.zero,
            onPressed: onDone,
            child: Text(
              '완료',
              style: TextStyle(color: fxc(context).secondary400),
            ),
          ),
        ],
      ),
    );
  }
}
