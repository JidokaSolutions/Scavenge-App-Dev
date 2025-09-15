import 'package:scavenge_hunt/constants/app_colors.dart';
import 'package:scavenge_hunt/constants/app_fonts.dart';
import 'package:scavenge_hunt/constants/app_images.dart';
import 'package:scavenge_hunt/constants/app_sizes.dart';
import 'package:scavenge_hunt/view/screens/auth/forgot_pass/create_new_pass.dart';
import 'package:scavenge_hunt/view/widget/blur_container_widget.dart';
import 'package:scavenge_hunt/view/widget/my_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scavenge_hunt/view/widget/custom_container_widget.dart';
import 'package:scavenge_hunt/view/widget/headings_widget.dart';
import 'package:pinput/pinput.dart';
import 'package:scavenge_hunt/view/widget/my_text_widget.dart';

class OTPVerification extends StatelessWidget {
  const OTPVerification({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      bgImage: Assets.imagesAuthBg,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [_OTPVerification()],
        ),
      ),
    );
  }
}

class _OTPVerification extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final PinTheme pinTheme = PinTheme(
      width: 48,
      height: 48,
      margin: EdgeInsets.zero,
      textStyle: TextStyle(
        fontSize: 16,
        height: 0.0,
        fontWeight: FontWeight.w500,
        fontFamily: AppFonts.Nunito,
        color: kTertiaryColor,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: kPrimaryColor,
      ),
    );

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
              title: 'Verification Code',
              subTitle:
                  "Please enter the code we just sent to your email abc*****12@gmail.com.",
            ),
            Pinput(
              keyboardType: TextInputType.number,
              length: 6,
              pinContentAlignment: Alignment.center,
              defaultPinTheme: pinTheme,
              focusedPinTheme: pinTheme,
              submittedPinTheme: pinTheme,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              onCompleted: (value) {},
            ),
            SizedBox(height: 24),
            MyButton(
              buttonText: 'Verify',
              onTap: () {
                Get.to(() => CreateNewPassword());
              },
            ),
            SizedBox(height: 24),
            Center(
              child: Wrap(
                children: [
                  // Sent code again 01:00
                  MyText(
                    text: 'Didn’t receive OTP? ',
                    size: 12,
                    color: kTertiaryColor.withValues(alpha: 0.6),
                  ),
                  MyText(
                    onTap: () {},
                    decoration: TextDecoration.underline,
                    text: 'Resend',
                    fontFamily: AppFonts.Fredoka,
                    weight: FontWeight.w500,
                    size: 12,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
