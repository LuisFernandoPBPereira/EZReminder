import 'package:flutter/material.dart';

TimeOfDay? parseTimeOfDay(String input) {
  // Dividindo a string no caractere ':'
  List<String> parts = input.split(':');
  if (parts.length == 2) {
    int? hour = int.tryParse(parts[0]);
    int? minute = int.tryParse(parts[1]);

    if (hour != null && minute != null) {
      return TimeOfDay(hour: hour, minute: minute);
    }
  }
  return null; // Retorna nulo se a string não estiver no formato esperado
}

String formatTimeOfDay(TimeOfDay? time, {bool is24HourFormat = true}) {
  if (time != null) {
    if (is24HourFormat) {
      return '${time.hour.toString().padLeft(2, '0')}:${time.minute.toString().padLeft(2, '0')}';
    } else {
      String period = time.period == DayPeriod.am ? 'AM' : 'PM';
      int hour12 = time.hourOfPeriod == 0 ? 12 : time.hourOfPeriod;
      return '${hour12.toString().padLeft(2, '0')}:${time.minute.toString().padLeft(2, '0')} $period';
    }
  }
  return "";
}
