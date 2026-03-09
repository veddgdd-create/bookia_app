import 'package:bookia_app/components/app_bar/app_bar_with_back.dart';
import 'package:bookia_app/components/buttons/main_button.dart';
import 'package:bookia_app/components/inputs/password_text_field.dart';
import 'package:bookia_app/core/utils/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class ChangePasswordScreen extends StatelessWidget {
  const ChangePasswordScreen({super.key});

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
              Text('Change Password', style: TextStyles.styleSize30()),
              Gap(10),
              Text(
                'Please enter your current password and new password.',
                style: TextStyles.styleSize16(),
              ),
              Gap(30),
              PasswordTextField(
                controller: TextEditingController(),
                hint: 'Current password',
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your current password';
                  }
                  return null;
                },
              ),
              Gap(12),
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
                text: 'Update Password',
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
