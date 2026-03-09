import 'package:bookia_app/components/app_bar/app_bar_with_back.dart';
import 'package:bookia_app/components/buttons/main_button.dart';
import 'package:bookia_app/components/inputs/custom_text_field.dart';
import 'package:bookia_app/components/inputs/password_text_field.dart';
import 'package:bookia_app/core/functions/dialogs.dart';
import 'package:bookia_app/core/routes/naviagtion.dart';
import 'package:bookia_app/core/routes/routes.dart';
import 'package:bookia_app/core/utils/colors.dart';
import 'package:bookia_app/core/utils/text_styles.dart';
import 'package:bookia_app/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:bookia_app/features/auth/presentation/cubit/auth_state.dart';
import 'package:bookia_app/features/auth/presentation/login/widgets/social_login.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWithBack(),
      body: _buildLoginBody(context),
      bottomNavigationBar: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Don\'t have an account?', style: TextStyles.styleSize14()),
          TextButton(
            onPressed: () {
              pushWithReplacement(context, Routes.register);
            },
            child: Text(
              'Sign Up',
              style: TextStyles.styleSize14(color: AppColors.primaryColor),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLoginBody(BuildContext context) {
    var cubit = context.read<AuthCubit>();
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is AuthLoadingState) {
          showLoadingDialog(context);
        } else if (state is AuthSuccessState) {
          goToBase(context, Routes.main);
        } else if (state is AuthErrorState) {
          pop(context);
          showMyDialog(context, state.message);
        }
      },
      child: Padding(
        padding: const EdgeInsets.all(22),
        child: SingleChildScrollView(
          child: Form(
            key: cubit.formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "Welcome back! Glad \n to see you, Again!",
                  style: TextStyles.styleSize30(),
                ),
                Gap(30),
                CustomTextField(
                  controller: cubit.emailController,
                  hint: "Enter your email".tr(),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your email';
                    }
                    return null;
                  },
                ),
                Gap(12),
                PasswordTextField(
                  controller: cubit.passwordController,
                  hint: "Enter your password".tr(),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your password';
                    }
                    return null;
                  },
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    style: TextButton.styleFrom(
                      padding: EdgeInsets.all(0),
                      overlayColor: Colors.transparent,
                    ),
                    onPressed: () {
                      pushTo(context, Routes.forgotPassword);
                    },
                    child: Text(
                      "forget_password".tr(),
                      style: TextStyles.styleSize16(),
                    ),
                  ),
                ),
                Gap(20),
                MainButton(
                  text: 'Login',
                  onPressed: () {
                    if (cubit.formKey.currentState!.validate()) {
                      cubit.login();
                    }
                  },
                ),
                Gap(20),
                SocialLogin(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
