import 'package:ai_weather/core/components/toast.dart';
import 'package:ai_weather/core/di/service_locator.dart';
import 'package:ai_weather/core/utils/app_assets.dart';
import 'package:ai_weather/feature/home/domain/use_case/get_prediction_use_case.dart';
import 'package:ai_weather/feature/home/domain/use_case/get_weather_use_case.dart';
import 'package:ai_weather/feature/home/presentation/controller/cubit/home_cubit.dart';
import 'package:ai_weather/feature/home/presentation/widgets/calender.dart';
import 'package:ai_weather/feature/home/presentation/widgets/indicator.dart';
import 'package:ai_weather/feature/home/presentation/widgets/location.dart';
import 'package:ai_weather/feature/home/presentation/widgets/temp_details.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: BlocProvider(
          create: (context) => HomeCubit(
              weatherUseCase: sl<GetWeatherUseCase>(),
              predictionUseCase: sl<GetPredictionUseCase>())
            ..getPrediction()
            ..getHomeData(),
          child: BlocConsumer<HomeCubit, HomeState>(listener: (context, state) {
            if (state is HomeErrorState) {
              showMessage(
                message: state.errorMessage,
                state: ToastStates.error,
                context: context,
              );
            }
          }, builder: (context, state) {
            HomeCubit cubit = HomeCubit.get(context);
            var weatherDetails = cubit
                .weatherData?.forecast?.forecastDay?[cubit.currentIndex].day;
            return ConditionalBuilder(
              condition: cubit.weatherData == null,
              builder: (context) => Center(child: CircularProgressIndicator()),
              fallback: (context) => Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(AppAssets.background),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Column(
                  children: [
                    Calender(
                      focusDate: HomeCubit.get(context).selectedDate,
                      onDateChange: (date) {
                        HomeCubit.get(context).changeDateState(date);
                        HomeCubit.get(context).changeIndex(date);
                      },
                    ),
                    LocationWidget(
                      image:
                          'https:${weatherDetails?.condition?.icon ?? 'null'}',
                      country: cubit.weatherData?.location?.country ?? 'null',
                      region: cubit.weatherData?.location?.name ?? 'null',
                    ),
                    TempDetails(
                      tempValue: weatherDetails?.maxTempC.toString() ?? 'null',
                      cloudValue:
                          cubit.weatherData?.current?.cloud.toString() ??
                              'null',
                      humidityValue:
                          weatherDetails?.avgHumidity.toString() ?? 'null',
                    ),
                    Spacer(),
                    Indicator(
                      predictionValue: cubit.predictionResult ?? 0,
                      maxTemp: weatherDetails?.maxTempC.toString() ?? 'null',
                      wind: weatherDetails?.maxWindKph.toString() ?? 'null',
                      precipitate:
                          weatherDetails?.totalPrecipIn.toString() ?? 'null',
                      snow: weatherDetails?.totalSnowCm.toString() ?? 'null',
                      uv: weatherDetails?.uv.toString() ?? 'null',
                      visibility: weatherDetails?.avgVisKm.toString() ?? 'null',
                    ),
                  ],
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}
