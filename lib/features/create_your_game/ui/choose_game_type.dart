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
import 'package:scavenge_hunt/view/screens/create_your_game/solo/solo_time_base_hunt.dart';
import 'package:scavenge_hunt/view/widget/my_button_widget.dart';
import 'package:scavenge_hunt/view/widget/my_text_widget.dart';

class ChooseGameType extends StatefulWidget {
  const ChooseGameType({super.key});

  @override
  State<ChooseGameType> createState() => _ChooseGameTypeState();
}

class _ChooseGameTypeState extends State<ChooseGameType> {
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
                text: 'Choose Game Type',
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
                      icon: Assets.imagesTimeBase,
                      title: "Time Base",
                      index: 0,
                    ),
                  ),
                  SizedBox(width: 16),
                  Expanded(
                    child: userTypeButton(
                      onTap: () => setCurrentIndex(1),
                      icon: Assets.imagesJudging,
                      title: "Judging",
                      index: 1,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16),
              userTypeButton(
                isRow: true,
                onTap: () => setCurrentIndex(2),
                icon: Assets.imagesCombination,
                title: "Combination",
                index: 2,
              ),
            ],
          ),
        ),
        Padding(
          padding: AppSizes.DEFAULT,
          child: MyButton(
            buttonText: 'Next',
            onTap: () {
              if (createGameController.selectedPlayMode.value ==
                  PlayMode.solo) {
                Get.to(() => SoloTimeBaseHunt());
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
      switch (index) {
        case 0:
          createGameController.selectGameType(GameType.timeBase);
          break;
        case 1:
          createGameController.selectGameType(GameType.judging);
          break;
        case 2:
          createGameController.selectGameType(GameType.combination);
          break;
      }
    });
  }

  Widget userTypeButton({
    required VoidCallback onTap,
    required String icon,
    required String title,
    required int index,
    bool? isRow = false,
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
            child: isRow!
                ? Row(
                    children: [
                      Image.asset(icon, height: iconSize ?? 70),
                      Expanded(
                        child: MyText(
                          paddingLeft: 14,
                          text: title,
                          size: 17,
                          weight: FontWeight.w500,
                          fontFamily: AppFonts.Fredoka,
                          color: currentIndex == index
                              ? kPrimaryColor
                              : kTertiaryColor,
                          paddingTop: 6,
                        ),
                      ),
                    ],
                  )
                : Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(icon, height: iconSize ?? 70),
                      MyText(
                        text: title,
                        size: 17,
                        weight: FontWeight.w500,
                        fontFamily: AppFonts.Fredoka,
                        color: currentIndex == index
                            ? kPrimaryColor
                            : kTertiaryColor,
                        paddingTop: 6,
                      ),
                    ],
                  ),
          ),
        ),
      ),
    );
  }
}
