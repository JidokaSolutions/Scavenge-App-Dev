import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scavenge_hunt/constants/app_fonts.dart';
import 'package:scavenge/constants/app_images.dart';
import 'package:scavenge/constants/app_sizes.dart';
import 'package:scavenge/view/screens/auth/login.dart';
import 'package:scavenge/view/widget/blur_container_widget.dart';
import 'package:scavenge/view/widget/custom_container_widget.dart';
import 'package:scavenge/view/widget/my_button_widget.dart';
import 'package:scavenge/view/widget/my_text_widget.dart';

class LocationPermission extends StatelessWidget {
  const LocationPermission({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      bgImage: Assets.imagesAuthBg,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Padding(
          padding: AppSizes.DEFAULT,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              BlurredContainer(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 30,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Image.asset(Assets.imagesAccessLocation, height: 100),
                      MyText(
                        paddingTop: 40,
                        text: 'Allow "Scavenge Hunt" To Access Your Location?',
                        size: 20,
                        textAlign: TextAlign.center,
                        weight: FontWeight.w600,
                        fontFamily: AppFonts.Fredoka,
                        paddingBottom: 20,
                      ),
                      MyText(
                        textAlign: TextAlign.center,
                        text:
                            'Scavenge Hunt needs your location to show nearby hunts and verify tasks'
                                .split(' ')
                                .map(
                                  (word) =>
                                      word[0].toUpperCase() + word.substring(1),
                                )
                                .join(' '),
                        size: 13,
                        weight: FontWeight.w400,
                        paddingBottom: 34,
                      ),
                      MyButton(
                        buttonText: 'Allow',
                        onTap: () => Get.to(() => Login()),
                      ),
                      MyText(
                        onTap: () => Get.to(() => Login()),

                        text: 'Don\'t Allow',
                        size: 14,
                        fontFamily: AppFonts.Fredoka,
                        weight: FontWeight.w500,
                        textAlign: TextAlign.center,
                        paddingTop: 20,
                      ),
                    ],
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
