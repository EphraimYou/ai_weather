import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TempDetails extends StatelessWidget {
  final String tempValue;
  final String cloudValue;
  final String humidityValue;

  const TempDetails(
      {super.key,
      required this.tempValue,
      required this.cloudValue,
      required this.humidityValue});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        iconWidget(icon: Icons.cloud_sharp, value: cloudValue, unit: 'oktas'),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              tempValue,
              style: TextStyle(
                color: Colors.white,
                fontSize: 50.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
            Text(
              '\u00B0C',
              style: TextStyle(
                color: Colors.white,
                fontSize: 40.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
        iconWidget(icon: Icons.water_drop, value: humidityValue, unit: 'km'),
      ],
    );
  }

  Widget iconWidget(
      {required IconData icon, required String value, required String unit}) {
    return Column(
      children: [
        Container(
          height: 60.h,
          width: 60.w,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.white, width: 2.w),
            shape: BoxShape.circle,
          ),
          child: Icon(icon, color: Colors.white, size: 30),
        ),
        SizedBox(height: 10.h),
        Text(
          '$value$unit',
          style: TextStyle(
            color: Colors.white,
            fontSize: 22.sp,
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }
}
