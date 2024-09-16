import 'package:flutter/material.dart';
import 'package:intl/intl.dart' as intl;

Future<DateTime?> pickDate(String dateTime, context) async {
  DateTime dateTimeHolder;
  if (dateTime.isNotEmpty) {
    dateTimeHolder = intl.DateFormat('MM/dd').parse(dateTime);
  } else {
    dateTimeHolder = DateTime.now();
  }
  return await showDatePicker(
    context: context,
    initialDate: dateTimeHolder,
    firstDate: DateTime(1920),
    lastDate: DateTime.now(),
  );
}
