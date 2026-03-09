import 'package:bookia_app/core/constants/app_images.dart';
import 'package:bookia_app/core/routes/naviagtion.dart';
import 'package:bookia_app/core/routes/routes.dart';
import 'package:bookia_app/core/utils/colors.dart';
import 'package:bookia_app/core/utils/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class SuccessChangePassword extends StatelessWidget {
  const SuccessChangePassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(22),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                AppImages.successMark,
                width: 150,
                height: 150,
                fit: BoxFit.contain,
              ),
              const Gap(30),
              Text(
                'Password Changed!',
                style: TextStyles.styleSize30(
                  color: AppColors.darkColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Gap(15),
              Text(
                'Your password has been changed successfully.',
                style: TextStyles.styleSize16(color: AppColors.greyColor),
                textAlign: TextAlign.center,
              ),
              const Gap(40),
              ElevatedButton(
                onPressed: () {
                  pushWithReplacement(context, Routes.login);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primaryColor,
                  foregroundColor: AppColors.whiteColor,
                  minimumSize: const Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Text(
                  'Back to Login',
                  style: TextStyles.styleSize18(
                    color: AppColors.whiteColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
