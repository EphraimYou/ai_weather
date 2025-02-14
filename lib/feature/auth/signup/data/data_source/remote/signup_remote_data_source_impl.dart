import 'package:ai_weather/core/helper/cache_helper.dart';
import 'package:ai_weather/feature/auth/login/data/model/user_model.dart';
import 'package:ai_weather/feature/auth/signup/data/data_source/remote/signup_remote_data_source.dart';
import 'package:ai_weather/feature/auth/signup/domain/entities/signup_entity.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignupRemoteDataSourceImpl implements SignupRemoteDataSource {
  @override
  Future<UserCredential> signup(
      {required UserSignupEntity userSignupEntity}) async {
    final UserCredential userCredential =
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: userSignupEntity.email,
      password: userSignupEntity.password ?? 'null',
    );

    final uid = userCredential.user!.uid;
    CacheHelper.saveData(key: 'uId', value: uid);

    return userCredential;
  }

  @override
  Future<void> createUser({required UserSignupEntity userSignupEntity}) async {
    final model = UserModel(
      id: userSignupEntity.uId ?? 'null',
      name: userSignupEntity.name,
      email: userSignupEntity.email,
      phone: userSignupEntity.phone,
    );
    return await FirebaseFirestore.instance
        .collection('users')
        .doc(userSignupEntity.uId)
        .set(model.toJson());
  }
}
