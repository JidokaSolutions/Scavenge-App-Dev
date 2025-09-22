import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gradient_borders/gradient_borders.dart';
import 'package:scavenge_hunt/core/constants/app_colors.dart';
import 'package:scavenge_hunt/core/constants/app_fonts.dart';
import 'package:scavenge_hunt/core/constants/app_images.dart';
import 'package:scavenge_hunt/core/constants/app_sizes.dart';
import 'package:scavenge_hunt/features/create_your_game/ui/solo/solo_time_base_hunt.dart';
import 'package:scavenge_hunt/core/widgets/my_button_widget.dart';
import 'package:scavenge_hunt/core/widgets/my_text_widget.dart';
import '../logic/create_game_provider.dart';
import '../logic/create_game_state.dart';

class ChooseGameType extends ConsumerStatefulWidget {
  const ChooseGameType({super.key});

  @override
  ConsumerState<ChooseGameType> createState() => _ChooseGameTypeState();
}

class _ChooseGameTypeState extends ConsumerState<ChooseGameType> {
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
              if (ref.read(selectedPlayModeProvider) == PlayMode.solo) {
                AppNavigation.pushToSoloTimeBaseHunt(context);
              } else {
                ref.read(createGameProvider.notifier).nextStep();
              }
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
          ref.read(createGameProvider.notifier).selectGameType(GameType.timeBase);
          break;
        case 1:
          ref.read(createGameProvider.notifier).selectGameType(GameType.judging);
          break;
        case 2:
          ref.read(createGameProvider.notifier).selectGameType(GameType.combination);
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
