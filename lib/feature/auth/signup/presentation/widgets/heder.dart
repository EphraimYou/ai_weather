// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HederWidget extends StatelessWidget {
  final String title;
  final String subtitle;

  const HederWidget({
    super.key,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(Object context) {
    return Padding(
      padding: const EdgeInsetsDirectional.only(end: 50.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 25.sp,
              fontWeight: FontWeight.w600,
              color: Colors.blueGrey,
            ),
          ),
          Text(
            subtitle,
            style: TextStyle(
              fontSize: 15.sp,
              fontWeight: FontWeight.w400,
            ),
          ),
          SizedBox(height: 10.h),
        ],
      ),
    );
  }
}
