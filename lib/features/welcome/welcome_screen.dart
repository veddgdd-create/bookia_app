import 'package:bookia_app/components/buttons/main_button.dart';
import 'package:bookia_app/core/constants/app_images.dart';
import 'package:bookia_app/core/routes/naviagtion.dart';
import 'package:bookia_app/core/routes/routes.dart';
import 'package:bookia_app/core/utils/colors.dart';
import 'package:bookia_app/core/utils/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            AppImages.backgroundWelcome,
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: const EdgeInsets.all(22),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 80),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        AppImages.logo2,
                        width: 220,
                        height: 80,
                        fit: BoxFit.contain,
                      ),
                    ],
                  ),
                ),
                SvgPicture.asset(AppImages.logoSvg, width: 220),
                Gap(20),
                Text('Order Your Book Now!', style: TextStyles.styleSize20()),
                Spacer(flex: 5),
                MainButton(
                  text: 'Login',
                  onPressed: () {
                    pushTo(context, Routes.login);
                  },
                ),
                Gap(15),
                MainButton(
                  borderColor: AppColors.darkColor,
                  bgColor: AppColors.whiteColor,
                  textColor: AppColors.darkColor,
                  text: 'Register',
                  onPressed: () {
                    pushTo(context, Routes.register);
                  },
                ),
                Spacer(flex: 1),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
