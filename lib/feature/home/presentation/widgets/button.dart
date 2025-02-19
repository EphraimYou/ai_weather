import 'package:ai_weather/feature/home/presentation/controller/cubit/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

// ignore: must_be_immutable
class DayButton extends StatelessWidget {
  DayButton({super.key});

  List<String> titles = [
    'today',
    'tomorrow',
    DateFormat('MMM-dd').format(DateTime.now().add(Duration(days: 2))),
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40.h,
      child: ListView.separated(
        separatorBuilder: (context, index) => SizedBox(width: 10.w),
        scrollDirection: Axis.horizontal,
        itemCount: 3,
        itemBuilder: (context, index) => buildButton(
          title: titles[index],
          index: index,
          context: context,
          onTp: () {
            HomeCubit.get(context).changeIndex(index);
          },
        ),
      ),
    );
  }

  Widget buildButton({
    required String title,
    required VoidCallback onTp,
    required int index,
    required context,
  }) {
    return SizedBox(
      width: 105.w,
      child: MaterialButton(
        disabledTextColor: Colors.black,
        height: 40.h,
        color: HomeCubit.get(context).currentIndex == index
            ? Colors.grey
            : Color(0XFF68BFC8),
        animationDuration: Duration(seconds: 2),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.r)),
        onPressed: onTp,
        child: Text(
          title,
          style: TextStyle(
            color: Colors.white,
            fontSize: 16.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
