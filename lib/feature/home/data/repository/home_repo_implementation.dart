import 'package:ai_weather/core/error/exception.dart';
import 'package:ai_weather/feature/home/data/data_source/remote/weather_data_source.dart';
import 'package:ai_weather/feature/home/data/model/weather_model.dart';
import 'package:ai_weather/feature/home/domain/repositories/home_repositories.dart';
import 'package:dartz/dartz.dart';

class HomeRepoImplementation implements HomeRepository {
  final WeatherDataSource weatherDataSource;

  HomeRepoImplementation({required this.weatherDataSource});
  @override
  Future<Either<ServerException, WeatherModel>> getHomeData(
      {required String location}) async {
    try {
      WeatherModel data =
          await weatherDataSource.getAllData(location: location);
      return Right(data);
    } catch (e) {
      return Left(ServerException(message: e.toString()));
    }
  }

  @override
  Future<Either<ServerException, int>> getPrediction(
      {required List<int> features}) async {
    try {
      final result = await weatherDataSource.getPrediction(features: features);
      return Right(result);
    } catch (e) {
      return Left(ServerException(message: e.toString()));
    }
  }
}
