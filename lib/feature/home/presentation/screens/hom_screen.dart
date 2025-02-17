import 'package:ai_weather/core/di/service_locator.dart';
import 'package:ai_weather/core/utils/app_strings.dart';
import 'package:ai_weather/feature/home/domain/use_case/get_weather_use_case.dart';
import 'package:ai_weather/feature/home/presentation/controller/cubit/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Screen'),
        centerTitle: true,
      ),
      body: BlocProvider(
        create: (context) =>
            HomeCubit(weatherUseCase: sl<GetWeatherUseCase>())..getHomeData(),
        child: BlocConsumer<HomeCubit, HomeState>(
          listener: (context, state) {},
          builder: (context, state) {
            if (state is HomeLoadingState) {
              return Center(child: CircularProgressIndicator());
            } else if (state is HomeSuccessState) {
              return Center(
                child: Text(
                  '${state.weatherModel.location?.country}',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w600,
                    color: Colors.blue,
                  ),
                ),
              );
            } else {
              return Center(child: Text(AppStrings.failedToFetch));
            }
          },
        ),
      ),
    );
  }
}
