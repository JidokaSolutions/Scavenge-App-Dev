import 'package:flutter/material.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:scavenge_hunt/core/constants/app_colors.dart';
import 'package:scavenge_hunt/core/constants/app_constants.dart';
import 'package:scavenge_hunt/core/constants/app_fonts.dart';
import 'package:scavenge_hunt/core/constants/app_images.dart';
import 'package:scavenge_hunt/core/constants/app_sizes.dart';
import 'package:scavenge_hunt/core/constants/app_styling.dart';
import 'package:scavenge_hunt/core/routes/app_navigation.dart';
import 'package:scavenge_hunt/core/widgets/blur_container_widget.dart';
import 'package:scavenge_hunt/core/widgets/common_image_view_widget.dart';
import 'package:scavenge_hunt/core/widgets/custom_container_widget.dart';
import 'package:scavenge_hunt/core/widgets/my_button_widget.dart';
import 'package:scavenge_hunt/core/widgets/my_text_widget.dart';

class WaitingForPlayers extends StatelessWidget {
  const WaitingForPlayers({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: ListView(
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
                          'Waiting for players...',
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
                          'Waiting for players...',
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
                    text: 'Your hunt will begin shortly once all players have joined or the host starts the game.',
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
                          text: '#3 of 6 Players Joined',
                          size: 12,
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
                                  if (index == 0)
                                    Positioned(
                                      top: -2,
                                      left: -10,
                                      child: Container(
                                        height: 20,
                                        width: 40,
                                        decoration: BoxDecoration(
                                          gradient: LinearGradient(
                                            stops: [0.0, 1.0],
                                            colors: [
                                              Color(0xFFFFFFFF),
                                              Color(0xff2BFF84),
                                            ],
                                            begin: Alignment.centerLeft,
                                            end: Alignment.centerRight,
                                          ),
                                          borderRadius: BorderRadius.circular(
                                            100,
                                          ),
                                          border: Border.all(
                                            width: 1.0,
                                            color: kPrimaryColor,
                                          ),
                                        ),
                                        child: Center(
                                          child: MyText(
                                            text: 'Host',
                                            size: 12,
                                            fontFamily: AppFonts.Fredoka,
                                            weight: FontWeight.w500,
                                          ),
                                        ),
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
                                          borderRadius: BorderRadius.circular(
                                            50,
                                          ),
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
                                    child: Image.asset(
                                      Assets.imagesMore,
                                      height: 20,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Spacer(),
                            MyText(
                              text: index == 5 ? 'Waiting...' : 'Joined',
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
                  SizedBox(height: 12),
                  Row(
                    spacing: 12,
                    children: [
                      Expanded(
                        child: MyBorderButton(
                          height: 40,
                          buttonText: '',
                          haveShadow: false,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            spacing: 8,
                            children: [
                              Image.asset(Assets.imagesInvite, height: 20),
                              MyText(
                                text: 'Invite Friend',
                                size: 14,
                                weight: FontWeight.w500,
                                fontFamily: AppFonts.Fredoka,
                              ),
                            ],
                          ),
                          onTap: () {},
                        ),
                      ),
                      Expanded(
                        child: MyBorderButton(
                          haveShadow: false,
                          height: 40,
                          buttonText: '',
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            spacing: 8,
                            children: [
                              Image.asset(Assets.imagesChat, height: 20),
                              MyText(
                                text: 'Chat',
                                size: 14,
                                weight: FontWeight.w500,
                                fontFamily: AppFonts.Fredoka,
                              ),
                            ],
                          ),
                          onTap: () {
                            AppNavigation.pushToChatWithFriends(context);
                          },
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 12),
                  Container(
                    padding: EdgeInsets.all(12),
                    decoration: AppStyling.GLOSSY_CARD.copyWith(
                      borderRadius: BorderRadius.circular(16),
                      color: kPrimaryColor.withValues(alpha: 0.5),
                    ),
                    child: Row(
                      children: [
                        CommonImageView(
                          height: 80,
                          width: 80,
                          url: dummyImg,
                          radius: 8,
                          fit: BoxFit.cover,
                        ),
                        SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              MyText(
                                text: 'Downtown Sprint',
                                size: 16,
                                weight: FontWeight.w600,
                                fontFamily: AppFonts.Fredoka,
                                paddingBottom: 12,
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  MyText(
                                    text: 'Game ID: ',
                                    size: 12,
                                    color: kTertiaryColor.withValues(
                                      alpha: 0.8,
                                    ),
                                    fontFamily: AppFonts.Fredoka,
                                  ),
                                  Expanded(
                                    child: MyText(
                                      text: '#A23X0',
                                      size: 12,
                                      fontFamily: AppFonts.Fredoka,
                                      weight: FontWeight.w500,
                                      paddingRight: 6,
                                      color: kTertiaryColor.withValues(
                                        alpha: 0.8,
                                      ),
                                    ),
                                  ),
                                  Image.asset(Assets.imagesCopy, height: 16),
                                ],
                              ),
                              MyText(
                                paddingTop: 4,
                                text: 'Local Hunt\nToday 5:00 PM - 10 Tasks - 45 min\nPlayable anywhere',
                                size: 12,
                                lineHeight: 2.0,
                                color: kTertiaryColor.withValues(alpha: 0.8),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: AppSizes.DEFAULT,
              child: Row(
                spacing: 12,
                children: [
                  Expanded(
                    flex: 4,
                    child: MyBorderButton(
                      buttonText: 'Leave Hunt',
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (context) => _LeaveHunt(),
                        );
                      },
                      textColor: kRedColor,
                    ),
                  ),
                  Expanded(
                    flex: 6,
                    child: MyButton(
                      buttonText: 'Start Game',
                      onTap: () {
                        AppNavigation.pushToWithFriends(context);
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _LeaveHunt extends StatelessWidget {
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
                    Image.asset(Assets.imagesLeaveHunt, height: 60),
                    MyText(
                      text: 'Leave Hunt?',
                      size: 18,
                      fontFamily: AppFonts.Fredoka,
                      textAlign: TextAlign.center,
                      weight: FontWeight.w500,
                      paddingTop: 20,
                      paddingBottom: 10,
                    ),
                    MyText(
                      text: 'You won’t be able to rejoin this session unless invited again',
                      size: 12,
                      fontFamily: AppFonts.Fredoka,
                      textAlign: TextAlign.center,
                      weight: FontWeight.w500,
                      lineHeight: 1.5,
                      paddingBottom: 24,
                    ),
                    MyButton(
                      buttonText: 'Stay in Hunt',
                      onTap: () {
                        AppNavigation.pop(context);
                      },
                      textSize: 16,
                    ),
                    SizedBox(height: 16),
                    MyBorderButton(
                      textColor: kRedColor,
                      buttonText: 'Leave Hunt',
                      onTap: () {
                        AppNavigation.pop(context);
                        AppNavigation.pop(context);
                      },
                      textSize: 16,
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
