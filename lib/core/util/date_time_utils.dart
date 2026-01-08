extension DateTimeFormat on DateTime {
  String get monthLabel => '$year.${month.toString().padLeft(2, '0')}';

  DateTime get dateOnly => DateTime(year, month, day);

  String get logFormat => toIso8601String().substring(0, 10);
}

bool isSameDate(DateTime date1, DateTime date2) {
  return date1.year == date2.year && date1.month == date2.month && date1.day == date2.day;
}
