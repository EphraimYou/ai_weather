// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:ai_weather/feature/auth/login/domain/entities/user_login_entity.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:ai_weather/feature/auth/login/domain/use_cases/user_login_use_case.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  UserLoginUseCase userLoginUseCase;

  LoginCubit({required this.userLoginUseCase}) : super(LoginInitial());

  static LoginCubit of(context) => BlocProvider.of<LoginCubit>(context);

  Future<void> userLogin({
    required String email,
    required String password,
  }) async {
    emit(LoginLoadingState());
    final userLoginEntity = UserLoginEntity(email: email, password: password);
    final result = await userLoginUseCase(userLoginEntity);
    result.fold(
      (failure) {
        emit(LoginErrorState(errorMessage: failure.toString()));
      },
      (r) {
        emit(LoginSuccessState());
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
