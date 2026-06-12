extension DateTimeExtensions on DateTime {
  bool isToday() {
    final now = DateTime.now();
    return year == now.year && month == now.month && day == now.day;
  }

  bool isYesterday() {
    final yesterday = DateTime.now().subtract(const Duration(days: 1));
    return year == yesterday.year && month == yesterday.month && day == yesterday.day;
  }

  bool isSameDay(DateTime other) {
    return year == other.year && month == other.month && day == other.day;
  }

  bool isSameMonth(DateTime other) {
    return year == other.year && month == other.month;
  }

  bool isSameYear(DateTime other) {
    return year == other.year;
  }

  DateTime startOfDay() {
    return DateTime(year, month, day);
  }

  DateTime endOfDay() {
    return DateTime(year, month, day, 23, 59, 59, 999);
  }

  DateTime startOfMonth() {
    return DateTime(year, month, 1);
  }

  DateTime endOfMonth() {
    return DateTime(year, month + 1, 0, 23, 59, 59, 999);
  }

  DateTime startOfYear() {
    return DateTime(year, 1, 1);
  }

  DateTime endOfYear() {
    return DateTime(year, 12, 31, 23, 59, 59, 999);
  }

  String toFormattedString() {
    return '$year-${month.toString().padLeft(2, '0')}-${day.toString().padLeft(2, '0')}';
  }

  String toDisplayString() {
    if (isToday()) {
      return 'Today';
    } else if (isYesterday()) {
      return 'Yesterday';
    } else {
      return toFormattedString();
    }
  }
}
