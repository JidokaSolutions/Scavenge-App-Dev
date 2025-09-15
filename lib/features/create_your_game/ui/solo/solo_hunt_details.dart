import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:scavenge_hunt/constants/app_colors.dart';
import 'package:scavenge_hunt/constants/app_fonts.dart';
import 'package:scavenge_hunt/constants/app_sizes.dart';
import 'package:scavenge_hunt/view/widget/custom_app_bar_widget.dart';
import 'package:scavenge_hunt/view/widget/custom_container_widget.dart';
import 'package:scavenge_hunt/view/widget/my_button_widget.dart';
import 'package:scavenge_hunt/view/widget/my_text_widget.dart';

class SoloHuntDetails extends StatelessWidget {
  const SoloHuntDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: simpleAppBar(title: 'Your Game Checklist'),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: ListView(
                shrinkWrap: true,
                padding: AppSizes.DEFAULT,
                physics: BouncingScrollPhysics(),
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
                      child: Container(
                        padding: EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: kPrimaryColor.withValues(alpha: 0.6),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            MyText(
                              text: 'Hunt Name',
                              size: 15,
                              fontFamily: AppFonts.Fredoka,
                              weight: FontWeight.w500,
                              paddingBottom: 8,
                            ),
                            MyText(
                              text: 'Downtown Photography Hunt',
                              size: 13,
                              color: kTertiaryColor.withValues(alpha: 0.8),
                              weight: FontWeight.w600,
                              paddingBottom: 16,
                            ),
                            MyText(
                              text: 'Description',
                              size: 15,
                              fontFamily: AppFonts.Fredoka,
                              weight: FontWeight.w500,
                              paddingBottom: 8,
                            ),

                            MyText(
                              text:
                                  'Capture the essence of downtown through creative photography challenges. Find hidden murals, architectural details, and local culture.',
                              size: 13,
                              color: kTertiaryColor.withValues(alpha: 0.8),
                              weight: FontWeight.w600,
                              paddingBottom: 16,
                            ),
                            MyText(
                              text: 'Hunt Detail',
                              size: 15,
                              fontFamily: AppFonts.Fredoka,
                              weight: FontWeight.w500,
                              paddingBottom: 8,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              spacing: 8,
                              children: List.generate(4, (index) {
                                final details = [
                                  {
                                    'label': 'Location',
                                    'value': 'Downtown area',
                                  },
                                  {'label': 'Play Mode', 'value': 'Time Base'},
                                  {
                                    'label': 'Estimated Time',
                                    'value': '1-2 hours',
                                  },
                                  {
                                    'label': 'Start Time',
                                    'value': 'Now through Sunday',
                                  },
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
                                        weight: FontWeight.w600,
                                      ),
                                    ),
                                    Expanded(
                                      flex: 6,
                                      child: MyText(text: value, size: 14),
                                    ),
                                  ],
                                );
                              }),
                            ),

                            MyText(
                              paddingTop: 16,
                              text: 'Scoring Rules',
                              size: 15,
                              fontFamily: AppFonts.Fredoka,
                              weight: FontWeight.w500,
                              paddingBottom: 8,
                            ),
                            MyText(
                              text:
                                  'Points are awarded based on creativity, accuracy, and timing. Bonus points for discovering optional challenges. All submissions are reviewed for accuracy and quality.',
                              size: 13,
                              color: kTertiaryColor.withValues(alpha: 0.8),
                              weight: FontWeight.w600,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: AppSizes.DEFAULT,
              child: MyButton(buttonText: 'Join This Hunt', onTap: () {}),
            ),
          ],
        ),
      ),
    );
  }
}
