// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:flutter/material.dart';

class Calender extends StatelessWidget {
  final DateTime focusDate;
  final void Function(DateTime)? onDateChange;
  const Calender(
      {super.key, required this.focusDate, required this.onDateChange});

  @override
  Widget build(BuildContext context) {
    return EasyDateTimeLinePicker(
      focusedDate: focusDate,
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(Duration(days: 13)),
      headerOptions: HeaderOptions(
        headerType: HeaderType.none,
      ),
      timelineOptions: TimelineOptions(height: 105),
      onDateChange: onDateChange,
    );
  }
}
