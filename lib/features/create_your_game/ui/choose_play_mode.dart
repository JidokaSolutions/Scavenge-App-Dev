import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gradient_borders/gradient_borders.dart';
import 'package:scavenge_hunt/constants/app_colors.dart';
import 'package:scavenge_hunt/constants/app_fonts.dart';
import 'package:scavenge_hunt/constants/app_images.dart';
import 'package:scavenge_hunt/constants/app_sizes.dart';
import 'package:scavenge_hunt/utils/getx_controller_instances.dart';
import 'package:scavenge_hunt/view/screens/create_your_game/create_game_controller/create_game_controller.dart';
import 'package:scavenge_hunt/view/widget/blur_container_widget.dart';
import 'package:scavenge_hunt/view/widget/my_button_widget.dart';
import 'package:scavenge_hunt/view/widget/my_text_widget.dart';

class ChoosePlayMode extends StatefulWidget {
  const ChoosePlayMode({super.key});

  @override
  State<ChoosePlayMode> createState() => _ChoosePlayModeState();
}

class _ChoosePlayModeState extends State<ChoosePlayMode> {
  int currentIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          child: ListView(
            shrinkWrap: true,
            padding: AppSizes.DEFAULT,
            physics: BouncingScrollPhysics(),
            children: [
              MyText(
                text: 'Choose Play Mode',
                size: 16,
                weight: FontWeight.w500,
                fontFamily: AppFonts.Fredoka,
                paddingBottom: 12,
              ),
              Row(
                children: [
                  Expanded(
                    child: userTypeButton(
                      onTap: () => setCurrentIndex(0),
                      icon: Assets.imagesAlone,
                      title: "Alone",
                      index: 0,
                      subtitle: 'Play Solo',
                    ),
                  ),
                  SizedBox(width: 16),
                  Expanded(
                    child: userTypeButton(
                      onTap: () => setCurrentIndex(1),
                      icon: Assets.imagesWithFriends,
                      title: "With Friends",
                      index: 1,
                      subtitle: 'Create or Join Team',
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        Padding(
          padding: AppSizes.DEFAULT,
          child: MyButton(
            textSize: 16,
            buttonText: 'Next',
            onTap: () {
              if (createGameController.selectedPlayMode.value ==
                  PlayMode.solo) {
                Get.dialog(
                  _StartAlone(
                    onStartGame: () {
                      createGameController.nextStep();
                    },
                  ),
                );
              } else
                createGameController.nextStep();
            },
            isDisabled: currentIndex == -1,
          ),
        ),
      ],
    );
  }

  void setCurrentIndex(int index) {
    setState(() {
      currentIndex = index;
      createGameController.selectPlayMode(
        currentIndex == 0 ? PlayMode.solo : PlayMode.withFriends,
      );
    });
  }

  Widget userTypeButton({
    required VoidCallback onTap,
    required String icon,
    required String title,
    required String subtitle,
    required int index,
    double? iconSize,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
          child: Container(
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              border: currentIndex == index
                  ? GradientBoxBorder(
                      gradient: LinearGradient(
                        stops: [0.0, 0.5, 1.0],
                        colors: [
                          Color(0xFFFFFFFF),
                          Color(0xFFFFFF00),
                          Color(0xff2BFF84),
                        ],
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                      ),
                    )
                  : Border.all(width: 1.0, color: kPrimaryColor),
              color: currentIndex == index
                  ? kGreenColor
                  : kPrimaryColor.withValues(alpha: 0.6),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(icon, height: iconSize ?? 70),
                MyText(
                  text: title,
                  size: 17,
                  weight: FontWeight.w500,
                  fontFamily: AppFonts.Fredoka,
                  color: currentIndex == index ? kPrimaryColor : kTertiaryColor,
                  paddingTop: 6,
                ),
                MyText(
                  size: 12,
                  text: subtitle,
                  color: currentIndex == index ? kPrimaryColor : kTertiaryColor,
                  paddingTop: 8,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _StartAlone extends StatelessWidget {
  final VoidCallback onStartGame;

  const _StartAlone({super.key, required this.onStartGame});
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Material(
          color: Colors.transparent,
          child: Padding(
            padding: AppSizes.DEFAULT,
            child: BlurredContainer(
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(height: 20, width: 20),
                        Image.asset(Assets.imagesLogo, height: 64),
                        GestureDetector(
                          onTap: () {
                            Get.back();
                          },
                          child: Image.asset(
                            Assets.imagesClose,
                            height: 20,
                            width: 20,
                          ),
                        ),
                      ],
                    ),
                    MyText(
                      text: 'Solo Adventure Begins!',
                      size: 18,
                      fontFamily: AppFonts.Fredoka,
                      textAlign: TextAlign.center,
                      weight: FontWeight.w500,
                      paddingTop: 20,
                      paddingBottom: 10,
                    ),
                    MyText(
                      text: 'You’re hunting alone good luck!',
                      size: 13,
                      textAlign: TextAlign.center,
                      weight: FontWeight.w500,
                      lineHeight: 1.5,
                      paddingBottom: 24,
                    ),

                    MyButton(
                      buttonText: 'Start Game',
                      onTap: () {
                        Get.back();
                        onStartGame();
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
