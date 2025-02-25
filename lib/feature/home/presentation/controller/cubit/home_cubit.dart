import 'package:ai_weather/core/location/location_services.dart';
import 'package:ai_weather/feature/home/data/model/weather_model.dart';
import 'package:ai_weather/feature/home/domain/entities/home_entities.dart';
import 'package:ai_weather/feature/home/domain/use_case/get_prediction_use_case.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:ai_weather/feature/home/domain/use_case/get_weather_use_case.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit({required this.weatherUseCase, required this.predictionUseCase})
      : super(HomeInitial());

  static HomeCubit get(context) => BlocProvider.of(context);

  final GetWeatherUseCase weatherUseCase;
  final GetPredictionUseCase predictionUseCase;

  WeatherModel? weatherData;
  Future<void> getHomeData() async {
    final currentLocation =
        await LocationServices.getCurrentLocation() ?? 'cairo';
    emit(HomeLoadingState());
    final result = await weatherUseCase(location: currentLocation);
    result.fold(
      (failure) {
        emit(HomeErrorState(errorMessage: failure.message));
      },
      (weather) {
        weatherData = weather;
        emit(HomeSuccessState());
      },
    );
  }

/* -------------------------------------------------------------------------- */
/*                           get prediction use case                          */
/* -------------------------------------------------------------------------- */
  int? predictionResult;

  Future<void> getPrediction() async {
    emit(GetPredictionLoadingState());
    final weatherEntity = WeatherEntity(
      temperature: weatherData?.current?.tempC ?? 0.0,
      humidity: weatherData?.current?.humidity ?? 0,
      precipitation: weatherData?.current?.precipMm ?? 0.0,
      cloudiness: weatherData?.current?.cloud ?? 0,
    );
    final prediction = await predictionUseCase(weatherEntity: weatherEntity);
    prediction.fold(
      (failure) {
        print('error from cubit presentation layer: ${failure.message}');
        emit(GetPredictionErrorState(errorMessage: failure.message));
      },
      (result) {
        emit(GetPredictionSuccessState());
        predictionResult = result;
        print(
            'prediction result is from cubit in success state: $predictionResult');
      },
    );
  }

  int currentIndex = 0;
  DateTime selectedDate = DateTime.now();
  void changeDateState(DateTime date) {
    emit(HomeInitial());
    selectedDate = date;
    emit(ChangeDateTimeState());
  }

  void changeIndex(DateTime date) {
    final now = DateTime.now();
    emit(HomeInitial());

    // Compute the difference in days
    currentIndex =
        date.difference(DateTime(now.year, now.month, now.day)).inDays;

    emit(ChangeIndexState());
  }
}
