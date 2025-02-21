// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LocationWidget extends StatelessWidget {
  final String image;
  final String country;
  final String region;

  const LocationWidget({
    super.key,
    required this.image,
    required this.country,
    required this.region,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: 60.h,
          width: 60.w,
          child: Image(
            image: NetworkImage(image),
            fit: BoxFit.cover,
          ),
        ),
        Text(
          '$region, $country',
          style: TextStyle(
            color: Colors.black,
            fontSize: 16.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
