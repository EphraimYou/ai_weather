import 'package:ai_weather/feature/home/data/model/weather_model.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:ai_weather/feature/home/domain/use_case/get_weather_use_case.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit({required this.weatherUseCase}) : super(HomeInitial());

  static HomeCubit get(context) => BlocProvider.of(context);

  final GetWeatherUseCase weatherUseCase;
  Future<void> getHomeData() async {
    emit(HomeLoadingState());
    final result = await weatherUseCase(location: 'London');
    result.fold(
      (failure) {
        print(failure.message);
        emit(HomeErrorState(errorMessage: failure.message));
      },
      (weather) {
        emit(HomeSuccessState(weatherModel: weather));
      },
    );
  }
}
