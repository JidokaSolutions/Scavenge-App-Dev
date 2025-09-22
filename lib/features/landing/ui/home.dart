import 'package:flutter/material.dart';
import 'package:scavenge_hunt/core/constants/app_colors.dart';
import 'package:scavenge_hunt/core/constants/app_constants.dart';
import 'package:scavenge_hunt/core/constants/app_fonts.dart';
import 'package:scavenge_hunt/core/constants/app_images.dart';
import 'package:scavenge_hunt/core/constants/app_sizes.dart';
import 'package:scavenge_hunt/core/routes/app_navigation.dart';
import 'package:scavenge_hunt/core/widgets/blur_container_widget.dart';
import 'package:scavenge_hunt/core/widgets/common_image_view_widget.dart';
import 'package:scavenge_hunt/core/widgets/custom_container_widget.dart';
import 'package:scavenge_hunt/core/widgets/my_button_widget.dart';
import 'package:scavenge_hunt/core/widgets/my_text_widget.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 39),
            Padding(
              padding: AppSizes.DEFAULT,
              child: Row(
                spacing: 8,
                children: [
                  GestureDetector(
                    onTap: () {
                      AppNavigation.goToProfile(context);
                    },
                    child: Container(
                      height: 51,
                      width: 51,
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
                          height: 48,
                          width: 48,
                          radius: 100,
                          fit: BoxFit.cover,
                          url: dummyImg,
                        ),
                      ),
                    ),
                  ),
                  Spacer(),
                  ...List.generate(3, (index) {
                    return Image.asset(
                      [
                        Assets.imagesPlaces,
                        Assets.imagesAddFriend,
                        Assets.imagesNotifications,
                      ][index],
                      height: 40,
                    );
                  }),
                ],
              ),
            ),
            Expanded(
              child: Padding(
                padding: AppSizes.DEFAULT,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    SizedBox.shrink(),
                    Column(
                      children: [
                        Image.asset(Assets.imagesLogo, height: 120),
                        SizedBox(height: 10),
                        Stack(
                          children: [
                            // Border effect
                            Text(
                              'Scavenge',
                              style: TextStyle(
                                fontSize: 58,
                                fontFamily: AppFonts.Fredoka,
                                fontWeight: FontWeight.w500,
                                foreground: Paint()
                                  ..style = PaintingStyle.stroke
                                  ..strokeWidth = 9
                                  ..color = Color(0xff28AE60), // Border color
                              ),
                            ),
                            // Fill effect
                            Text(
                              'Scavenge',
                              style: TextStyle(
                                fontSize: 58,
                                fontFamily: AppFonts.Fredoka,
                                fontWeight: FontWeight.w500,
                                color: kPrimaryColor,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 60),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        bottom: 39,
                        left: 10,
                        right: 10,
                      ),
                      child: MyButton(
                        buttonText: 'Play Now',
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (context) => _ChooseYourAdventure(),
                          );
                        },
                        height: 60,
                        textSize: 24,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ChooseYourAdventure extends StatelessWidget {
  const _ChooseYourAdventure();

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
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(height: 20, width: 20),
                        Image.asset(Assets.imagesLogo, height: 64),
                        GestureDetector(
                          onTap: () {
                            AppNavigation.pop(context);
                          },
                          child: Image.asset(
                            Assets.imagesClose,
                            height: 20,
                            width: 20,
                          ),
                        ),
                      ],
                    ),
                    MyText(
                      text: 'Choose your adventure!',
                      size: 18,
                      fontFamily: AppFonts.Fredoka,
                      textAlign: TextAlign.center,
                      weight: FontWeight.w500,
                      paddingTop: 24,
                      paddingBottom: 24,
                    ),
                    MyButton(
                      buttonText: 'Host Game',
                      onTap: () {
                        AppNavigation.goToCreateGame(context);
                      },
                      textSize: 16,
                    ),
                    SizedBox(height: 16),
                    MyBorderButton(
                      buttonText: 'Join Game',
                      onTap: () {
                        AppNavigation.goToJoinGame(context);
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
