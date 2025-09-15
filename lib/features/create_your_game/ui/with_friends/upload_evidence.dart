import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:scavenge_hunt/constants/app_colors.dart';
import 'package:scavenge_hunt/constants/app_fonts.dart';
import 'package:scavenge_hunt/constants/app_images.dart';
import 'package:scavenge_hunt/constants/app_sizes.dart';
import 'package:scavenge_hunt/constants/app_styling.dart';
import 'package:scavenge_hunt/main.dart';
import 'package:scavenge_hunt/view/screens/create_your_game/with_friends/check_evidence_accuracy.dart';
import 'package:scavenge_hunt/view/widget/blur_container_widget.dart';
import 'package:scavenge_hunt/view/widget/common_image_view_widget.dart';
import 'package:scavenge_hunt/view/widget/custom_app_bar_widget.dart';
import 'package:scavenge_hunt/view/widget/custom_container_widget.dart';
import 'package:scavenge_hunt/view/widget/my_button_widget.dart';
import 'package:scavenge_hunt/view/widget/my_text_widget.dart';

class UploadEvidence extends StatelessWidget {
  const UploadEvidence({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: simpleAppBar(title: 'Take Evidence'),
        body: ListView(
          shrinkWrap: true,
          padding: AppSizes.DEFAULT,
          physics: BouncingScrollPhysics(),
          children: [
            Container(
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: kPrimaryColor.withValues(alpha: 0.6),
                borderRadius: BorderRadius.circular(12),
              ),
              child: MyText(
                text: 'Take a picture of street entertainer.',
                size: 13,
                weight: FontWeight.w600,
              ),
            ),
            SizedBox(height: 20),
            Stack(
              children: [
                CommonImageView(
                  height: 300,
                  width: Get.width,
                  radius: 16,
                  url: dummyImg,
                  fit: BoxFit.cover,
                ),
                Positioned(
                  top: 24,
                  right: 24,
                  child: Image.asset(Assets.imagesCamera, height: 32),
                ),
              ],
            ),
            SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: MyText(
                    text: 'Additional Evidence',
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
                  decoration: AppStyling.SIMPLE_GLOSSY.copyWith(
                    border: Border.all(color: kPrimaryColor, width: 1.0),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      MyText(
                        text: '3/5 added',
                        size: 12,
                        fontFamily: AppFonts.Fredoka,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            GridView.builder(
              shrinkWrap: true,
              padding: AppSizes.ZERO,
              physics: BouncingScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                mainAxisExtent: 75,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              itemCount: 4,
              itemBuilder: (BuildContext context, int index) {
                if (index == 3)
                  return Container(
                    height: Get.height,
                    width: Get.width,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: kPrimaryColor, width: 1.5),
                    ),
                    child: Column(
                      spacing: 4,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.add, color: kPrimaryColor),
                        MyText(
                          text: 'Add more',
                          size: 13,
                          color: kPrimaryColor,
                          fontFamily: AppFonts.Fredoka,
                          weight: FontWeight.w500,
                        ),
                      ],
                    ),
                  );
                else
                  return Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: index == 0
                              ? GradientBoxBorder(
                                  gradient: LinearGradient(
                                    stops: [0.0, 0.5, 1.0],
                                    colors: [
                                      Color(0xFFFFFFFF),
                                      Color(0xFFFFFF00),
                                      Color(0xff2BFF84),
                                    ],
                                    begin: Alignment.centerLeft,
                                    end: Alignment.centerRight,
                                  ),
                                )
                              : Border.all(width: 1.5, color: kPrimaryColor),
                        ),
                        child: CommonImageView(
                          height: Get.height,
                          width: Get.width,
                          radius: 10,
                          fit: BoxFit.cover,
                          url: dummyImg,
                        ),
                      ),
                      Positioned(
                        top: -4,
                        right: -4,
                        child: Image.asset(
                          Assets.imagesDeleteImage,
                          height: 20,
                        ),
                      ),
                    ],
                  );
              },
            ),
          ],
        ),
        bottomNavigationBar: Padding(
          padding: AppSizes.DEFAULT,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: [
              MyButton(
                buttonText: 'Check Accuracy',
                onTap: () {
                  Get.to(() => CheckEvidenceAccuracy());
                },
              ),
              MyText(
                paddingTop: 12,
                text: 'Make sure your images clearly show the required task',
                size: 12,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
