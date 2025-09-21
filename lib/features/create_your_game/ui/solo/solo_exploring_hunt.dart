import 'package:flutter/material.dart';
import 'package:scavenge_hunt/core/routes/app_navigation.dart';
import 'package:scavenge_hunt/core/constants/app_colors.dart';
import 'package:scavenge_hunt/core/constants/app_constants.dart';
import 'package:scavenge_hunt/core/constants/app_fonts.dart';
import 'package:scavenge_hunt/core/constants/app_images.dart';
import 'package:scavenge_hunt/core/constants/app_sizes.dart';
import 'package:scavenge_hunt/features/create_your_game/ui/solo/solo_racing_hunt_details.dart';
import 'package:scavenge_hunt/core/widgets/common_image_view_widget.dart';
import 'package:scavenge_hunt/core/widgets/custom_app_bar_widget.dart';
import 'package:scavenge_hunt/core/widgets/custom_container_widget.dart';
import 'package:scavenge_hunt/core/widgets/my_text_widget.dart';

class SoloExploringHunt extends StatelessWidget {
  const SoloExploringHunt({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: simpleAppBar(title: 'Available Races'),
        body: ListView.separated(
          shrinkWrap: true,
          padding: AppSizes.DEFAULT,
          physics: BouncingScrollPhysics(),
          itemCount: 10,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                AppNavigation.pushToSoloRacingHuntDetails(context);
              },
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                decoration: BoxDecoration(
                  color: kPrimaryColor.withValues(alpha: 0.6),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  spacing: 12,
                  children: [
                    CommonImageView(
                      height: 48,
                      width: 48,
                      radius: 8,
                      url: dummyImg,
                      fit: BoxFit.cover,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          MyText(
                            text: 'Downtown Sprint',
                            size: 16,
                            weight: FontWeight.w500,
                            fontFamily: AppFonts.Fredoka,
                            paddingBottom: 6,
                          ),
                          MyText(
                            text: 'April 8, 2024',
                            size: 14,
                            color: kTertiaryColor.withValues(alpha: 0.8),
                            fontFamily: AppFonts.Fredoka,
                          ),
                        ],
                      ),
                    ),
                    Image.asset(Assets.imagesArrowNextIos, height: 20),
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
    );
  }
}
