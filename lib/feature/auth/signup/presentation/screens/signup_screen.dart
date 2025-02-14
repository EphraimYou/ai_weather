import 'package:ai_weather/config/routes/routes.dart';
import 'package:ai_weather/core/components/button.dart';
import 'package:ai_weather/core/components/text_form.dart';
import 'package:ai_weather/core/components/toast.dart';
import 'package:ai_weather/core/di/service_locator.dart';
import 'package:ai_weather/core/utils/app_strings.dart';
import 'package:ai_weather/feature/auth/signup/domain/use_case/create_user_use_case.dart';
import 'package:ai_weather/feature/auth/signup/domain/use_case/signup_use_case.dart';
import 'package:ai_weather/feature/auth/signup/presentation/controller/cubit/signup_cubit.dart';
import 'package:ai_weather/feature/auth/signup/presentation/widgets/heder.dart';
import 'package:ai_weather/feature/auth/signup/presentation/widgets/registration_route_widget.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final nameController = TextEditingController();
    final emailController = TextEditingController();
    final passwordController = TextEditingController();
    final phoneController = TextEditingController();
    final formKey = GlobalKey<FormState>();

    return BlocProvider(
      create: (context) => SignupCubit(
          signupUseCase: sl<SignupUseCase>(),
          createUserUseCase: sl<CreateUserUseCase>()),
      child: Scaffold(
        body: SafeArea(
            child: BlocConsumer<SignupCubit, SignupState>(
          listener: (context, state) {
            if (state is SignupSuccessState) {
              Navigator.pushNamed(context, AppRoutes.home);
              showMessage(
                message: AppStrings.signupSucc,
                state: ToastStates.success,
                context: context,
              );
            } else if (state is SignupErrorState) {
              showMessage(
                message: state.errorMessage,
                state: ToastStates.error,
                context: context,
              );
            }
          },
          builder: (context, state) {
            return Form(
              key: formKey,
              autovalidateMode: AutovalidateMode.always,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    HederWidget(
                      title: AppStrings.createAcc,
                      subtitle: AppStrings.registerSubtitle,
                    ),
                    TextForm(
                      hintText: AppStrings.nameHint,
                      prefixIcon: Icons.person,
                      autofocus: true,
                      controller: nameController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return AppStrings.nameValidate;
                        }
                        return null;
                      },
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
                      controller: passwordController,
                      suffixIcon: SignupCubit.of(context).suffix,
                      obscureText: SignupCubit.of(context).isPasswordVisible,
                      onTap: () =>
                          SignupCubit.of(context).togglePasswordVisibility(),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return AppStrings.passwordValidate;
                        }
                        return null;
                      },
                    ),
                    TextForm(
                      hintText: AppStrings.phoneHint,
                      prefixIcon: Icons.phone,
                      controller: phoneController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return AppStrings.phoneValidate;
                        }
                        return null;
                      },
                    ),
                    ConditionalBuilder(
                      condition: state is SignupLoadingState,
                      builder: (context) =>
                          Center(child: CircularProgressIndicator()),
                      fallback: (context) => DefaultButton(
                        backgroundColor: Colors.blueGrey,
                        function: () {
                          if (formKey.currentState!.validate()) {
                            SignupCubit.of(context).userSignup(
                              name: nameController.text,
                              email: emailController.text,
                              password: passwordController.text,
                              phone: phoneController.text,
                            );
                          }
                        },
                        text: AppStrings.signup,
                      ),
                    ),
                    RegistrationRouteWidget(
                      description: AppStrings.haveAcc,
                      text: AppStrings.login,
                      onTap: () {
                        Navigator.pushNamed(context, AppRoutes.login);
                      },
                    )
                  ],
                ),
              ),
            );
          },
        )),
      ),
    );
  }
}
