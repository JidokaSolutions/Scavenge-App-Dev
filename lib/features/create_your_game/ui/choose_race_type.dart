import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gradient_borders/gradient_borders.dart';
import 'package:scavenge_hunt/core/constants/app_colors.dart';
import 'package:scavenge_hunt/core/constants/app_fonts.dart';
import 'package:scavenge_hunt/core/constants/app_images.dart';
import 'package:scavenge_hunt/core/constants/app_sizes.dart';
import 'package:scavenge_hunt/core/constants/getx_controller_instances.dart';
import 'package:scavenge_hunt/features/create_your_game/ui/create_game_controller/create_game_controller.dart';
import 'package:scavenge_hunt/features/create_your_game/ui/solo/solo_exploring_hunt.dart';
import 'package:scavenge_hunt/core/widgets/my_button_widget.dart';
import 'package:scavenge_hunt/core/widgets/my_text_widget.dart';

class ChooseRaceType extends StatefulWidget {
  const ChooseRaceType({super.key});

  @override
  State<ChooseRaceType> createState() => _ChooseRaceTypeState();
}

class _ChooseRaceTypeState extends State<ChooseRaceType> {
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
                text: 'Choose Race Type',
                size: 16,
                weight: FontWeight.w500,
                fontFamily: AppFonts.Fredoka,
                paddingBottom: 12,
              ),
              userTypeButton(
                iconSize: 64,
                onTap: () => setCurrentIndex(0),
                icon: Assets.imagesExploring,
                title: "Exploring the Area",
                index: 0,
                subtitle:
                    'Specific to area\nEat in the Northend\nPicture in Northend',
              ),
              SizedBox(height: 16),
              userTypeButton(
                iconSize: 64,
                onTap: () => setCurrentIndex(1),
                icon: Assets.imagesFunAnywhere,
                title: "With Friends",
                index: 1,
                subtitle: 'Geo-coding',
              ),
              SizedBox(height: 16),
              userTypeButton(
                iconSize: 64,
                onTap: () => setCurrentIndex(2),
                icon: Assets.imagesEventMeeting,
                title: "Event / Meeting",
                index: 2,
                subtitle: 'These are Invite only to JOIN',
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
                      PlayMode.solo &&
                  currentIndex == 0)
                Get.to(() => SoloExploringHunt());
              else
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
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(icon, height: iconSize ?? 70),
                SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
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
                      MyText(
                        size: 12,
                        text: subtitle,
                        color: currentIndex == index
                            ? kPrimaryColor
                            : kTertiaryColor,
                        paddingTop: 8,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
