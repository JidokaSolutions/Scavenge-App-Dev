import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:scavenge_hunt/core/constants/app_colors.dart';
import 'package:scavenge_hunt/core/constants/app_constants.dart';
import 'package:scavenge_hunt/core/constants/app_fonts.dart';
import 'package:scavenge_hunt/core/constants/app_images.dart';
import 'package:scavenge_hunt/core/constants/app_sizes.dart';
import 'package:scavenge_hunt/core/routes/app_navigation.dart';
import 'package:scavenge_hunt/core/widgets/blur_container_widget.dart';
import 'package:scavenge_hunt/core/widgets/common_image_view_widget.dart';
import 'package:scavenge_hunt/core/widgets/custom_app_bar_widget.dart';
import 'package:scavenge_hunt/core/widgets/custom_container_widget.dart';
import 'package:scavenge_hunt/core/widgets/my_button_widget.dart';
import 'package:scavenge_hunt/core/widgets/my_text_widget.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

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
                        child: Stack(
                          clipBehavior: Clip.none,
                          children: [
                            Container(
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
                            Positioned(
                              bottom: 0,
                              right: 0,
                              child: Image.asset(
                                Assets.imagesEditProfileImage,
                                height: 24,
                                width: 24,
                              ),
                            ),
                          ],
                        ),
                      ),
                      MyText(
                        paddingTop: 16,
                        text: 'Jonathan',
                        size: 20,
                        weight: FontWeight.w500,
                        textAlign: TextAlign.center,
                        fontFamily: AppFonts.Fredoka,
                      ),
                      MyText(
                        paddingTop: 6,
                        text: 'Example@info.com',
                        size: 14,
                        color: kTertiaryColor.withValues(alpha: 0.7),
                        textAlign: TextAlign.center,
                        paddingBottom: 16,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: MyButton(
                              haveShadow: false,
                              height: 40,
                              buttonText: '',
                              onTap: () {
                                AppNavigation.pushToEditProfile(context);
                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    Assets.imagesEditPencil,
                                    height: 16,
                                  ),
                                  MyText(
                                    text: 'Edit Profile',
                                    size: 14,
                                    fontFamily: AppFonts.Fredoka,
                                    weight: FontWeight.w500,
                                    paddingLeft: 6,
                                    paddingRight: 6,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(width: 8),
                          Expanded(
                            child: MyBorderButton(
                              height: 40,
                              buttonText: '',
                              onTap: () {},
                              haveShadow: false,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    Assets.imagesShareProfile,
                                    height: 16,
                                  ),
                                  MyText(
                                    text: 'Share Profile',
                                    size: 14,
                                    fontFamily: AppFonts.Fredoka,
                                    weight: FontWeight.w500,
                                    paddingLeft: 6,
                                    paddingRight: 6,
                                  ),
                                ],
                              ),
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
                        text: 'Stats Overview',
                        size: 16,
                        weight: FontWeight.w500,
                        fontFamily: AppFonts.Fredoka,
                        paddingBottom: 20,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: BlurredContainer(
                              radius: 12,
                              child: Padding(
                                padding: const EdgeInsets.all(12),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.stretch,
                                  children: [
                                    Row(
                                      children: [
                                        Image.asset(
                                          Assets.imagesHuntCompleted,
                                          height: 55,
                                        ),
                                      ],
                                    ),
                                    MyText(
                                      paddingTop: 8,
                                      text: 'Hunt Completed',
                                      size: 14,
                                      weight: FontWeight.w600,
                                      paddingBottom: 4,
                                    ),
                                    MyText(
                                      text: '24',
                                      size: 16,
                                      color: kGreenColor,
                                      weight: FontWeight.w500,
                                      fontFamily: AppFonts.Fredoka,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: 12),
                          Expanded(
                            child: BlurredContainer(
                              radius: 12,
                              child: Padding(
                                padding: const EdgeInsets.all(12),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.stretch,
                                  children: [
                                    Row(
                                      children: [
                                        Image.asset(
                                          Assets.imagesAverageFinish,
                                          height: 55,
                                        ),
                                      ],
                                    ),
                                    MyText(
                                      paddingTop: 8,
                                      text: 'Average Finish',
                                      size: 14,
                                      weight: FontWeight.w600,
                                      paddingBottom: 4,
                                    ),
                                    MyText(
                                      text: '3rd',
                                      size: 16,
                                      color: kGreenColor,
                                      weight: FontWeight.w500,
                                      fontFamily: AppFonts.Fredoka,
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
                            child: MyText(
                              text: 'Friends',
                              size: 16,
                              weight: FontWeight.w500,
                              fontFamily: AppFonts.Fredoka,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              AppNavigation.pushToAddFriend(context);
                            },
                            child: Container(
                              height: 30,
                              width: 125,
                              decoration: BoxDecoration(
                                color: kSecondaryColor,
                                borderRadius: BorderRadius.circular(50),
                              ),
                              child: Row(
                                spacing: 8,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    Assets.imagesAddFriends,
                                    height: 14,
                                  ),
                                  MyText(
                                    text: 'Add Friend',
                                    size: 12,
                                    fontFamily: AppFonts.Fredoka,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
                      ListView.separated(
                        shrinkWrap: true,
                        padding: AppSizes.ZERO,
                        physics: BouncingScrollPhysics(),
                        itemCount: 4,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              AppNavigation.pushToPlayerProfile(context, 'defaultPlayerId');
                            },
                            child: Container(
                              padding: EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                color: kPrimaryColor.withValues(alpha: 0.6),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Row(
                                children: [
                                  CommonImageView(
                                    height: 38,
                                    width: 38,
                                    radius: 100,
                                    url: dummyImg,
                                    fit: BoxFit.cover,
                                  ),
                                  SizedBox(width: 12),
                                  Expanded(
                                    child: MyText(
                                      text: 'John Cena',
                                      size: 14,
                                      weight: FontWeight.w500,
                                      fontFamily: AppFonts.Fredoka,
                                    ),
                                  ),
                                  Image.asset(
                                    Assets.imagesArrowNextIos,
                                    height: 20,
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
                              AppNavigation.pushToFriends(context);
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
                        text: 'Completed Hunts',
                        size: 16,
                        weight: FontWeight.w500,
                        fontFamily: AppFonts.Fredoka,
                        paddingBottom: 20,
                      ),
                      ListView.separated(
                        shrinkWrap: true,
                        padding: AppSizes.ZERO,
                        physics: BouncingScrollPhysics(),
                        itemCount: 4,
                        itemBuilder: (context, index) {
                          return Container(
                            padding: EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              image: index == 0
                                  ? DecorationImage(
                                      image: AssetImage(
                                        Assets.imagesFirstPlaceBg,
                                      ),
                                      fit: BoxFit.cover,
                                      colorFilter: ColorFilter.mode(
                                        kPrimaryColor.withValues(alpha: 0.6),
                                        BlendMode.srcATop,
                                      ),
                                    )
                                  : null,
                              color: kPrimaryColor.withValues(alpha: 0.6),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Row(
                              children: [
                                Image.asset(Assets.imagesMedal, height: 48),
                                SizedBox(width: 12),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.stretch,
                                    children: [
                                      MyText(
                                        text: 'John Cena',
                                        size: 14,
                                        weight: FontWeight.w500,
                                        fontFamily: AppFonts.Fredoka,
                                        paddingBottom: 4,
                                      ),
                                      MyText(
                                        text: 'April 8, 2024',
                                        size: 12,
                                        fontFamily: AppFonts.Fredoka,
                                        paddingBottom: 2,
                                      ),
                                      MyText(
                                        text: index == 0
                                            ? '1st Place'
                                            : index == 1
                                                ? '2nd Place'
                                                : index == 2
                                                    ? '3rd Place'
                                                    : '${index + 1}th Place',
                                        size: 12,
                                        color: kGreenColor,
                                        weight: FontWeight.w600,
                                        fontFamily: AppFonts.Fredoka,
                                      ),
                                    ],
                                  ),
                                ),
                                CommonImageView(
                                  height: 48,
                                  width: 48,
                                  radius: 8,
                                  url: dummyImg,
                                  fit: BoxFit.cover,
                                ),
                              ],
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
                              AppNavigation.pushToCompletedHunts(context);
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 25),
            Center(
              child: SizedBox(
                width: 175,
                child: MyBorderButton(
                  haveShadow: false,
                  buttonText: '',
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    spacing: 8,
                    children: [
                      Image.asset(Assets.imagesLogout, height: 20),
                      MyText(
                        text: 'Logout',
                        size: 18,
                        weight: FontWeight.w600,
                        color: kRedColor,
                      ),
                    ],
                  ),
                  onTap: () {},
                ),
              ),
            ),
            SizedBox(height: 25),
          ],
        ),
      ),
    );
  }
}
