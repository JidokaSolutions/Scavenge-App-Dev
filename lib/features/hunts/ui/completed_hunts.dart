import 'package:flutter/material.dart';
import 'package:scavenge_hunt/core/routes/app_navigation.dart';
import 'package:scavenge_hunt/core/constants/app_colors.dart';
import 'package:scavenge_hunt/core/constants/app_constants.dart';
import 'package:scavenge_hunt/core/constants/app_fonts.dart';
import 'package:scavenge_hunt/core/constants/app_images.dart';
import 'package:scavenge_hunt/core/constants/app_sizes.dart';
import 'package:scavenge_hunt/features/hunts/ui/completed_hunt_details.dart';
import 'package:scavenge_hunt/core/widgets/common_image_view_widget.dart';
import 'package:scavenge_hunt/core/widgets/custom_app_bar_widget.dart';
import 'package:scavenge_hunt/core/widgets/custom_container_widget.dart';
import 'package:scavenge_hunt/core/widgets/my_text_widget.dart';

class CompletedHunts extends StatelessWidget {
  const CompletedHunts({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: simpleAppBar(title: 'Completed Hunts'),
        body: ListView.separated(
          shrinkWrap: true,
          padding: AppSizes.DEFAULT,
          physics: BouncingScrollPhysics(),
          itemCount: 10,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                AppNavigation.pushToCompletedHuntDetails(context, 'dummy-hunt-id');
              },
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                decoration: BoxDecoration(
                  image: index == 0
                      ? DecorationImage(
                          image: AssetImage(Assets.imagesFirstPlaceBg),
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
                    Image.asset(
                      index == 0 ? Assets.imagesMedal : Assets.imagesCup,
                      height: 45,
                    ),
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
                          Row(
                            children: [
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
                              if (index == 0)
                                MyText(
                                  text: '+350 XP',
                                  size: 12,
                                  paddingLeft: 30,
                                  color: kTertiaryColor.withValues(alpha: 0.8),
                                  weight: FontWeight.w700,
                                ),
                            ],
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
