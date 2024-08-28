extension DateTimeX on DateTime {
  bool get isToday {
    final now = DateTime.now();
    return day == now.day && month == now.month && year == now.year;
  }

  DateTime get midnight {
    return DateTime(year, month, day);
  }
}
