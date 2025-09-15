import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scavenge_hunt/core/constants/app_colors.dart';
import 'package:scavenge_hunt/core/constants/app_fonts.dart';
import 'package:scavenge_hunt/core/constants/app_images.dart';
import 'package:scavenge_hunt/core/constants/app_sizes.dart';
import 'package:scavenge_hunt/core/constants/app_styling.dart';
import 'package:scavenge_hunt/features/create_your_game/ui/solo/solo_game_checklist.dart';
import 'package:scavenge_hunt/features/create_your_game/ui/solo/solo_hunt_details.dart';
import 'package:scavenge_hunt/core/widgets/blur_container_widget.dart';
import 'package:scavenge_hunt/core/widgets/custom_app_bar_widget.dart';
import 'package:scavenge_hunt/core/widgets/custom_container_widget.dart';
import 'package:scavenge_hunt/core/widgets/my_button_widget.dart';
import 'package:scavenge_hunt/core/widgets/my_text_widget.dart';

class SoloTimeBaseHunt extends StatelessWidget {
  const SoloTimeBaseHunt({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: simpleAppBar(title: 'Available Solo Hunt'),
        body: ListView(
          shrinkWrap: true,
          padding: AppSizes.DEFAULT,
          physics: BouncingScrollPhysics(),
          children: [
            Container(
              decoration: AppStyling.GLOSSY_CARD.copyWith(
                borderRadius: BorderRadius.circular(50),
              ),
              child: TextField(
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: kTertiaryColor,
                ),
                textAlignVertical: TextAlignVertical.center,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(horizontal: 15),
                  prefixIcon: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [Image.asset(Assets.imagesSearch, height: 20)],
                  ),
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                  hintText: 'Search Hunts by name or location',
                  hintStyle: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: kTertiaryColor.withValues(alpha: 0.7),
                  ),
                ),
              ),
            ),
            SizedBox(height: 24),
            MyText(
              text: '3 Hunts Available',
              size: 16,
              weight: FontWeight.w500,
              fontFamily: AppFonts.Fredoka,
              paddingBottom: 12,
            ),
            ListView.separated(
              itemCount: 10,
              shrinkWrap: true,
              padding: AppSizes.ZERO,
              physics: BouncingScrollPhysics(),
              separatorBuilder: (context, index) => SizedBox(height: 12),
              itemBuilder: (context, index) {
                return BlurredContainer(
                  radius: 16,
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        MyText(
                          text: 'Downtown Photography Hunt',
                          size: 16,
                          fontFamily: AppFonts.Fredoka,
                          weight: FontWeight.w500,
                          paddingBottom: 12,
                        ),
                        Row(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                color: kPrimaryColor.withValues(alpha: 0.6),
                                borderRadius: BorderRadius.circular(50),
                              ),
                              padding: EdgeInsets.symmetric(
                                horizontal: 10,
                                vertical: 4,
                              ),
                              child: Row(
                                children: [
                                  Image.asset(
                                    Assets.imagesLocation,
                                    height: 14,
                                  ),
                                  MyText(
                                    paddingLeft: 2,
                                    paddingRight: 4,
                                    text: 'Downtown',
                                    size: 12,
                                    fontFamily: AppFonts.Fredoka,
                                    color: kTertiaryColor,
                                    weight: FontWeight.w500,
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(width: 8),
                            Container(
                              decoration: BoxDecoration(
                                color: kPrimaryColor.withValues(alpha: 0.6),
                                borderRadius: BorderRadius.circular(50),
                              ),
                              padding: EdgeInsets.symmetric(
                                horizontal: 10,
                                vertical: 4,
                              ),
                              child: Row(
                                children: [
                                  Image.asset(Assets.imagesClock, height: 14),
                                  MyText(
                                    paddingLeft: 4,
                                    paddingRight: 4,
                                    text: '45 min',
                                    size: 12,
                                    fontFamily: AppFonts.Fredoka,
                                    color: kTertiaryColor,
                                    weight: FontWeight.w500,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        MyText(
                          paddingTop: 8,
                          text:
                              'Capture the essence of downtown through creative photography challenges. Find hidden murals, architectural details, and local culture.',
                          size: 14,
                          color: kTertiaryColor.withValues(alpha: 0.8),
                        ),
                        SizedBox(height: 12),
                        Row(
                          children: [
                            Expanded(
                              child: MyBorderButton(
                                height: 30,
                                textSize: 14,
                                weight: FontWeight.w500,
                                buttonText: 'View Detail',
                                onTap: () {
                                  Get.to(() => SoloHuntDetails());
                                },
                              ),
                            ),
                            SizedBox(width: 12),
                            Expanded(
                              child: MyButton(
                                height: 30,
                                textSize: 14,
                                weight: FontWeight.w500,
                                buttonText: 'Join Hunt',
                                onTap: () {
                                  Get.dialog(_JoinHunt());
                                },
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class _JoinHunt extends StatelessWidget {
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
                    MyText(
                      text: 'Confirm Join?',
                      size: 22,
                      fontFamily: AppFonts.Fredoka,
                      textAlign: TextAlign.center,
                      weight: FontWeight.w500,
                      paddingBottom: 24,
                    ),
                    Row(
                      children: [
                        Image.asset(Assets.imagesTreasure, height: 32),
                        Expanded(
                          child: MyText(
                            paddingLeft: 12,
                            fontFamily: AppFonts.Fredoka,
                            text: 'Downtown Photography Hunt',
                            size: 16,
                            weight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 16),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      spacing: 12,
                      children: List.generate(3, (index) {
                        final details = [
                          {'label': 'Race Type', 'value': 'Local Hunt'},
                          {'label': 'Start Time', 'value': 'Today, 5:30 PM'},
                          {'label': 'Duration', 'value': '45 minutes'},
                        ];
                        String label = details[index]['label']!;
                        String value = details[index]['value']!;
                        return Row(
                          children: [
                            Expanded(
                              flex: 4,
                              child: MyText(
                                text: label,
                                size: 14,
                                weight: FontWeight.w700,
                              ),
                            ),
                            Expanded(
                              flex: 6,
                              child: MyText(
                                text: value,
                                size: 14,
                                weight: FontWeight.w500,
                              ),
                            ),
                          ],
                        );
                      }),
                    ),

                    SizedBox(height: 24),
                    MyButton(
                      buttonText: 'Confirm & Join',
                      onTap: () {
                        Get.back();
                        Get.to(() => SoloGameCheckList());
                      },
                    ),
                    SizedBox(height: 16),
                    MyBorderButton(
                      buttonText: 'Cancel',
                      onTap: () {
                        Get.back();
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
