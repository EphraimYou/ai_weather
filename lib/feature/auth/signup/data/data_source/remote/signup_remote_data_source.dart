import 'package:ai_weather/feature/auth/signup/domain/entities/signup_entity.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class SignupRemoteDataSource {
  Future<UserCredential> signup({required UserSignupEntity userSignupEntity});

  Future<void> createUser({required UserSignupEntity userSignupEntity});
}
