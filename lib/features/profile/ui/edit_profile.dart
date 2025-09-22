import 'package:flutter/material.dart';
import 'package:scavenge_hunt/core/constants/app_colors.dart';
import 'package:scavenge_hunt/core/constants/app_constants.dart';
import 'package:scavenge_hunt/core/constants/app_images.dart';
import 'package:scavenge_hunt/core/constants/app_sizes.dart';
import 'package:scavenge_hunt/core/widgets/common_image_view_widget.dart';
import 'package:scavenge_hunt/core/widgets/custom_app_bar_widget.dart';
import 'package:scavenge_hunt/core/widgets/custom_container_widget.dart';
import 'package:scavenge_hunt/core/widgets/my_button_widget.dart';
import 'package:scavenge_hunt/core/widgets/my_text_field_widget.dart';
import 'package:scavenge_hunt/core/widgets/my_text_widget.dart';

class EditProfile extends StatelessWidget {
  const EditProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: simpleAppBar(title: 'Edit Profile'),
        body: ListView(
          shrinkWrap: true,
          padding: AppSizes.DEFAULT,
          physics: BouncingScrollPhysics(),
          children: [
            Center(
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  Container(
                    height: 82,
                    width: 82,
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
                        height: 76,
                        width: 76,
                        radius: 100,
                        fit: BoxFit.cover,
                        url: dummyImg,
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Image.asset(
                      Assets.imagesEditProfileImage,
                      height: 24,
                      width: 24,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 25),
            MyTextField(
              hintText: 'Lois',
              fillColor: kPrimaryColor.withValues(alpha: 0.6),
            ),
            MyTextField(
              hintText: 'Becket',
              fillColor: kPrimaryColor.withValues(alpha: 0.6),
            ),
            MyTextField(
              hintText: 'Loisbecket@gmail.com',
              fillColor: kPrimaryColor.withValues(alpha: 0.6),
            ),
            MyText(
              text: 'Only visible to you',
              size: 12,
              color: kTertiaryColor.withValues(alpha: 0.7),
              paddingBottom: 8,
            ),
            PhoneField(fillColor: kPrimaryColor.withValues(alpha: 0.6)),
            MyText(
              text: 'Only visible to you',
              size: 12,
              color: kTertiaryColor.withValues(alpha: 0.7),
              paddingBottom: 8,
            ),
            MyTextField(
              hintText: '18/03/2024',
              fillColor: kPrimaryColor.withValues(alpha: 0.6),
              suffix: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [Image.asset(Assets.imagesCalendar, height: 18)],
              ),
            ),
            MyTextField(
              hintText: '*******',
              isObSecure: true,
              fillColor: kPrimaryColor.withValues(alpha: 0.6),
              suffix: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [Image.asset(Assets.imagesVisibility, height: 20)],
              ),
            ),
          ],
        ),
        bottomNavigationBar: Padding(
          padding: AppSizes.DEFAULT,
          child: MyButton(buttonText: 'Save', onTap: () {}),
        ),
      ),
    );
  }
}
