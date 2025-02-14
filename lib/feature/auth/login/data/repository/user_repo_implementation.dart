import 'package:dartz/dartz.dart';

import 'package:ai_weather/core/error/exception.dart';
import 'package:ai_weather/feature/auth/login/data/data_source/remote/login_remote_data_source.dart';
import 'package:ai_weather/feature/auth/login/domain/entities/user_login_entity.dart';
import 'package:ai_weather/feature/auth/login/domain/repositories/user_login_repository.dart';

class UserRepoImplementation implements UserLoginRepository {
  LoginRemoteDataSource loginRemoteDataSource;

  UserRepoImplementation({
    required this.loginRemoteDataSource,
  });

  @override
  Future<Either<ServerException, Unit>> login(
      {required UserLoginEntity userLoginEntity}) async {
    try {
      await loginRemoteDataSource.login(userLoginEntity: userLoginEntity);
      return const Right(unit);
    } catch (e) {
      return Left(ServerException(message: e.toString()));
    }
  }
}
