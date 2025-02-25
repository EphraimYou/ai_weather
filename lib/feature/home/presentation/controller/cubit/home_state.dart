part of 'home_cubit.dart';

sealed class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

final class HomeInitial extends HomeState {}

final class HomeLoadingState extends HomeState {}

final class HomeSuccessState extends HomeState {}

final class HomeErrorState extends HomeState {
  final String errorMessage;

  const HomeErrorState({required this.errorMessage});
}

/* -------------------------------------------------------------------------- */
final class GetPredictionLoadingState extends HomeState {}

final class GetPredictionSuccessState extends HomeState {}

final class GetPredictionErrorState extends HomeState {
  final String errorMessage;

  const GetPredictionErrorState({required this.errorMessage});
}

/* -------------------------------------------------------------------------- */
final class ChangeIndexState extends HomeState {}

final class ChangeDateTimeState extends HomeState {}
