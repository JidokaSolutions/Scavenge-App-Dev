import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scavenge_hunt/constants/app_colors.dart';
import 'package:scavenge_hunt/constants/app_fonts.dart';
import 'package:scavenge_hunt/constants/app_images.dart';
import 'package:scavenge_hunt/constants/app_sizes.dart';
import 'package:scavenge_hunt/view/widget/blur_container_widget.dart';
import 'package:scavenge_hunt/view/widget/custom_app_bar_widget.dart';
import 'package:scavenge_hunt/view/widget/custom_container_widget.dart';
import 'package:scavenge_hunt/view/widget/my_button_widget.dart';
import 'package:scavenge_hunt/view/widget/my_text_field_widget.dart';
import 'package:scavenge_hunt/view/widget/my_text_widget.dart';

class JoinGame extends StatelessWidget {
  const JoinGame({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: simpleAppBar(title: 'Join Game'),
        body: ListView(
          shrinkWrap: true,
          padding: AppSizes.DEFAULT,
          physics: BouncingScrollPhysics(),
          children: [
            Center(child: Image.asset(Assets.imagesJoinGame, height: 200)),
            SizedBox(height: 24),
            BlurredContainer(
              radius: 16,
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    MyText(
                      text: 'Join With Code',
                      size: 16,
                      weight: FontWeight.w500,
                      fontFamily: AppFonts.Fredoka,
                      paddingBottom: 12,
                    ),
                    MyTextField(hintText: 'Enter Game ID', marginBottom: 24),
                    MyButton(
                      buttonText: 'Join',
                      onTap: () {
                        Get.dialog(_JoinHunt());
                      },
                    ),
                  ],
                ),
              ),
            ),
            MyText(
              paddingTop: 24,
              text: 'Invitation',
              size: 16,
              weight: FontWeight.w500,
              fontFamily: AppFonts.Fredoka,
              paddingBottom: 12,
            ),
            ListView.separated(
              separatorBuilder: (context, index) => SizedBox(height: 12),
              itemCount: 2,
              shrinkWrap: true,
              padding: AppSizes.ZERO,
              physics: BouncingScrollPhysics(),
              itemBuilder: (BuildContext context, int index) {
                return BlurredContainer(
                  radius: 16,
                  child: Padding(
                    padding: EdgeInsets.all(12),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(Assets.imagesFunAnywhere, height: 56),
                        SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              MyText(
                                text: 'Park Challenge',
                                size: 16,
                                weight: FontWeight.w500,
                                fontFamily: AppFonts.Fredoka,
                                color: kTertiaryColor,
                                paddingBottom: 6,
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    child: MyText(
                                      size: 12,
                                      lineHeight: 1.5,
                                      text: 'Host: Jonathan\nToday 5:00 PM',
                                      color: kTertiaryColor.withValues(
                                        alpha: 0.8,
                                      ),
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      Get.dialog(_JoinHunt());
                                    },
                                    child: Container(
                                      width: 83,
                                      height: 30,
                                      decoration: BoxDecoration(
                                        color: kSecondaryColor,
                                        borderRadius: BorderRadius.circular(50),
                                      ),
                                      alignment: Alignment.center,
                                      child: MyText(
                                        text: 'Join',
                                        size: 12,
                                        fontFamily: AppFonts.Fredoka,
                                        weight: FontWeight.w500,
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
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
