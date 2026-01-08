import 'package:flutter/material.dart';

class CalendarHeader extends StatelessWidget {
  /// 캘린더 헤더
  const CalendarHeader({super.key, required this.focused});

  final DateTime focused;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // 년.월
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          height: 40,
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              '${focused.year}.${focused.month.toString().padLeft(2, '0')}',
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
          ),
        ),

        // 요일 (TableCalendar와 동일한 간격으로 7등분)
        SizedBox(
          height: 40,
          child: Row(
            children: const ['월', '화', '수', '목', '금', '토', '일']
                .map(
                  (day) => Expanded(
                    child: Center(
                      child: Text(
                        day,
                        style: TextStyle(fontSize: 13, color: Color(0xFF757575), fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                )
                .toList(),
          ),
        ),
      ],
    );
  }
}
