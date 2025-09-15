import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/utils.dart';
import 'package:scavenge_hunt/constants/app_colors.dart';
import 'package:scavenge_hunt/constants/app_fonts.dart';
import 'package:scavenge_hunt/constants/app_images.dart';
import 'package:scavenge_hunt/constants/app_sizes.dart';
import 'package:scavenge_hunt/constants/app_styling.dart';
import 'package:scavenge_hunt/main.dart';
import 'package:scavenge_hunt/view/screens/create_your_game/waiting_for_players.dart';
import 'package:scavenge/view/widget/common_image_view_widget.dart';
import 'package:scavenge/view/widget/my_button_widget.dart';
import 'package:scavenge/view/widget/my_text_field_widget.dart';
import 'package:scavenge/view/widget/my_text_widget.dart';

class InviteFriends extends StatelessWidget {
  const InviteFriends({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          child: ListView(
            shrinkWrap: true,
            padding: AppSizes.DEFAULT,
            physics: BouncingScrollPhysics(),
            children: [
              Row(
                children: [
                  Expanded(
                    child: MyText(
                      text: 'Invite Friends',
                      size: 16,
                      weight: FontWeight.w500,
                      fontFamily: AppFonts.Fredoka,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 12.5,
                      vertical: 7.5,
                    ),
                    decoration: AppStyling.SIMPLE_GLOSSY,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        MyText(
                          text: 'Game ID: ',
                          size: 12,
                          fontFamily: AppFonts.Fredoka,
                        ),
                        MyText(
                          text: '#A23X0',
                          size: 12,
                          fontFamily: AppFonts.Fredoka,
                          weight: FontWeight.w500,
                          paddingRight: 6,
                        ),
                        Image.asset(Assets.imagesCopy, height: 16),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 24),
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
                    hintText: 'Search by name',
                    hintStyle: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: kTertiaryColor.withValues(alpha: 0.7),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 24),
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
                                  Image.asset(Assets.imagesOnline, height: 12),
                                  Expanded(
                                    child: MyText(
                                      paddingLeft: 6,
                                      text: ' Online',
                                      size: 12,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Container(
                          height: 30,
                          width: 80,
                          decoration: BoxDecoration(
                            color: kSecondaryColor,
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: Center(
                            child: MyText(
                              text: 'Invite',
                              size: 14,
                              weight: FontWeight.w500,
                              fontFamily: AppFonts.Fredoka,
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
        Padding(
          padding: AppSizes.DEFAULT,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              MyText(
                text: 'Invite By Email Or Phone',
                size: 14,
                weight: FontWeight.w500,
                fontFamily: AppFonts.Fredoka,
                paddingBottom: 10,
              ),
              Row(
                spacing: 8,
                children: [
                  Expanded(
                    child: MyTextField(
                      hintText: 'Enter phone or email',
                      marginBottom: 0,
                    ),
                  ),
                  Container(
                    height: 48,
                    width: 120,
                    decoration: BoxDecoration(
                      color: kSecondaryColor,
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: Center(
                      child: MyText(
                        text: 'Send invite',
                        size: 14,
                        weight: FontWeight.w500,
                        fontFamily: AppFonts.Fredoka,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 24),
              MyButton(
                textSize: 16,
                buttonText: 'Next',
                onTap: () {
                  Get.to(() => WaitingForPlayers());
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
