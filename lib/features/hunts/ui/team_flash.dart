import 'package:flutter/material.dart';
import 'package:scavenge_hunt/core/constants/app_colors.dart';
import 'package:scavenge_hunt/core/constants/app_constants.dart';
import 'package:scavenge_hunt/core/constants/app_fonts.dart';
import 'package:scavenge_hunt/core/constants/app_images.dart';
import 'package:scavenge_hunt/core/constants/app_sizes.dart';
import 'package:scavenge_hunt/core/constants/app_styling.dart';
import 'package:scavenge_hunt/core/routes/app_navigation.dart';
import 'package:scavenge_hunt/core/widgets/common_image_view_widget.dart';
import 'package:scavenge_hunt/core/widgets/custom_app_bar_widget.dart';
import 'package:scavenge_hunt/core/widgets/custom_container_widget.dart';
import 'package:scavenge_hunt/core/widgets/my_text_widget.dart';

class TeamFlash extends StatelessWidget {
  const TeamFlash({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: simpleAppBar(title: 'Team Flash'),
        body: ListView(
          shrinkWrap: true,
          padding: AppSizes.DEFAULT,
          physics: BouncingScrollPhysics(),
          children: [
            Container(
              decoration: AppStyling.GLOSSY_CARD.copyWith(
                borderRadius: BorderRadius.circular(50),
              ),
              child: TextField(
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: kTertiaryColor,
                ),
                textAlignVertical: TextAlignVertical.center,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(horizontal: 15),
                  prefixIcon: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [Image.asset(Assets.imagesSearch, height: 20)],
                  ),
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                  hintText: 'Search by Name',
                  hintStyle: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: kTertiaryColor.withValues(alpha: 0.7),
                  ),
                ),
              ),
            ),
            SizedBox(height: 24),
            MyText(
              text: 'Team Members',
              size: 16,
              weight: FontWeight.w500,
              fontFamily: AppFonts.Fredoka,
              paddingBottom: 12,
            ),
            ListView.separated(
              shrinkWrap: true,
              padding: AppSizes.ZERO,
              physics: BouncingScrollPhysics(),
              itemCount: 10,
              itemBuilder: (context, index) {
                return Container(
                  padding: EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: kPrimaryColor.withValues(alpha: 0.6),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Row(
                    children: [
                      CommonImageView(
                        height: 48,
                        width: 48,
                        radius: 100,
                        url: dummyImg,
                        fit: BoxFit.cover,
                      ),
                      SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            MyText(
                              text: 'John Cena',
                              size: 16,
                              weight: FontWeight.w500,
                              fontFamily: AppFonts.Fredoka,
                              paddingBottom: 10,
                            ),
                            Row(
                              children: [
                                Image.asset(
                                  Assets.imagesOnline,
                                  height: 12,
                                  color: index % 3 == 0
                                      ? kGreenColor
                                      : index % 3 == 1
                                          ? kSecondaryColor
                                          : kTertiaryColor.withValues(alpha: .5),
                                ),
                                Expanded(
                                  child: MyText(
                                    paddingLeft: 6,
                                    text: index % 3 == 0
                                        ? 'Online'
                                        : index % 3 == 1
                                            ? 'In Hunt'
                                            : 'Offline',
                                    size: 12,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          AppNavigation.pushToPlayerProfile(context, 'dummy-player-id');
                        },
                        child: Container(
                          height: 30,
                          width: 95,
                          decoration: BoxDecoration(
                            color: kSecondaryColor,
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: Center(
                            child: MyText(
                              text: 'View Profile',
                              size: 12,
                              weight: FontWeight.w500,
                              fontFamily: AppFonts.Fredoka,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return SizedBox(height: 12);
              },
            ),
          ],
        ),
      ),
    );
  }
}
