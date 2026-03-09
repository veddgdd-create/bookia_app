import 'package:bookia_app/components/app_bar/app_bar_with_back.dart';
import 'package:bookia_app/components/buttons/main_button.dart';
import 'package:bookia_app/core/routes/naviagtion.dart';
import 'package:bookia_app/core/routes/routes.dart';
import 'package:bookia_app/core/utils/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class OtpScreen extends StatelessWidget {
  const OtpScreen({super.key});

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
              Text('OTP Verification', style: TextStyles.styleSize30()),
              Gap(10),
              Text(
                'Enter the verification code we just sent on \n your email address..',
                style: TextStyles.styleSize16(),
              ),
              Gap(30),
              // OTP Input Fields (placeholder - you can use otp_text_field package)
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(
                  6,
                  (index) => SizedBox(
                    width: 60,
                    height: 60,
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      textAlign: TextAlign.center,
                      maxLength: 1,
                      decoration: InputDecoration(
                        counterText: '',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Gap(30),
              MainButton(
                text: 'Verify',
                onPressed: () {
                  pushTo(context, Routes.newPassword);
                },
              ),
              Gap(20),
              Center(
                child: Text(
                  'Resend code in 60s',
                  style: TextStyles.styleSize16(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
