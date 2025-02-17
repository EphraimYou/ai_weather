import 'package:ai_weather/core/error/exception.dart';
import 'package:ai_weather/feature/home/data/model/weather_model.dart';
import 'package:ai_weather/feature/home/domain/repositories/home_repositories.dart';
import 'package:dartz/dartz.dart';

class GetWeatherUseCase {
  final HomeRepository homeRepository;

  GetWeatherUseCase({required this.homeRepository});

  Future<Either<ServerException, WeatherModel>> call(
      {required String location}) async {
    return await homeRepository.getHomeData(location: location);
  }
}
