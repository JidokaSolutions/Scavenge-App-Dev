import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:scavenge_hunt/core/routes/app_navigation.dart';
import 'package:scavenge_hunt/core/constants/app_colors.dart';
import 'package:scavenge_hunt/core/constants/app_constants.dart';
import 'package:scavenge_hunt/core/constants/app_fonts.dart';
import 'package:scavenge_hunt/core/constants/app_images.dart';
import 'package:scavenge_hunt/core/constants/app_sizes.dart';
import 'package:scavenge_hunt/features/create_your_game/ui/solo/solo_game_checklist.dart';
import 'package:scavenge_hunt/core/widgets/common_image_view_widget.dart';
import 'package:scavenge_hunt/core/widgets/custom_app_bar_widget.dart';
import 'package:scavenge_hunt/core/widgets/custom_container_widget.dart';
import 'package:scavenge_hunt/core/widgets/my_button_widget.dart';
import 'package:scavenge_hunt/core/widgets/my_text_widget.dart';

class SoloRacingHuntDetails extends StatelessWidget {
  const SoloRacingHuntDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: simpleAppBar(title: 'Available Races'),
        body: ListView(
          shrinkWrap: true,
          padding: AppSizes.DEFAULT,
          physics: BouncingScrollPhysics(),
          children: [
            CommonImageView(
              height: 300,
              radius: 24,
              url: dummyImg,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 24),
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
                              text: 'Completed Task',
                              size: 16,
                              weight: FontWeight.w500,
                              fontFamily: AppFonts.Fredoka,
                            ),
                          ),
                          MyText(
                            text: 'March 25, 2024',
                            size: 12,
                            color: kTertiaryColor.withValues(alpha: 0.6),
                            fontFamily: AppFonts.Fredoka,
                          ),
                        ],
                      ),
                      MyText(
                        paddingTop: 16,
                        text:
                            'Take a picture next to a famous Boston landmark that represents the city\'s revolutionary history. Look for a location where historic events took place and patriots gathered.',
                        size: 13,
                        lineHeight: 1.5,
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
          child: MyButton(
            buttonText: 'Start Hunt',
            onTap: () {
              AppNavigation.pushToSoloGameCheckList(context);
            },
          ),
        ),
      ),
    );
  }
}
