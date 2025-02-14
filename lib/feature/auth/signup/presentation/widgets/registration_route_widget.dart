// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RegistrationRouteWidget extends StatelessWidget {
  final String description;
  final String text;
  final VoidCallback onTap;

  const RegistrationRouteWidget({
    super.key,
    required this.description,
    required this.text,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          description,
          style: TextStyle(
            fontSize: 14.sp,
            fontWeight: FontWeight.w400,
          ),
        ),
        TextButton(
          onPressed: onTap,
          child: Text(
            text,
          ),
        ),
      ],
    );
  }
}
