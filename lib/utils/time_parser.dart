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
