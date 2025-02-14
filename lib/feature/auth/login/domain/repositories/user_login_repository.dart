import 'package:ai_weather/core/error/exception.dart';
import 'package:ai_weather/feature/auth/login/domain/entities/user_login_entity.dart';
import 'package:dartz/dartz.dart';

abstract class UserLoginRepository {
  
  Future<Either<ServerException, Unit>> login(
      {required UserLoginEntity userLoginEntity});
}
