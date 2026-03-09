import 'package:bookia_app/components/app_bar/app_bar_with_back.dart';
import 'package:bookia_app/components/buttons/main_button.dart';
import 'package:bookia_app/components/inputs/custom_text_field.dart';
import 'package:bookia_app/core/routes/naviagtion.dart';
import 'package:bookia_app/core/routes/routes.dart';
import 'package:bookia_app/core/utils/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

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
              Text('Forgot Password', style: TextStyles.styleSize30()),
              Gap(10),
              Text(
                'Don\'t worry! It occurs. Please enter the email \n address linked with your account.',
                style: TextStyles.styleSize16(),
              ),
              Gap(30),
              CustomTextField(
                controller: TextEditingController(),
                hint: 'Enter your email',
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email';
                  }
                  return null;
                },
              ),
              Gap(30),
              MainButton(
                text: 'Send Code',
                onPressed: () {
                  pushTo(context, Routes.otp);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
