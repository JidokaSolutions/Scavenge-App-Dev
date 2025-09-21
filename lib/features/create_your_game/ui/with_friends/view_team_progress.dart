import 'package:flutter/material.dart';
import 'package:scavenge_hunt/core/routes/app_navigation.dart';
import 'package:scavenge_hunt/core/constants/app_colors.dart';
import 'package:scavenge_hunt/core/constants/app_constants.dart';
import 'package:scavenge_hunt/core/constants/app_fonts.dart';
import 'package:scavenge_hunt/core/constants/app_images.dart';
import 'package:scavenge_hunt/core/constants/app_sizes.dart';
import 'package:scavenge_hunt/app.dart';
import 'package:scavenge_hunt/features/create_your_game/ui/with_friends/team_member_details.dart';
import 'package:scavenge_hunt/core/widgets/common_image_view_widget.dart';
import 'package:scavenge_hunt/core/widgets/custom_app_bar_widget.dart';
import 'package:scavenge_hunt/core/widgets/custom_container_widget.dart';
import 'package:scavenge_hunt/core/widgets/my_text_widget.dart';

class ViewTeamProgress extends StatelessWidget {
  const ViewTeamProgress({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: simpleAppBar(title: 'Team Progress'),
        body: ListView.separated(
          itemCount: 6,
          shrinkWrap: true,
          padding: AppSizes.DEFAULT,
          physics: BouncingScrollPhysics(),
          separatorBuilder: (context, index) => SizedBox(height: 8),
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                AppNavigation.pushToTeamMemberDetails(context);
              },
              child: Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: kPrimaryColor.withValues(alpha: 0.6),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Row(
                  children: [
                    CommonImageView(
                      height: 40,
                      width: 40,
                      radius: 100,
                      url: dummyImg,
                      fit: BoxFit.cover,
                    ),
                    SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          MyText(
                            text: 'John Cena',
                            size: 16,
                            fontFamily: AppFonts.Fredoka,
                            weight: FontWeight.w500,
                            paddingBottom: 4,
                          ),
                          MyText(
                            text: '5 / 10 task Completed',
                            size: 12,
                            color: kTertiaryColor.withValues(alpha: 0.8),
                            weight: FontWeight.w600,
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
        ),
      ),
    );
  }
}
