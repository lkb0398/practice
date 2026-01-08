import 'package:table_calendar/table_calendar.dart';
import 'package:vitameal/core/util/date_time_utils.dart';

/// 캘린더 관련 유틸 함수들
class CalendarUtils {
  CalendarUtils._();

  /// 두 날짜가 같은 날인지 비교
  static bool isSameDay(DateTime a, DateTime b) => a.year == b.year && a.month == b.month && a.day == b.day;

  /// 현재 날짜가 월 그리드에서 몇 번째 주인지 계산
  static int weekIndexInMonthGrid(DateTime monthFocused, DateTime selected, {int rowCount = 6}) {
    // 현재 캘린더에 렌더링된 달의 1일
    final firstOfMonth = DateTime(monthFocused.year, monthFocused.month, 1);
    // 캘린더의 시작 요일 설정 = 월요일
    const startDow = StartingDayOfWeek.monday;
    // 현재 월의 1일이 속한 주의 월요일 (캘린더의 첫 칸이 됨)
    final firstGridDay = startOfWeek(firstOfMonth, startDow);
    // 선택 날짜가 첫 칸에서 몇 일 떨어져 있는지 계산
    final diff = selected.dateOnly.difference(firstGridDay.dateOnly).inDays;
    // 차이를 7로 나눠서 선택 날짜가 몇 번째 주인지 계산
    return (diff / 7).floor().clamp(0, rowCount - 1);
  }

  /// 특정 날짜가 속한 주의 시작 요일 날짜 계산
  static DateTime startOfWeek(DateTime d, StartingDayOfWeek start) {
    final weekday = d.weekday; // d의 요일
    final startWeekday = _startDowToDateTimeWeekday(start); // 주의 시작 요일
    int delta = weekday - startWeekday; // 주의 시작 요일에 올 날짜 계산
    if (delta < 0) delta += 7; // 음수 보정
    return d.subtract(Duration(days: delta)).dateOnly;
  }

  /// StartingDayOfWeek enum 값을 DateTime 계산에 쓰는 숫자 요일로 변환
  static int _startDowToDateTimeWeekday(StartingDayOfWeek s) {
    switch (s) {
      case StartingDayOfWeek.monday:
        return DateTime.monday;
      case StartingDayOfWeek.tuesday:
        return DateTime.tuesday;
      case StartingDayOfWeek.wednesday:
        return DateTime.wednesday;
      case StartingDayOfWeek.thursday:
        return DateTime.thursday;
      case StartingDayOfWeek.friday:
        return DateTime.friday;
      case StartingDayOfWeek.saturday:
        return DateTime.saturday;
      case StartingDayOfWeek.sunday:
        return DateTime.sunday;
    }
  }
}
