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
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWithBack(),
      body: _buildRegisterBody(context),
      bottomNavigationBar: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Already have an account?', style: TextStyles.styleSize14()),
          TextButton(
            onPressed: () {
              pushWithReplacement(context, Routes.login);
            },
            child: Text(
              'Sign In',
              style: TextStyles.styleSize14(color: AppColors.primaryColor),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRegisterBody(BuildContext context) {
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
              children: [
                Text(
                  'Hello! Register to get \n started',
                  style: TextStyles.styleSize30(),
                ),
                Gap(30),
                CustomTextField(
                  controller: cubit.nameController,
                  hint: 'User Name',
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Name is required';
                    }
                    return null;
                  },
                ),
                Gap(12),
                CustomTextField(
                  controller: cubit.emailController,
                  hint: 'Email',
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Email is required';
                    }
                    return null;
                  },
                ),
                Gap(12),
                PasswordTextField(
                  controller: cubit.passwordController,
                  hint: 'Password',
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Password is required';
                    }
                    return null;
                  },
                ),
                Gap(12),
                PasswordTextField(
                  controller: cubit.confirmPasswordController,
                  hint: 'Confirm password',
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Confirm Password is required';
                    }

                    return null;
                  },
                ),
                Gap(30),
                MainButton(
                  text: 'Register',
                  onPressed: () {
                    if (cubit.formKey.currentState!.validate()) {
                      cubit.register();
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
