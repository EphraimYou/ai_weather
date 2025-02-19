import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BottomSheetWidget extends StatelessWidget {
  final String maxTemp;
  final String wind;
  final String precipitate;
  final String snow;
  final String uv;
  final String visibility;

  const BottomSheetWidget({
    super.key,
    required this.maxTemp,
    required this.wind,
    required this.precipitate,
    required this.snow,
    required this.uv,
    required this.visibility,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 280.h,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white24,
        border: Border.all(
          width: 3,
          color: Colors.white,
        ),
        borderRadius: BorderRadius.circular(24.r),
      ),
      child: Column(
        children: [
          IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.remove_rounded,
                size: 50,
                color: Colors.white,
              )),
          header(),
          SizedBox(height: 20.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              buildItem(
                  icon: Icons.thermostat, title: 'max temp', value: maxTemp),
              buildItem(icon: Icons.water_sharp, title: 'wind', value: wind),
              buildItem(
                  icon: Icons.water_drop_outlined,
                  title: 'precipitate',
                  value: precipitate),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              buildItem(icon: Icons.ac_unit, title: 'total snow', value: snow),
              buildItem(icon: Icons.sensors, title: 'UV index', value: uv),
              buildItem(
                  icon: Icons.visibility,
                  title: 'visibility',
                  value: visibility)
            ],
          ),
        ],
      ),
    );
  }

  Widget header() {
    return Padding(
      padding: const EdgeInsetsDirectional.only(start: 20),
      child: Row(
        children: [
          Icon(
            Icons.cloud_outlined,
            size: 44,
            color: Colors.white,
          ),
          SizedBox(width: 10.w),
          Text(
            'Air Quality',
            style: TextStyle(
              color: Colors.white,
              fontSize: 22.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  Widget buildItem({
    required IconData icon,
    required String title,
    required String value,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          color: Colors.white,
          size: 25,
        ),
        SizedBox(width: 5.h),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                color: Colors.white,
                fontSize: 15.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
            Text(
              value,
              style: TextStyle(
                color: Colors.white,
                fontSize: 16.sp,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
