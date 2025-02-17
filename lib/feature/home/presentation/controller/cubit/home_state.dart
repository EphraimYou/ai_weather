part of 'home_cubit.dart';

sealed class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

final class HomeInitial extends HomeState {}

final class HomeLoadingState extends HomeState {}

final class HomeSuccessState extends HomeState {
  final WeatherModel weatherModel;

  const HomeSuccessState({required this.weatherModel});
  @override
  List<Object> get props => [weatherModel];
}

final class HomeErrorState extends HomeState {
  final String errorMessage;

  const HomeErrorState({required this.errorMessage});
}
