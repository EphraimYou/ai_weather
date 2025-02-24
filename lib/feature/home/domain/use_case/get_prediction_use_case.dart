import 'package:dartz/dartz.dart';

import 'package:ai_weather/core/error/exception.dart';
import 'package:ai_weather/feature/home/domain/repositories/home_repositories.dart';

class GetPredictionUseCase {
  final HomeRepository homeRepository;

  GetPredictionUseCase({
    required this.homeRepository,
  });

  Future<Either<ServerException, int>> call() async {
    return await homeRepository.getPrediction(
      features: [0, 1, 0, 1, 1],
    );
  }
}
