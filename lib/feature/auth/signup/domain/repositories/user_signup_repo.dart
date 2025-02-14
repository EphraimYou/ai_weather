import 'package:ai_weather/core/error/exception.dart';
import 'package:ai_weather/feature/auth/signup/domain/entities/signup_entity.dart';
import 'package:dartz/dartz.dart';

abstract class UserSignupRepo {
  Future<Either<ServerException, Unit>> signup(
      {required UserSignupEntity userSignupEntity});

  Future<Either<ServerException, Unit>> createUser(
      {required UserSignupEntity userSignupEntity});
}
