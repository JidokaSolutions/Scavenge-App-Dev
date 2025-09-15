import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:scavenge_hunt/core/constants/app_images.dart';
import 'package:scavenge_hunt/core/constants/app_sizes.dart';
import 'package:scavenge_hunt/core/widgets/blur_container_widget.dart';
import 'package:scavenge_hunt/core/widgets/custom_container_widget.dart';
import 'package:scavenge_hunt/core/widgets/headings_widget.dart';
import 'package:scavenge_hunt/core/widgets/my_button_widget.dart';
import 'package:scavenge_hunt/core/widgets/my_text_field_widget.dart';

import 'package:scavenge_hunt/core/constants/app_colors.dart';
import 'package:scavenge_hunt/core/constants/app_fonts.dart';
import 'package:scavenge_hunt/core/widgets/my_text_widget.dart';


class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      bgImage: Assets.imagesAuthBg,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Column(
          children: [
            SizedBox(height: 39),
            Expanded(child: _Signup()),
          ],
        ),
      ),
    );
  }
}

class _Signup extends StatelessWidget {
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
              title: 'Sign Up',
              subTitle: 'Create an account to continue!',
            ),
            MyTextField(hintText: 'Lois'), // First Name
            MyTextField(hintText: 'Becket'), // Last Name
            MyTextField(hintText: 'Loisbecket@gmail.com'), // Email
            MyTextField(
              hintText: '18/03/2024',
              suffix: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [Image.asset(Assets.imagesCalendar, height: 18)],
              ),
            ),
            PhoneField(),
            MyTextField(
              marginBottom: 25,
              hintText: '********',
              suffix: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [Image.asset(Assets.imagesVisibility, height: 20)],
              ),
            ),
            MyButton(buttonText: 'Register', onTap: () {}),
            SizedBox(height: 25),

            Center(
              child: Wrap(
                children: [
                  MyText(
                    text: 'Already have an account? ',
                    size: 12,
                    color: kTertiaryColor.withValues(alpha: 0.6),
                  ),
                  MyText(
                    onTap: () {
                      Get.back();
                    },
                    decoration: TextDecoration.underline,
                    text: 'Login',
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
