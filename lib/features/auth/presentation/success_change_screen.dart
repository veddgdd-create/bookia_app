import 'package:bookia_app/core/constants/colors.dart';
import 'package:bookia_app/core/functions/main_button.dart';
import 'package:bookia_app/features/auth/presentation/log_in_screen.dart';
import 'package:flutter/material.dart';

class SuccessChangeScreen extends StatelessWidget {
  const SuccessChangeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 150),
                Center(
                  child: Image(
                    height: 150,
                    image: AssetImage('assets/images/Successmark.png'),
                  ),
                ),
                const SizedBox(height: 40),
                const Text(
                  'Password Changed!',
                  style: TextStyle(
                    fontSize: 28,
                    color: AppColors.bookiacolor,
                    fontWeight: FontWeight.normal,
                    fontFamily: 'Schyler',
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  'Your password has been changed \n successfully.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 15,
                    color: AppColors.bookiacolor,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Schyler',
                  ),
                ),
                const SizedBox(height: 50),
                Main_Button(
                  text: 'Back to Login',
                  button_color: AppColors.primary,
                  Button_style: const TextStyle(
                    fontSize: 15,
                    color: Colors.white,
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Schyler',
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const LogInScreen(),
                      ),
                    );
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
