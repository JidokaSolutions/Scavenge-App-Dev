import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scavenge/constants/app_colors.dart';
import 'package:scavenge/constants/app_fonts.dart';
import 'package:scavenge/constants/app_images.dart';
import 'package:scavenge/constants/app_sizes.dart';
import 'package:scavenge/main.dart';
import 'package:scavenge/view/screens/profile/completed_hunts/completed_tasks.dart';
import 'package:scavenge/view/screens/profile/team_flash/team_flash.dart';
import 'package:scavenge/view/widget/blur_container_widget.dart';
import 'package:scavenge/view/widget/common_image_view_widget.dart';
import 'package:scavenge/view/widget/custom_app_bar_widget.dart';
import 'package:scavenge/view/widget/custom_container_widget.dart';
import 'package:scavenge/view/widget/my_button_widget.dart';
import 'package:scavenge/view/widget/my_text_widget.dart';

class CompletedHuntDetails extends StatelessWidget {
  const CompletedHuntDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: simpleAppBar(title: 'Final Result'),
        body: ListView(
          shrinkWrap: true,
          padding: AppSizes.DEFAULT,
          physics: BouncingScrollPhysics(),
          children: [
            Center(
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  Image.asset(Assets.imagesFirstPlace, height: 84),
                  Positioned(
                    bottom: 5,
                    left: 0,
                    right: 0,
                    child: Center(
                      child: MyText(
                        text: 'April 20 . Central Park',
                        size: 14,
                        color: kPrimaryColor,
                        weight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Image.asset(Assets.imagesGoldenCup, height: 112),
            SizedBox(height: 16),
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
                        text: 'Game Overview',
                        size: 16,
                        weight: FontWeight.w500,
                        fontFamily: AppFonts.Fredoka,
                        paddingBottom: 20,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: BlurredContainer(
                              child: Padding(
                                padding: const EdgeInsets.all(12),
                                child: Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: [
                                    Row(
                                      children: [
                                        Image.asset(
                                          Assets.imagesPlayMode,
                                          height: 55,
                                        ),
                                      ],
                                    ),
                                    MyText(
                                      paddingTop: 8,
                                      text: 'Play Mode',
                                      size: 14,
                                      weight: FontWeight.w600,
                                      paddingBottom: 4,
                                    ),
                                    MyText(
                                      text: 'Time Base',
                                      size: 16,
                                      color: kGreenColor,
                                      weight: FontWeight.w500,
                                      fontFamily: AppFonts.Fredoka,
                                    ),
                                  ],
                                ),
                              ),
                              radius: 12,
                            ),
                          ),
                          SizedBox(width: 12),
                          Expanded(
                            child: BlurredContainer(
                              child: Padding(
                                padding: const EdgeInsets.all(12),
                                child: Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: [
                                    Row(
                                      children: [
                                        Image.asset(
                                          Assets.imagesTotalTime,
                                          height: 55,
                                        ),
                                      ],
                                    ),
                                    MyText(
                                      paddingTop: 8,
                                      text: 'Total Time',
                                      size: 14,
                                      weight: FontWeight.w600,
                                      paddingBottom: 4,
                                    ),
                                    MyText(
                                      text: '40min 18 sec',
                                      size: 16,
                                      color: kGreenColor,
                                      weight: FontWeight.w500,
                                      fontFamily: AppFonts.Fredoka,
                                    ),
                                  ],
                                ),
                              ),
                              radius: 12,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),

            SizedBox(height: 16),
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
                        text: 'Team Flash',
                        size: 16,
                        weight: FontWeight.w500,
                        fontFamily: AppFonts.Fredoka,
                        paddingBottom: 20,
                      ),
                      BlurredContainer(
                        radius: 12,
                        child: Container(
                          margin: EdgeInsets.fromLTRB(0, 12, 12, 12),
                          height: 40,
                          child: Row(
                            children: [
                              Expanded(
                                child: ListView.separated(
                                  shrinkWrap: true,
                                  scrollDirection: Axis.horizontal,
                                  padding: EdgeInsets.symmetric(horizontal: 12),
                                  physics: BouncingScrollPhysics(),
                                  itemCount: 5,
                                  itemBuilder: (context, index) {
                                    return CommonImageView(
                                      url: dummyImg,
                                      height: 40,
                                      width: 40,
                                      radius: 100,
                                      fit: BoxFit.cover,
                                    );
                                  },
                                  separatorBuilder: (context, index) {
                                    return SizedBox(width: 4);
                                  },
                                ),
                              ),
                              SizedBox(width: 8),
                              SizedBox(
                                width: 76,
                                child: MyBorderButton(
                                  haveShadow: false,
                                  height: 30,
                                  textSize: 12,
                                  weight: FontWeight.w400,
                                  buttonText: '3 More',
                                  onTap: () {
                                    Get.to(() => TeamFlash());
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            SizedBox(height: 16),
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
                        text: 'Completed Task',
                        size: 16,
                        weight: FontWeight.w500,
                        fontFamily: AppFonts.Fredoka,
                        paddingBottom: 20,
                      ),
                      ListView.separated(
                        shrinkWrap: true,
                        padding: AppSizes.ZERO,
                        physics: BouncingScrollPhysics(),
                        itemCount: 3,
                        itemBuilder: (context, index) {
                          List<String> tasks = [
                            "Picture of plane",
                            "Picture on a bridge with water in the background",
                            "Take a picture with a stranger in a Red Soxs Hat",
                          ];
                          return Container(
                            padding: EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              color: kPrimaryColor.withValues(alpha: 0.6),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: MyText(
                              text: tasks[index],
                              size: 13,
                              weight: FontWeight.w600,
                            ),
                          );
                        },
                        separatorBuilder: (context, index) {
                          return SizedBox(height: 8);
                        },
                      ),
                      SizedBox(height: 20),
                      Center(
                        child: SizedBox(
                          width: 100,
                          child: MyBorderButton(
                            height: 30,
                            textSize: 12,
                            haveShadow: false,
                            buttonText: 'View More',
                            onTap: () {
                              Get.to(() => CompletedTasks());
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 16),
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
                        text: 'Gallery',
                        size: 16,
                        weight: FontWeight.w500,
                        fontFamily: AppFonts.Fredoka,
                        paddingBottom: 20,
                      ),
                      BlurredContainer(
                        radius: 12,
                        child: Container(
                          margin: EdgeInsets.fromLTRB(0, 12, 12, 12),
                          height: 40,
                          child: Row(
                            children: [
                              Expanded(
                                child: ListView.separated(
                                  shrinkWrap: true,
                                  scrollDirection: Axis.horizontal,
                                  padding: EdgeInsets.symmetric(horizontal: 12),
                                  physics: BouncingScrollPhysics(),
                                  itemCount: 5,
                                  itemBuilder: (context, index) {
                                    return CommonImageView(
                                      url: dummyImg,
                                      height: 40,
                                      width: 40,
                                      radius: 6,
                                      fit: BoxFit.cover,
                                    );
                                  },
                                  separatorBuilder: (context, index) {
                                    return SizedBox(width: 4);
                                  },
                                ),
                              ),
                              SizedBox(width: 8),
                              SizedBox(
                                width: 76,
                                child: MyBorderButton(
                                  haveShadow: false,
                                  height: 30,
                                  textSize: 12,
                                  weight: FontWeight.w400,
                                  buttonText: '8 More',
                                  onTap: () {},
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            SizedBox(height: 16),
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
                        text: 'Judging Comment',
                        size: 16,
                        weight: FontWeight.w500,
                        fontFamily: AppFonts.Fredoka,
                        paddingBottom: 20,
                      ),
                      ListView.separated(
                        shrinkWrap: true,
                        padding: AppSizes.ZERO,
                        physics: BouncingScrollPhysics(),
                        itemCount: 1,
                        itemBuilder: (context, index) {
                          List<String> tasks = ["Nice landmark photo!"];
                          return Container(
                            padding: EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              color: kPrimaryColor.withValues(alpha: 0.6),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: MyText(
                              text: tasks[index],
                              size: 13,
                              weight: FontWeight.w600,
                            ),
                          );
                        },
                        separatorBuilder: (context, index) {
                          return SizedBox(height: 8);
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 16),
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
                        text: 'Badges Earned ',
                        size: 16,
                        weight: FontWeight.w500,
                        fontFamily: AppFonts.Fredoka,
                        paddingBottom: 20,
                      ),
                      BlurredContainer(
                        radius: 12,
                        child: SizedBox(
                          height: 120,
                          child: ListView.separated(
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            padding: EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 12,
                            ),
                            physics: BouncingScrollPhysics(),
                            itemCount: 2,
                            itemBuilder: (context, index) {
                              List<Map<String, String>> badges = [
                                {
                                  "image": Assets.imagesFastesRun,
                                  "text": "Fastest Run",
                                },
                                {
                                  "image": Assets.imagesSmartest,
                                  "text": "Smartest\nClue Solver ",
                                },
                              ];
                              return SizedBox(
                                width: 65,
                                child: Column(
                                  spacing: 12,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Center(
                                      child: Image.asset(
                                        badges[index]["image"]!,
                                        height: 50,
                                      ),
                                    ),
                                    MyText(
                                      text: badges[index]["text"]!,
                                      size: 12,
                                      weight: FontWeight.w500,
                                      textAlign: TextAlign.center,
                                    ),
                                  ],
                                ),
                              );
                            },
                            separatorBuilder: (context, index) {
                              return SizedBox(width: 16);
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 30),
            MyBorderButton(buttonText: 'Share Result', onTap: () {}),
            SizedBox(height: 12),
            MyButton(buttonText: 'Replay Game', onTap: () {}),
          ],
        ),
      ),
    );
  }
}
