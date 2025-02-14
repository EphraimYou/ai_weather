import 'package:dartz/dartz.dart';

import 'package:ai_weather/core/error/exception.dart';
import 'package:ai_weather/feature/auth/signup/data/data_source/remote/signup_remote_data_source.dart';
import 'package:ai_weather/feature/auth/signup/domain/entities/signup_entity.dart';
import 'package:ai_weather/feature/auth/signup/domain/repositories/user_signup_repo.dart';

class SignupRepoImplementation implements UserSignupRepo {
  SignupRemoteDataSource signupRemoteDataSource;

  SignupRepoImplementation({
    required this.signupRemoteDataSource,
  });

  @override
  Future<Either<ServerException, Unit>> signup(
      {required UserSignupEntity userSignupEntity}) async {
    try {
      await signupRemoteDataSource.signup(userSignupEntity: userSignupEntity);
      return const Right(unit);
    } catch (e) {
      return Left(ServerException(message: e.toString()));
    }
  }

  @override
  Future<Either<ServerException, Unit>> createUser(
      {required UserSignupEntity userSignupEntity}) async {
    try {
      await signupRemoteDataSource.createUser(
          userSignupEntity: userSignupEntity);
      return const Right(unit);
    } catch (e) {
      return Left(ServerException(message: e.toString()));
    }
  }
}
