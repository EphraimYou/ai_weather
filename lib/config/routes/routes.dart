import 'package:ai_weather/core/utils/app_strings.dart';
import 'package:ai_weather/feature/auth/login/presentation/screens/login_screen.dart';
import 'package:ai_weather/feature/auth/signup/presentation/screens/signup_screen.dart';
import 'package:ai_weather/feature/home/presentation/screens/hom_screen.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static const login = '/';
  static const signup = 'Signup';
  static const home = 'Home';
}

class Routes {
  static Route onGenerate(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.login:
        return MaterialPageRoute(builder: (context) => LoginScreen());
      case AppRoutes.signup:
        return MaterialPageRoute(builder: (context) => SignupScreen());
      case AppRoutes.home:
        return MaterialPageRoute(builder: (context) => HomeScreen());
      default:
        return MaterialPageRoute(
          builder: (context) => Scaffold(
            appBar: AppBar(title: Text(AppStrings.undefined)),
            body: undefinedRoute(),
          ),
        );
    }
  }
}

Widget undefinedRoute() {
  return Center(
    child: Text(AppStrings.undefinedRoute),
  );
}
