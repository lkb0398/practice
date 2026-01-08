import 'package:flutter/cupertino.dart';
import 'package:vitameal/core/theme/app_theme.dart';

Future<DateTime?> pickDate(BuildContext context) async {
  DateTime selectedDate = DateTime.now();

  return showCupertinoModalPopup<DateTime>(
    context: context,
    builder: (context) {
      return Container(
        height: 300,
        color: CupertinoColors.systemBackground.resolveFrom(context),
        child: Column(
          children: [
            // 상단 액션 바
            Container(
              height: 50,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(color: fxc(context).textcolor200!),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CupertinoButton(
                    padding: EdgeInsets.zero,
                    child: Text(
                      '취소',
                      style: TextStyle(color: fxc(context).textcolor300),
                    ),
                    onPressed: () => Navigator.pop(context),
                  ),
                  CupertinoButton(
                    padding: EdgeInsets.zero,
                    child: Text(
                      '완료',
                      style: TextStyle(color: fxc(context).secondary400),
                    ),
                    onPressed: () =>
                        Navigator.pop(context, _normalizeDate(selectedDate)),
                  ),
                ],
              ),
            ),

            // Date Picker
            Expanded(
              child: CupertinoDatePicker(
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

DateTime _normalizeDate(DateTime date) {
  return DateTime(date.year, date.month, date.day);
}
