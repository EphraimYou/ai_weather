import 'package:ai_weather/core/error/exception.dart';
import 'package:ai_weather/feature/home/data/model/weather_model.dart';
import 'package:dartz/dartz.dart';

abstract class HomeRepository {
  Future<Either<ServerException, WeatherModel>> getHomeData(
      {required String location});
  Future<Either<ServerException, int>> getPrediction(
      {required List<int> features});
}
