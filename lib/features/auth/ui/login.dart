import 'package:scavenge_hunt/constants/app_colors.dart';
import 'package:scavenge_hunt/constants/app_fonts.dart';
import 'package:scavenge_hunt/constants/app_images.dart';
import 'package:scavenge_hunt/constants/app_sizes.dart';
import 'package:scavenge_hunt/view/screens/auth/forgot_pass/forgot_pass.dart';
import 'package:scavenge_hunt/view/screens/auth/sign_up/sign_up.dart';
import 'package:scavenge_hunt/view/screens/home/home.dart';
import 'package:scavenge_hunt/view/widget/blur_container_widget.dart';
import 'package:scavenge_hunt/view/widget/custom_check_box_widget.dart';
import 'package:scavenge_hunt/view/widget/custom_container_widget.dart';
import 'package:scavenge_hunt/view/widget/headings_widget.dart';
import 'package:scavenge_hunt/view/widget/my_button_widget.dart';
import 'package:scavenge_hunt/view/widget/my_text_field_widget.dart';
import 'package:scavenge_hunt/view/widget/my_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scavenge_hunt/view/widget/social_login_%20widget.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      bgImage: Assets.imagesAuthBg,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Column(
          children: [
            SizedBox(height: 39),
            Expanded(child: _Login()),
          ],
        ),
      ),
    );
  }
}

class _Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppSizes.DEFAULT,
      child: BlurredContainer(
        height: Get.height,
        child: ListView(
          shrinkWrap: true,
          padding: AppSizes.AUTH_PADDING,
          physics: BouncingScrollPhysics(),
          children: [
            AuthHeading(
              title: 'Login',
              subTitle: 'Enter your email and password to log in',
            ),
            MyTextField(hintText: 'Loisbecket@gmail.com'),
            MyTextField(
              marginBottom: 12,
              hintText: '********',
              suffix: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [Image.asset(Assets.imagesVisibility, height: 20)],
              ),
            ),
            Row(
              children: [
                CustomCheckBox(isActive: false, onTap: () {}),
                Expanded(
                  child: MyText(
                    paddingLeft: 6,
                    text: 'Remember me',
                    size: 14,
                    weight: FontWeight.w500,
                  ),
                ),
                MyText(
                  onTap: () {
                    Get.to(() => ForgotPassword());
                  },
                  size: 14,
                  text: 'Forgot Password?',
                  weight: FontWeight.w500,
                ),
              ],
            ),
            SizedBox(height: 25),
            MyButton(
              buttonText: 'Login',
              onTap: () {
                Get.to(() => Home());
              },
            ),
            SizedBox(height: 25),
            Row(
              spacing: 16,
              children: [
                Expanded(child: Container(height: 1, color: kPrimaryColor)),
                MyText(
                  text: 'Or login with',
                  size: 14,
                  weight: FontWeight.w500,
                ),
                Expanded(child: Container(height: 1, color: kPrimaryColor)),
              ],
            ),
            SizedBox(height: 25),
            Row(
              spacing: 16,
              children: List.generate(3, (index) {
                return Expanded(
                  child: SocialLogin(
                    icon: [
                      Assets.imagesGoogle,
                      Assets.imagesFacebook,
                      Assets.imagesApple,
                    ][index],
                    onTap: () {},
                  ),
                );
              }),
            ),

            SizedBox(height: 25),
            Center(
              child: Wrap(
                children: [
                  MyText(
                    text: 'Don’t have an account? ',
                    size: 12,
                    color: kTertiaryColor.withValues(alpha: 0.6),
                  ),
                  MyText(
                    onTap: () {
                      Get.to(() => SignUp());
                    },
                    decoration: TextDecoration.underline,
                    text: 'Sign Up',
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
