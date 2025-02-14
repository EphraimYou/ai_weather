import 'package:ai_weather/feature/auth/login/data/data_source/remote/login_remote_data_source.dart';
import 'package:ai_weather/feature/auth/login/data/data_source/remote/login_remote_data_source_impl.dart';
import 'package:ai_weather/feature/auth/login/data/repository/user_repo_implementation.dart';
import 'package:ai_weather/feature/auth/login/domain/repositories/user_login_repository.dart';
import 'package:ai_weather/feature/auth/login/domain/use_cases/user_login_use_case.dart';
import 'package:ai_weather/feature/auth/login/presentation/controller/cubit/login_cubit.dart';
import 'package:ai_weather/feature/auth/signup/data/data_source/remote/signup_remote_data_source.dart';
import 'package:ai_weather/feature/auth/signup/data/data_source/remote/signup_remote_data_source_impl.dart';
import 'package:ai_weather/feature/auth/signup/data/repository/signup_repo_implementation.dart';
import 'package:ai_weather/feature/auth/signup/domain/repositories/user_signup_repo.dart';
import 'package:ai_weather/feature/auth/signup/domain/use_case/create_user_use_case.dart';
import 'package:ai_weather/feature/auth/signup/domain/use_case/signup_use_case.dart';
import 'package:ai_weather/feature/auth/signup/presentation/controller/cubit/signup_cubit.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> setupLocator() async {
  //! feature authentication
  // Bloc
  sl.registerFactory(() => LoginCubit(userLoginUseCase: sl()));
  sl.registerFactory(
      () => SignupCubit(signupUseCase: sl(), createUserUseCase: sl()));

  // Use cases
  sl.registerLazySingleton(() => UserLoginUseCase(userLoginRepository: sl()));
  sl.registerLazySingleton(() => SignupUseCase(userSignupRepo: sl()));
  sl.registerLazySingleton(() => CreateUserUseCase(userSignupRepo: sl()));

  // Repository
  sl.registerLazySingleton<UserLoginRepository>(
      () => UserRepoImplementation(loginRemoteDataSource: sl()));
  sl.registerLazySingleton<UserSignupRepo>(
      () => SignupRepoImplementation(signupRemoteDataSource: sl()));

  // Data sources
  sl.registerLazySingleton<LoginRemoteDataSource>(
      () => LoginRemoteDataSourceImpl());
  sl.registerLazySingleton<SignupRemoteDataSource>(
      () => SignupRemoteDataSourceImpl());

  //! core
  // http
  // shared preferences

  //! external packages
}
