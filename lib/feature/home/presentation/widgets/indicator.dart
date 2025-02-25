import 'package:ai_weather/feature/home/presentation/widgets/bottom_sheet_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Indicator extends StatelessWidget {
  final String maxTemp;
  final String wind;
  final String precipitate;
  final String snow;
  final String uv;
  final String visibility;
  final int predictionValue;

  const Indicator({
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
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          onPressed: () {
            showBottomSheet(
              backgroundColor: Colors.transparent,
              context: context,
              builder: (context) => Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(10, 0, 10, 30),
                child: BottomSheetWidget(
                  predictionValue: predictionValue,
                  maxTemp: maxTemp,
                  wind: wind,
                  precipitate: precipitate,
                  snow: snow,
                  uv: uv,
                  visibility: visibility,
                ),
              ),
            );
          },
          icon: Container(
            height: 4.h,
            width: 50.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(2),
              color: Colors.white,
            ),
          ),
        ),
        Text(
          'Sea details',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
            fontSize: 15.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
