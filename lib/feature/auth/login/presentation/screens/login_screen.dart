import 'package:ai_weather/config/routes/routes.dart';
import 'package:ai_weather/core/components/button.dart';
import 'package:ai_weather/core/components/text_form.dart';
import 'package:ai_weather/core/components/toast.dart';
import 'package:ai_weather/core/di/service_locator.dart';
import 'package:ai_weather/core/utils/app_strings.dart';
import 'package:ai_weather/feature/auth/login/domain/use_cases/user_login_use_case.dart';
import 'package:ai_weather/feature/auth/login/presentation/controller/cubit/login_cubit.dart';
import 'package:ai_weather/feature/auth/signup/presentation/widgets/heder.dart';
import 'package:ai_weather/feature/auth/signup/presentation/widgets/registration_route_widget.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final emailController = TextEditingController();
    final passwordController = TextEditingController();

    GlobalKey<FormState> formKey = GlobalKey<FormState>();

    return BlocProvider(
      create: (context) => LoginCubit(userLoginUseCase: sl<UserLoginUseCase>()),
      child: SafeArea(
        child: BlocConsumer<LoginCubit, LoginState>(
          listener: (context, state) {
            if (state is LoginErrorState) {
              showMessage(
                message: state.errorMessage,
                state: ToastStates.error,
                context: context,
              );
            } else if (state is LoginSuccessState) {
              Navigator.pushNamed(context, AppRoutes.home);
              showMessage(
                message: AppStrings.loginSucc,
                state: ToastStates.success,
                context: context,
              );
            }
          },
          builder: (context, state) {
            return Scaffold(
              body: Form(
                key: formKey,
                autovalidateMode: AutovalidateMode.always,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      HederWidget(
                        title: AppStrings.login,
                        subtitle: AppStrings.loginSubtitle,
                      ),
                      TextForm(
                        hintText: AppStrings.emailHint,
                        prefixIcon: Icons.email,
                        controller: emailController,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return AppStrings.emailValidate;
                          }
                          return null;
                        },
                      ),
                      TextForm(
                        hintText: AppStrings.passwordHint,
                        prefixIcon: Icons.lock,
                        obscureText: LoginCubit.of(context).isPasswordVisible,
                        onTap: () {
                          return LoginCubit.of(context)
                              .togglePasswordVisibility();
                        },
                        suffixIcon: LoginCubit.of(context).suffix,
                        controller: passwordController,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return AppStrings.passwordValidate;
                          }
                          return null;
                        },
                      ),
                      ConditionalBuilder(
                        condition: state is LoginLoadingState,
                        builder: (context) =>
                            Center(child: CircularProgressIndicator()),
                        fallback: (context) => DefaultButton(
                          backgroundColor: Colors.blueGrey,
                          function: () {
                            if (formKey.currentState!.validate()) {
                              LoginCubit.of(context).userLogin(
                                email: emailController.text,
                                password: passwordController.text,
                              );
                            }
                          },
                          text: AppStrings.login,
                        ),
                      ),
                      RegistrationRouteWidget(
                        description: AppStrings.dontHaveAcc,
                        text: AppStrings.signup,
                        onTap: () {
                          Navigator.pushNamed(context, AppRoutes.signup);
                        },
                      )
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
