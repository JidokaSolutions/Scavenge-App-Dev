import 'package:flutter/material.dart';
import 'package:scavenge_hunt/core/routes/app_navigation.dart';
import 'package:scavenge_hunt/core/constants/app_colors.dart';
import 'package:scavenge_hunt/core/constants/app_fonts.dart';
import 'package:scavenge_hunt/core/constants/app_images.dart';
import 'package:scavenge_hunt/core/constants/app_sizes.dart';
import 'package:scavenge_hunt/features/create_your_game/ui/with_friends/upload_evidence.dart';
import 'package:scavenge_hunt/core/widgets/blur_container_widget.dart';
import 'package:scavenge_hunt/core/widgets/custom_app_bar_widget.dart';
import 'package:scavenge_hunt/core/widgets/custom_container_widget.dart';
import 'package:scavenge_hunt/core/widgets/my_button_widget.dart';
import 'package:scavenge_hunt/core/widgets/my_text_widget.dart';

class GameTaskDetails extends StatelessWidget {
  const GameTaskDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: simpleAppBar(title: 'Task 2 of 10'),
        body: ListView(
          shrinkWrap: true,
          padding: AppSizes.DEFAULT,
          physics: BouncingScrollPhysics(),
          children: [
            MyText(
              text: 'Famous Boston Location',
              size: 22,
              fontFamily: AppFonts.Fredoka,
              textAlign: TextAlign.center,
              weight: FontWeight.w500,
              paddingBottom: 10,
            ),
            MyText(
              text: 'Picture on a bridge with water in the\nbackground',
              size: 14,
              weight: FontWeight.w600,
              textAlign: TextAlign.center,
              paddingBottom: 24,
            ),
            Center(
              child: Container(
                width: 115,
                height: 30,
                decoration: BoxDecoration(
                  color: kGreenColor,
                  borderRadius: BorderRadius.circular(50),
                ),
                child: Center(
                  child: MyText(
                    text: 'Photo-Based',
                    size: 14,
                    color: kPrimaryColor,
                    fontFamily: AppFonts.Fredoka,
                  ),
                ),
              ),
            ),
            MyText(
              paddingTop: 24,
              text: 'Task Description',
              size: 14,
              fontFamily: AppFonts.Fredoka,
              weight: FontWeight.w500,
              paddingBottom: 12,
            ),
            BlurredContainer(
              radius: 12,
              child: Padding(
                padding: EdgeInsets.all(12.0),
                child: MyText(
                  text:
                      'Take a picture next to a famous Boston landmark that represents the city\'s revolutionary history. Look for a location where historic events took place and patriots gathered.',
                  size: 12,
                  lineHeight: 1.5,
                  color: kTertiaryColor,
                ),
              ),
            ),
            SizedBox(height: 12),
            BlurredContainer(
              radius: 12,
              child: Padding(
                padding: EdgeInsets.all(12.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset(Assets.imagesWarning, height: 20),
                    Expanded(
                      child: MyText(
                        paddingLeft: 12,
                        text:
                            'You need to be near the target area to complete this task.',
                        size: 12,
                        lineHeight: 1.5,
                        color: kTertiaryColor,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        bottomNavigationBar: Padding(
          padding: AppSizes.DEFAULT,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              MyButton(
                buttonText: '',
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (context) => _LocationRestricted(),
                  );
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(Assets.imagesTakePhoto, height: 16),
                    MyText(
                      text: 'Take Photo',
                      size: 16,
                      fontFamily: AppFonts.Fredoka,
                      weight: FontWeight.w500,
                      paddingLeft: 8,
                      paddingRight: 8,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16),
              MyBorderButton(
                buttonText: '',
                onTap: () {
                  // TODO: Add UploadEvidence route to GoRouter
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(Assets.imagesUploadFromGallery, height: 18),
                    MyText(
                      text: 'Upload from gallery',
                      size: 16,
                      fontFamily: AppFonts.Fredoka,
                      weight: FontWeight.w500,
                      paddingLeft: 8,
                      paddingRight: 8,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _LocationRestricted extends StatelessWidget {
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
                        Image.asset(
                          Assets.imagesLocationRestricted,
                          height: 116,
                        ),
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
                      text: 'Location Restricted',
                      size: 24,
                      fontFamily: AppFonts.Fredoka,
                      textAlign: TextAlign.center,
                      weight: FontWeight.w600,
                      paddingTop: 20,
                      paddingBottom: 10,
                    ),

                    MyText(
                      text:
                          'This scavenger hunt task is location restricted. You must be in the correct area to perform this task.',
                      size: 13,
                      textAlign: TextAlign.center,
                      weight: FontWeight.w500,
                      lineHeight: 1.5,
                      paddingBottom: 30,
                    ),
                    MyButton(buttonText: 'View Map', onTap: () {}),
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
