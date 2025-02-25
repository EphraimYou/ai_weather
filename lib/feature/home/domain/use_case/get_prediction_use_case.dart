import 'package:ai_weather/feature/home/domain/entities/home_entities.dart';
import 'package:dartz/dartz.dart';

import 'package:ai_weather/core/error/exception.dart';
import 'package:ai_weather/feature/home/domain/repositories/home_repositories.dart';

class GetPredictionUseCase {
  final HomeRepository homeRepository;

  GetPredictionUseCase({
    required this.homeRepository,
  });

  Future<Either<ServerException, int>> call(
      {required WeatherEntity weatherEntity}) async {
    return await homeRepository.getPrediction(
      // features: weatherEntity.weatherCategory(),
      features: [0, 0, 0, 0, 1], // Prediction: [0]
    );
  }
}
