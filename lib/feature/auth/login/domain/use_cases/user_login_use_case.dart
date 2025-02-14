// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:ai_weather/core/error/exception.dart';
import 'package:ai_weather/feature/auth/login/domain/entities/user_login_entity.dart';
import 'package:ai_weather/feature/auth/login/domain/repositories/user_login_repository.dart';

import 'package:dartz/dartz.dart';

class UserLoginUseCase {
  UserLoginRepository userLoginRepository;

  UserLoginUseCase({
    required this.userLoginRepository,
  });

  Future<Either<ServerException, Unit>> call(
      UserLoginEntity userLoginEntity) async {
    try {
      final result = await userLoginRepository.login(userLoginEntity: userLoginEntity);
      return result;
    } catch (e) {
      return Left(ServerException(message: e.toString()));
    }
  }
}
