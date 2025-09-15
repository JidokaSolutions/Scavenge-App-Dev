import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:scavenge_hunt/constants/app_colors.dart';
import 'package:scavenge_hunt/constants/app_fonts.dart';
import 'package:scavenge_hunt/constants/app_sizes.dart';
import 'package:scavenge_hunt/main.dart';
import 'package:scavenge_hunt/view/widget/blur_container_widget.dart';
import 'package:scavenge_hunt/view/widget/common_image_view_widget.dart';
import 'package:scavenge_hunt/view/widget/custom_app_bar_widget.dart';
import 'package:scavenge_hunt/view/widget/custom_container_widget.dart';
import 'package:scavenge_hunt/view/widget/my_text_widget.dart';

class Leaderboard extends StatelessWidget {
  const Leaderboard({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: simpleAppBar(title: 'Leaderboard'),
        body: ListView(
          shrinkWrap: true,
          padding: AppSizes.DEFAULT,
          physics: BouncingScrollPhysics(),
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              spacing: 20,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    SizedBox(height: 20),
                    Container(
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withValues(alpha: .20),
                            blurRadius: 12,
                            offset: Offset(0, 4),
                          ),
                        ],
                        shape: BoxShape.circle,
                        border: Border.all(width: 3.0, color: kPrimaryColor),
                      ),
                      child: CommonImageView(
                        height: 60,
                        width: 60,
                        radius: 100.0,
                        url: dummyImg,
                        fit: BoxFit.cover,
                      ),
                    ),
                    MyText(
                      paddingTop: 10,
                      text: 'Dwight\'s',
                      size: 14,
                      weight: FontWeight.w700,
                      fontFamily: AppFonts.Fredoka,
                      color: kPrimaryColor,
                    ),
                    MyText(
                      paddingTop: 4,
                      text: '120 votes',
                      size: 12,
                      color: kPrimaryColor,
                      paddingBottom: 12,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(8),
                        ),
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          stops: [0.0, 1.0],
                          colors: [Color(0xFFFB923C), Color(0xffEA580C)],
                        ),
                      ),
                      height: 80,
                      width: 80,
                      child: Center(
                        child: Text(
                          '2',
                          style: TextStyle(
                            fontSize: 23,
                            fontFamily: AppFonts.Fredoka,
                            fontWeight: FontWeight.w700,
                            color: kPrimaryColor,
                            shadows: [
                              Shadow(
                                offset: Offset(0, 2),
                                blurRadius: 4,
                                color: Colors.black.withValues(alpha: .3),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),

                Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withValues(alpha: .20),
                            blurRadius: 12,
                            offset: Offset(0, 4),
                          ),
                        ],
                        shape: BoxShape.circle,
                        border: Border.all(width: 3.0, color: kPrimaryColor),
                      ),
                      child: CommonImageView(
                        height: 60,
                        width: 60,
                        radius: 100.0,
                        url: dummyImg,
                        fit: BoxFit.cover,
                      ),
                    ),
                    MyText(
                      paddingTop: 10,
                      text: 'Potatos',
                      size: 14,
                      weight: FontWeight.w700,
                      fontFamily: AppFonts.Fredoka,
                      color: kPrimaryColor,
                    ),
                    MyText(
                      paddingTop: 4,
                      text: '140 votes',
                      size: 12,
                      color: kPrimaryColor,
                      paddingBottom: 12,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(8),
                        ),
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          stops: [0.0, 1.0],
                          colors: [Color(0xFFFBBF24), Color(0xffF59E0B)],
                        ),
                      ),
                      height: 100,
                      width: 80,
                      child: Center(
                        child: Text(
                          '1',
                          style: TextStyle(
                            fontSize: 23,
                            fontFamily: AppFonts.Fredoka,
                            fontWeight: FontWeight.w700,
                            color: kPrimaryColor,
                            shadows: [
                              Shadow(
                                offset: Offset(0, 2),
                                blurRadius: 4,
                                color: Colors.black.withValues(alpha: .3),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),

                Column(
                  children: [
                    SizedBox(height: 40),
                    Container(
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withValues(alpha: .20),
                            blurRadius: 12,
                            offset: Offset(0, 4),
                          ),
                        ],
                        shape: BoxShape.circle,
                        border: Border.all(width: 3.0, color: kPrimaryColor),
                      ),
                      child: CommonImageView(
                        height: 60,
                        width: 60,
                        radius: 100.0,
                        url: dummyImg,
                        fit: BoxFit.cover,
                      ),
                    ),
                    MyText(
                      paddingTop: 10,
                      text: 'Dwight\'s',
                      size: 14,
                      weight: FontWeight.w700,
                      fontFamily: AppFonts.Fredoka,
                      color: kPrimaryColor,
                    ),
                    MyText(
                      paddingTop: 4,
                      text: '120 votes',
                      size: 12,
                      color: kPrimaryColor,
                      paddingBottom: 12,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(8),
                        ),
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          stops: [0.0, 1.0],
                          colors: [Color(0xFFFBBF24), Color(0xffD97706)],
                        ),
                      ),
                      height: 60,
                      width: 80,
                      child: Center(
                        child: Text(
                          '3',
                          style: TextStyle(
                            fontSize: 23,
                            fontFamily: AppFonts.Fredoka,
                            fontWeight: FontWeight.w700,
                            color: kPrimaryColor,
                            shadows: [
                              Shadow(
                                offset: Offset(0, 2),
                                blurRadius: 4,
                                color: Colors.black.withValues(alpha: .3),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),

            SizedBox(height: 40),
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
                  child: ListView.separated(
                    itemCount: 10,
                    shrinkWrap: true,
                    padding: AppSizes.ZERO,
                    physics: BouncingScrollPhysics(),

                    itemBuilder: (context, index) {
                      return BlurredContainer(
                        radius: 12,
                        child: Padding(
                          padding: const EdgeInsets.all(12),
                          child: Row(
                            children: [
                              MyText(
                                text: '${index + 1}',
                                size: 16,
                                fontFamily: AppFonts.Fredoka,
                                weight: FontWeight.w500,
                                paddingRight: 12,
                              ),
                              CommonImageView(
                                height: 40,
                                width: 40,
                                radius: 100.0,
                                url: dummyImg,
                                fit: BoxFit.cover,
                              ),
                              Expanded(
                                child: MyText(
                                  text: 'Potatos',
                                  size: 16,
                                  fontFamily: AppFonts.Fredoka,
                                  weight: FontWeight.w500,
                                  paddingLeft: 12,
                                ),
                              ),
                              Container(
                                width: 66,
                                height: 22,
                                decoration: BoxDecoration(
                                  color: kPrimaryColor.withValues(alpha: 0.6),
                                  borderRadius: BorderRadius.circular(50),
                                  border: Border.all(
                                    width: 1.0,
                                    color: kPrimaryColor,
                                  ),
                                ),
                                alignment: Alignment.center,
                                child: MyText(
                                  text: '12 votes',
                                  size: 12,
                                  fontFamily: AppFonts.Fredoka,
                                  weight: FontWeight.w500,
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                    separatorBuilder: (context, index) {
                      return SizedBox(height: 8);
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
