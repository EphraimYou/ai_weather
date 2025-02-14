// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:ai_weather/core/helper/cache_helper.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:ai_weather/feature/auth/signup/domain/entities/signup_entity.dart';
import 'package:ai_weather/feature/auth/signup/domain/use_case/create_user_use_case.dart';
import 'package:ai_weather/feature/auth/signup/domain/use_case/signup_use_case.dart';

part 'signup_state.dart';

class SignupCubit extends Cubit<SignupState> {
  final SignupUseCase signupUseCase;
  final CreateUserUseCase createUserUseCase;

  final uId = CacheHelper.getData(key: 'uId');

  SignupCubit({
    required this.signupUseCase,
    required this.createUserUseCase,
  }) : super(SignupInitial());

  static SignupCubit of(BuildContext context) =>
      BlocProvider.of<SignupCubit>(context);

  Future<void> userSignup({
    required String name,
    required String email,
    required String password,
    required String phone,
  }) async {
    emit(SignupLoadingState());
    final userSignupEntity = UserSignupEntity(
      name: name,
      email: email,
      phone: phone,
      password: password,
    );
    final result = await signupUseCase(userSignupEntity);

    result.fold(
      (failure) {
        emit(SignupErrorState(errorMessage: failure.toString()));
      },
      (_) {
        createUser(name: name, email: email, uId: uId, phone: phone);
        emit(SignupSuccessState());
      },
    );
  }

  Future<void> createUser({
    required String name,
    required String email,
    required String uId,
    required String phone,
  }) async {
    final userSignupEntity = UserSignupEntity(
      uId: uId,
      name: name,
      email: email,
      phone: phone,
    );
    final result = await createUserUseCase(userSignupEntity);
    result.fold(
      (failure) {
        emit(CreateUserErrorState(errorMessage: failure.toString()));
      },
      (_) {
        emit(CreateUserSuccessState());
      },
    );
  }

  IconData suffix = Icons.visibility_outlined;
  bool isPasswordVisible = true;

  void togglePasswordVisibility() {
    isPasswordVisible = !isPasswordVisible;
    suffix = isPasswordVisible
        ? Icons.visibility_outlined
        : Icons.visibility_off_outlined;
    emit(ShowPasswordState());
  }
}
