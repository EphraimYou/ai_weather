import 'package:ai_weather/feature/auth/login/data/data_source/remote/login_remote_data_source.dart';
import 'package:ai_weather/feature/auth/login/domain/entities/user_login_entity.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginRemoteDataSourceImpl implements LoginRemoteDataSource {
  @override
  Future<UserCredential> login(
      {required UserLoginEntity userLoginEntity}) async {
    return await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: userLoginEntity.email, password: userLoginEntity.password);
  }
}
