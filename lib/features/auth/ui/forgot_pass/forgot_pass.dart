
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:scavenge_hunt/core/constants/app_images.dart';
import 'package:scavenge_hunt/core/constants/app_sizes.dart';
import 'package:scavenge_hunt/core/widgets/blur_container_widget.dart';
import 'package:scavenge_hunt/core/widgets/custom_container_widget.dart';
import 'package:scavenge_hunt/core/widgets/headings_widget.dart';
import 'package:scavenge_hunt/core/widgets/my_button_widget.dart';
import 'package:scavenge_hunt/core/widgets/my_text_field_widget.dart';

import 'otp_verification.dart';

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      bgImage: Assets.imagesAuthBg,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [_ForgotPassword()],
        ),
      ),
    );
  }
}

class _ForgotPassword extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppSizes.DEFAULT,
      child: BlurredContainer(
        child: ListView(
          shrinkWrap: true,
          padding: AppSizes.AUTH_PADDING,
          physics: BouncingScrollPhysics(),
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    Get.back();
                  },
                  child: Image.asset(
                    Assets.imagesArrowBack,
                    height: 20,
                    width: 20,
                  ),
                ),
                Image.asset(Assets.imagesLogo, height: 65),
                SizedBox(height: 20, width: 20),
              ],
            ),
            AuthHeading(
              showLogo: false,
              title: 'Forgot Password?',
              subTitle:
                  "Enter your email and we'll send you a 6-digit code straight to your inbox to verify it's really you!",
            ),
            MyTextField(hintText: 'Loisbecket@gmail.com', marginBottom: 25),

            MyButton(
              buttonText: 'Send',
              onTap: () {
                Get.to(() => OTPVerification());
              },
            ),
          ],
        ),
      ),
    );
  }
}
