import 'package:ai_weather/feature/auth/signup/domain/entities/signup_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:ai_weather/core/error/exception.dart';
import 'package:ai_weather/feature/auth/signup/domain/repositories/user_signup_repo.dart';

class SignupUseCase {
  UserSignupRepo userSignupRepo;

  SignupUseCase({
    required this.userSignupRepo,
  });

  Future<Either<ServerException, Unit>> call(
      UserSignupEntity userSignupEntity) async {
    try {
      final result =
          await userSignupRepo.signup(userSignupEntity: userSignupEntity);
      return result;
    } catch (e) {
      return Left(ServerException(message: e.toString()));
    }
  }
}
