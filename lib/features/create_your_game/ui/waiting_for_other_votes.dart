import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:scavenge_hunt/core/constants/app_colors.dart';
import 'package:scavenge_hunt/core/constants/app_constants.dart';
import 'package:scavenge_hunt/core/constants/app_fonts.dart';
import 'package:scavenge_hunt/core/constants/app_images.dart';
import 'package:scavenge_hunt/core/constants/app_sizes.dart';
import 'package:scavenge_hunt/core/constants/app_styling.dart';
import 'package:scavenge_hunt/features/leaderboard/ui/leaderboard.dart';
import 'package:scavenge_hunt/core/widgets/common_image_view_widget.dart';
import 'package:scavenge_hunt/core/widgets/custom_container_widget.dart';
import 'package:scavenge_hunt/core/widgets/my_text_widget.dart';

class WaitingForOtherVotes extends StatelessWidget {
  const WaitingForOtherVotes({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: ListView(
          shrinkWrap: true,
          padding: AppSizes.DEFAULT,
          physics: BouncingScrollPhysics(),
          children: [
            SizedBox(height: 39),
            Center(
              child: Stack(
                children: [
                  // Border effect
                  Text(
                    'Waiting for Other Votes...',
                    style: TextStyle(
                      fontSize: 24,
                      fontFamily: AppFonts.Fredoka,
                      fontWeight: FontWeight.w600,
                      foreground: Paint()
                        ..style = PaintingStyle.stroke
                        ..strokeWidth = 9
                        ..color = Color(0xff28AE60), // Border color
                    ),
                  ),
                  // Fill effect
                  Text(
                    'Waiting for Other Votes...',
                    style: TextStyle(
                      fontSize: 24,
                      fontFamily: AppFonts.Fredoka,
                      fontWeight: FontWeight.w600,
                      color: kPrimaryColor,
                    ),
                  ),
                ],
              ),
            ),
            MyText(
              paddingTop: 12,
              color: kPrimaryColor,
              textAlign: TextAlign.center,
              text: 'You’ve voted. Waiting for other\njudges voting.',
              size: 16,
              lineHeight: 1.5,
              paddingBottom: 12,
            ),
            Center(
              child: Container(
                width: 202,
                height: 35,
                decoration: AppStyling.SIMPLE_GLOSSY,
                child: Center(
                  child: MyText(
                    text: '3 of 6 votes received',
                    size: 16,
                    lineHeight: 1.0,
                    fontFamily: AppFonts.Fredoka,
                    weight: FontWeight.w500,
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            GridView.builder(
              padding: AppSizes.ZERO,
              physics: BouncingScrollPhysics(),
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
                mainAxisExtent: 130,
              ),
              itemCount: 6,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  padding: EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: kCyanColor.withValues(alpha: 0.3),
                    border: Border.all(
                      width: 1.0,
                      color: kPrimaryColor.withValues(alpha: 0.6),
                    ),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Column(
                    children: [
                      Center(
                        child: Stack(
                          clipBehavior: Clip.none,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                border: GradientBoxBorder(
                                  gradient: LinearGradient(
                                    stops: [0.0, 0.5, 1.0],
                                    colors: [
                                      Color(0xff28AE60),
                                      Color(0xFFFFFF00),
                                      Color(0xFFFFFFFF),
                                    ],
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                  ),
                                  width: 2.0,
                                ),
                                borderRadius: BorderRadius.circular(100),
                              ),
                              child: CommonImageView(
                                url: dummyImg,
                                height: 56,
                                width: 56,
                                radius: 100,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Positioned(
                              bottom: -16,
                              left: 0,
                              right: 0,
                              child: Center(
                                child: Container(
                                  height: 25,
                                  width: 60,
                                  decoration: BoxDecoration(
                                    color: kPrimaryColor,
                                    borderRadius: BorderRadius.circular(50),
                                  ),
                                  child: Center(
                                    child: MyText(
                                      text: 'John',
                                      size: 13,
                                      lineHeight: 1.08,
                                      color: kCyanColor,
                                      fontFamily: AppFonts.Fredoka,
                                      weight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ),
                            ),

                            Positioned(
                              top: 0,
                              right: -18,
                              child: Image.asset(Assets.imagesMore, height: 20),
                            ),
                          ],
                        ),
                      ),
                      Spacer(),
                      MyText(
                        text: index == 5 ? 'Pending...' : 'Voted',
                        size: 16,
                        color: index == 5 ? kPrimaryColor : kTertiaryColor,
                        textAlign: TextAlign.center,
                        fontFamily: AppFonts.Fredoka,
                        weight: FontWeight.w500,
                      ),
                    ],
                  ),
                );
              },
            ),
            SizedBox(height: 20),
            Center(
              child: CircularPercentIndicator(
                radius: 28.0,
                lineWidth: 4.5,
                percent: 1.0,
                animationDuration: 5000,
                linearGradient: LinearGradient(
                  colors: [kPrimaryColor, Color(0xff2BFF84)],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                ),
                backgroundColor: kPrimaryColor,
                circularStrokeCap: CircularStrokeCap.round,
                animation: true,
                onAnimationEnd: () {
                  Get.to(() => Leaderboard());
                },
              ),
            ),
            MyText(
              color: kPrimaryColor,
              textAlign: TextAlign.center,
              text: 'Result will appear automatically.',
              size: 16,
            ),
          ],
        ),
      ),
    );
  }
}
