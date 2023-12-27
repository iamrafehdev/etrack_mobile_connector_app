import 'package:flutter/material.dart';

import 'package:intl/intl.dart';
import 'package:req_fun/req_fun.dart';

class AppDateTimePicker {
  static getTime(BuildContext context) async {
    TimeOfDay selectedTime = TimeOfDay.now();
    TimeOfDay _getTime = TimeOfDay.now();
    final TimeOfDay? timeOfDay = await showTimePicker(
      context: context,
      initialTime: selectedTime,
      builder: (context, childWidget) {
        return MediaQuery(
            data: MediaQuery.of(context).copyWith(
              alwaysUse24HourFormat: true,
            ),
            child: childWidget!);
      },
      initialEntryMode: TimePickerEntryMode.dial,
    );
    if (timeOfDay == null) {
      return;
    } else {
      selectedTime = timeOfDay;
      _getTime = selectedTime;
      return _getTime;
    }
  }

  static Future<String> getDate(BuildContext context) async {
    DateTime selectedDate = DateTime.now();
    var _getDate = "";

    final DateTime? picked = await showDatePicker(
        context: context, initialDate: selectedDate, initialDatePickerMode: DatePickerMode.day, firstDate: DateTime(2015), lastDate: DateTime(2101));

    if (picked != null) {
      selectedDate = picked;
      _getDate = selectedDate.format('yyyy-MM-dd');
    }

    return _getDate;
  }
}
