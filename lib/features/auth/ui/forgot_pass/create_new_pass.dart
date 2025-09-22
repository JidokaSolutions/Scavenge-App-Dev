import 'package:flutter/material.dart';

import '../../../../core/constants/app_images.dart';
import '../../../../core/constants/app_sizes.dart';
import '../../../../core/routes/app_navigation.dart';
import '../../../../core/widgets/blur_container_widget.dart';
import '../../../../core/widgets/custom_container_widget.dart';
import '../../../../core/widgets/headings_widget.dart';
import '../../../../core/widgets/my_button_widget.dart';
import '../../../../core/widgets/my_text_field_widget.dart';

class CreateNewPassword extends StatelessWidget {
  const CreateNewPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      bgImage: Assets.imagesAuthBg,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [_CreateNewPassword()],
        ),
      ),
    );
  }
}

class _CreateNewPassword extends StatelessWidget {
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
                    AppNavigation.pop(context);
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
              title: 'Create New Password',
              subTitle: "Set your new password. Make sure it's strong and memorable.",
            ),
            MyTextField(
              hintText: 'Password',
              suffix: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [Image.asset(Assets.imagesVisibility, height: 20)],
              ),
            ),
            MyTextField(
              marginBottom: 25,
              hintText: 'Confirm Password',
              suffix: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [Image.asset(Assets.imagesVisibility, height: 20)],
              ),
            ),
            MyButton(buttonText: 'Done', onTap: () {}),
          ],
        ),
      ),
    );
  }
}
