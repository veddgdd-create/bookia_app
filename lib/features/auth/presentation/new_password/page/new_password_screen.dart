import 'package:bookia_app/components/app_bar/app_bar_with_back.dart';
import 'package:bookia_app/components/buttons/main_button.dart';
import 'package:bookia_app/components/inputs/password_text_field.dart';
import 'package:bookia_app/core/routes/naviagtion.dart';
import 'package:bookia_app/core/routes/routes.dart';
import 'package:bookia_app/core/utils/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class NewPasswordScreen extends StatelessWidget {
  const NewPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWithBack(),
      body: Padding(
        padding: const EdgeInsets.all(22),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Create New Password', style: TextStyles.styleSize30()),
              Gap(10),
              Text(
                'Your new password must be unique from those \n previously used.',
                style: TextStyles.styleSize16(),
              ),
              Gap(30),
              PasswordTextField(
                controller: TextEditingController(),
                hint: 'New password',
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your new password';
                  }
                  return null;
                },
              ),
              Gap(12),
              PasswordTextField(
                controller: TextEditingController(),
                hint: 'Confirm new password',
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please confirm your new password';
                  }
                  return null;
                },
              ),
              Gap(30),
              MainButton(
                text: 'Reset Password',
                onPressed: () {
                  pushWithReplacement(context, Routes.successChangePassword);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
