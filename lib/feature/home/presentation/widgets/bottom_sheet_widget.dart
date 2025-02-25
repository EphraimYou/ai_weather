import 'package:ai_weather/core/utils/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quickalert/quickalert.dart';

class BottomSheetWidget extends StatelessWidget {
  final String maxTemp;
  final String wind;
  final String precipitate;
  final String snow;
  final String uv;
  final String visibility;
  final int predictionValue;

  const BottomSheetWidget({
    super.key,
    required this.maxTemp,
    required this.wind,
    required this.precipitate,
    required this.snow,
    required this.uv,
    required this.visibility,
    required this.predictionValue,
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
          header(context: context, predictionValue: predictionValue),
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
                value: precipitate,
              ),
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

  Widget header({required BuildContext context, required int predictionValue}) {
    return Padding(
      padding: const EdgeInsetsDirectional.symmetric(horizontal: 20.0),
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
          Spacer(),
          MaterialButton(
            onPressed: () {
              if (predictionValue == 1) {
                QuickAlert.show(
                  context: context,
                  autoCloseDuration: Duration(seconds: 10),
                  type: QuickAlertType.success,
                  text: AppStrings.goodWeather,
                );
              } else {
                QuickAlert.show(
                  context: context,
                  autoCloseDuration: Duration(seconds: 10),
                  type: QuickAlertType.warning,
                  text: AppStrings.badWeather,
                );
              }
            },
            color: Colors.lightBlue[900],
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.r)),
            child: Text(
              'Prediction',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16.sp,
                fontWeight: FontWeight.w500,
              ),
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
