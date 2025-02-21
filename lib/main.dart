import 'package:ai_weather/config/routes/routes.dart';
import 'package:ai_weather/config/themes/app_theme.dart';
import 'package:ai_weather/core/di/service_locator.dart';
import 'package:ai_weather/core/helper/cache_helper.dart';
import 'package:ai_weather/core/utils/app_strings.dart';
import 'package:ai_weather/observer.dart';
import 'package:bloc/bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupLocator();
  await Firebase.initializeApp();
  await CacheHelper.init();

  Bloc.observer = MyBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          title: AppStrings.projectNme,
          theme: AppTheme.lightTheme,
          debugShowCheckedModeBanner: false,
          initialRoute: AppRoutes.home,
          onGenerateRoute: (settings) => Routes.onGenerate(settings),
        );
      },
    );
  }
}
