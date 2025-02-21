import 'package:ai_weather/core/location/location_services.dart';
import 'package:ai_weather/feature/home/data/model/weather_model.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:ai_weather/feature/home/domain/use_case/get_weather_use_case.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit({required this.weatherUseCase}) : super(HomeInitial());

  static HomeCubit get(context) => BlocProvider.of(context);

  WeatherModel? weatherData;
  final GetWeatherUseCase weatherUseCase;
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

  int currentIndex = 0;

  // void changeIndex(int index) {
  //   emit(HomeInitial());
  //   currentIndex = index;
  //   emit(ChangeIndexState());
  // }

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
