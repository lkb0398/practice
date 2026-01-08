import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:vitameal/core/util/date_time_utils.dart';

class MonthCalendar extends StatelessWidget {
  /// TableCalendar 기반 월/주 캘린더 위젯
  const MonthCalendar({
    super.key,
    required this.focusedDay,
    required this.selectedDay,
    required this.rowHeight,
    required this.barAreaHeight,
    required this.barColorByDay,
    required this.onDayTap,
    this.calendarFormat = CalendarFormat.month,
    this.onPageChanged,
  });

  final DateTime focusedDay; // 현재 어떤 날짜를 기준으로 렌더링 하고있는가
  final DateTime selectedDay; // 현재 선택된 날짜
  final double rowHeight; // 행의 높이
  final double barAreaHeight; // 날짜 아래에 있는 색상바 영역의 높이
  final Map<DateTime, Color> barColorByDay; // 날짜별 바 색상
  final void Function(DateTime day) onDayTap; // 호출할 함수
  final CalendarFormat calendarFormat; // 달력 포맷 (Month/Week)
  final void Function(DateTime newFocused)? onPageChanged; // 페이지 변경 콜백

  @override
  Widget build(BuildContext context) {
    return TableCalendar(
      firstDay: DateTime.utc(2000, 1, 1),
      lastDay: DateTime.utc(2100, 12, 31),
      focusedDay: focusedDay,
      headerVisible: false, // 상단 헤더를 따로 만들거기 때문에 숨김
      daysOfWeekVisible: false,
      calendarFormat: calendarFormat,
      startingDayOfWeek: StartingDayOfWeek.monday,
      rowHeight: rowHeight,
      shouldFillViewport: false,
      selectedDayPredicate: (d) => d.dateOnly == selectedDay.dateOnly,
      onDaySelected: (selected, focused) {
        onDayTap(selected);
      },
      onPageChanged: onPageChanged,

      calendarBuilders: CalendarBuilders(
        defaultBuilder: (context, day, _) {
          final isSelected = day.dateOnly == selectedDay.dateOnly;
          return DayCell(
            day: day,
            isSelected: isSelected,
            barColor: barColorByDay[day.dateOnly],
            barAreaHeight: barAreaHeight,
          );
        },
        selectedBuilder: (context, day, _) {
          return DayCell(
            day: day,
            isSelected: true,
            barColor: barColorByDay[day.dateOnly],
            barAreaHeight: barAreaHeight,
          );
        },
        todayBuilder: (context, day, _) {
          final isSelected = day.dateOnly == selectedDay.dateOnly;
          return DayCell(
            day: day,
            isSelected: isSelected,
            barColor: barColorByDay[day.dateOnly],
            barAreaHeight: barAreaHeight,
            isToday: true,
          );
        },
        outsideBuilder: (context, day, _) {
          // 이전달, 다음달 날짜는 흐리게
          return Opacity(
            opacity: 0.35,
            child: DayCell(
              day: day,
              isSelected: false,
              barColor: barColorByDay[day.dateOnly],
              barAreaHeight: barAreaHeight,
            ),
          );
        },
      ),
    );
  }
}

class DayCell extends StatelessWidget {
  /// 날짜 셀 커스텀 (날짜 부분 + 아래 여백 부분)
  const DayCell({
    super.key,
    required this.day,
    required this.isSelected,
    required this.barColor,
    required this.barAreaHeight,
    this.isToday = false,
  });

  final DateTime day;
  final bool isSelected;
  final bool isToday;
  final Color? barColor;
  final double barAreaHeight;

  @override
  Widget build(BuildContext context) {
    final dayNum = day.day.toString();

    return Center(
      child: SizedBox(
        width: 44,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            // 상단 고정 패딩
            const SizedBox(height: 3),
            // 날짜 텍스트 + 선택(회색 원)
            AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeOutCubic,
              width: 34,
              height: 34,
              decoration: BoxDecoration(
                color: isSelected ? Colors.black12 : Colors.transparent,
                shape: BoxShape.circle,
                border: isToday && !isSelected
                    ? Border.all(color: Colors.black12, width: 1)
                    : null,
              ),
              alignment: Alignment.center,
              child: Text(
                dayNum,
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  color: Colors.black87,
                ),
              ),
            ),

            // 여백 영역
            // Month 모드에서는 여백 존재, Week 모드에서는 barAreaHeight = 0이 들어옴
            Container(
              height: barAreaHeight,
              margin: const EdgeInsets.only(top: 4),
              child: barColor == null
                  ? const SizedBox.shrink()
                  : Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        height: math.min(4, barAreaHeight),
                        width: 18,
                        decoration: ShapeDecoration(
                          color: barColor,
                          shape: const StadiumBorder(),
                        ),
                      ),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
