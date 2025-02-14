part of 'signup_cubit.dart';

sealed class SignupState extends Equatable {
  const SignupState();

  @override
  List<Object> get props => [];
}

final class SignupInitial extends SignupState {}

final class SignupLoadingState extends SignupState {}

final class SignupSuccessState extends SignupState {}

final class SignupErrorState extends SignupState {
  final String errorMessage;

  const SignupErrorState({required this.errorMessage});
}

final class CreateUserSuccessState extends SignupState {}

final class CreateUserErrorState extends SignupState {
  final String errorMessage;

  const CreateUserErrorState({required this.errorMessage});
}

final class ShowPasswordState extends SignupState {}
