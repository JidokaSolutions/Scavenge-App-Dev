import 'package:flutter/material.dart';
import 'package:scavenge_hunt/core/constants/app_fonts.dart';
import 'package:scavenge_hunt/core/constants/app_images.dart';
import 'package:scavenge_hunt/core/constants/app_sizes.dart';
import 'package:scavenge_hunt/core/constants/app_styling.dart';
import 'package:scavenge_hunt/core/routes/app_navigation.dart';
import 'package:scavenge_hunt/core/widgets/my_button_widget.dart';
import 'package:scavenge_hunt/core/widgets/my_text_widget.dart';

class GetStarted extends StatelessWidget {
  const GetStarted({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(top: 55),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(Assets.imagesSplashBg),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.asset(Assets.imagesGetStarted),
            Container(
              margin: AppSizes.DEFAULT,
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 40),
              decoration: AppStyling.GLOSSY_CARD,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  MyText(
                    text: 'Welcome to Scavenge',
                    size: 26,
                    textAlign: TextAlign.center,
                    weight: FontWeight.w600,
                    fontFamily: AppFonts.Fredoka,
                    paddingBottom: 12,
                  ),
                  MyText(
                    textAlign: TextAlign.center,
                    text: 'Your City. Your Hunt. Your Adventure',
                    size: 13,
                    weight: FontWeight.w700,
                    paddingBottom: 34,
                  ),
                  MyButton(
                    onTap: () => AppNavigation.goToLocationPermission(context),
                    buttonText: '',
                    child: Row(
                      spacing: 16,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        MyText(
                          text: 'Let’s Scavenge',
                          size: 14,
                          fontFamily: AppFonts.Fredoka,
                          weight: FontWeight.w500,
                        ),
                        Image.asset(Assets.imagesArrowNext, height: 20),
                      ],
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
