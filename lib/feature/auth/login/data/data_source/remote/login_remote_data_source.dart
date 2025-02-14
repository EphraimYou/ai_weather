import 'package:ai_weather/feature/auth/login/domain/entities/user_login_entity.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class LoginRemoteDataSource {
  Future<UserCredential> login({required UserLoginEntity userLoginEntity});
}
