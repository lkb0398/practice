extension DateTimeFormat on DateTime {
  String get monthLabel => '$year.${month.toString().padLeft(2, '0')}';

  DateTime get dateOnly => DateTime(year, month, day);
}
