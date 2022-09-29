extension HourMin on DateTime {
  String getHourMinFormat() {
    final hour = this.hour;
    final minute = this.minute;
    String hourString = hour >= 10 ? hour.toString() : '0$hour';
    String minuteString = minute >= 10 ? minute.toString() : '0$minute';
    return '$hourString:$minuteString';
  }
}
