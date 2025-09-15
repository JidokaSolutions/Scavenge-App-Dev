import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scavenge_hunt/core/constants/app_colors.dart';
import 'package:scavenge_hunt/core/constants/app_fonts.dart';
import 'package:scavenge_hunt/core/constants/app_images.dart';
import 'package:scavenge_hunt/core/constants/app_sizes.dart';
import 'package:scavenge_hunt/core/widgets/common_image_view_widget.dart';
import 'package:scavenge_hunt/core/widgets/custom_app_bar_widget.dart';
import 'package:scavenge_hunt/core/widgets/custom_container_widget.dart';
import 'package:scavenge_hunt/core/widgets/my_button_widget.dart';
import 'package:scavenge_hunt/core/widgets/my_text_widget.dart';
import 'package:scavenge_hunt/core/constants/app_constants.dart';

class ViewPlayerProfile extends StatelessWidget {
  const ViewPlayerProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: simpleAppBar(title: 'Profile'),
        body: ListView(
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
                      Center(
                        child: Container(
                          height: 82,
                          width: 82,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              stops: [0.0, 0.5, 1.0],
                              colors: [
                                Color(0xFF28AE60),
                                Color(0xFFFFFF00),
                                Color(0xFFFFFFFF),
                              ],
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                            ),
                            shape: BoxShape.circle,
                          ),
                          child: Center(
                            child: CommonImageView(
                              height: 76,
                              width: 76,
                              radius: 100,
                              fit: BoxFit.cover,
                              url: dummyImg,
                            ),
                          ),
                        ),
                      ),
                      MyText(
                        paddingTop: 16,
                        text: 'Alexander jay',
                        size: 20,
                        weight: FontWeight.w500,
                        textAlign: TextAlign.center,
                        fontFamily: AppFonts.Fredoka,
                        paddingBottom: 12,
                      ),

                      Center(
                        child: Container(
                          padding: EdgeInsets.all(4),
                          decoration: BoxDecoration(
                            color: kPrimaryColor,
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: Row(
                            spacing: 6,
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.circle, color: kGreenColor, size: 12),
                              MyText(
                                text: 'Online',
                                size: 12,
                                paddingRight: 6,
                                color: kGreenColor,
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
                      Row(
                        children: [
                          Expanded(
                            child: Column(
                              children: [
                                MyText(
                                  text: 'Hunts Together',
                                  size: 14,
                                  weight: FontWeight.w600,
                                  paddingBottom: 8,
                                ),
                                MyText(
                                  text: '7',
                                  size: 18,
                                  color: kGreenColor,
                                  weight: FontWeight.w500,
                                  fontFamily: AppFonts.Fredoka,
                                ),
                              ],
                            ),
                          ),
                          Container(
                            height: 48,
                            width: 1,
                            color: kTertiaryColor.withValues(alpha: 0.2),
                          ),
                          Expanded(
                            child: Column(
                              children: [
                                MyText(
                                  text: 'Shared Wins',
                                  size: 14,
                                  weight: FontWeight.w600,
                                  paddingBottom: 8,
                                ),
                                Row(
                                  spacing: 4,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Image.asset(
                                      Assets.imagesSharedCup,
                                      height: 20,
                                    ),
                                    MyText(
                                      text: '2',
                                      size: 18,
                                      color: kGreenColor,
                                      weight: FontWeight.w500,
                                      fontFamily: AppFonts.Fredoka,
                                    ),
                                  ],
                                ),
                              ],
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
                        text: 'Favorite Images',
                        size: 16,
                        weight: FontWeight.w500,
                        fontFamily: AppFonts.Fredoka,
                        paddingBottom: 16,
                      ),
                      GridView.builder(
                        shrinkWrap: true,
                        padding: AppSizes.ZERO,
                        physics: BouncingScrollPhysics(),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 4,
                              crossAxisSpacing: 8,
                              mainAxisSpacing: 8,
                              mainAxisExtent: 65,
                            ),
                        itemCount: 8,
                        itemBuilder: (BuildContext context, int index) {
                          return CommonImageView(
                            height: Get.height,
                            width: Get.width,
                            radius: 10,
                            url: dummyImg,
                            fit: BoxFit.cover,
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
        bottomNavigationBar: Padding(
          padding: AppSizes.DEFAULT,
          child: MyButton(buttonText: 'Invite to Hunt', onTap: () {}),
        ),
      ),
    );
  }
}
