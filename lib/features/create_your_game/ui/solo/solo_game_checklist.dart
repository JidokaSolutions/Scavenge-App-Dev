import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:scavenge_hunt/constants/app_colors.dart';
import 'package:scavenge_hunt/constants/app_fonts.dart';
import 'package:scavenge_hunt/constants/app_images.dart';
import 'package:scavenge_hunt/constants/app_sizes.dart';
import 'package:scavenge_hunt/view/screens/create_your_game/solo/solo_hunt_details.dart';
import 'package:scavenge_hunt/view/screens/create_your_game/with_friends/upload_evidence.dart';
import 'package:scavenge_hunt/view/widget/blur_container_widget.dart';
import 'package:scavenge_hunt/view/widget/custom_app_bar_widget.dart';
import 'package:scavenge_hunt/view/widget/custom_container_widget.dart';
import 'package:scavenge_hunt/view/widget/my_button_widget.dart';
import 'package:scavenge_hunt/view/widget/my_text_widget.dart';

class SoloGameCheckList extends StatefulWidget {
  const SoloGameCheckList({super.key});

  @override
  State<SoloGameCheckList> createState() => _SoloGameCheckListState();
}

class _SoloGameCheckListState extends State<SoloGameCheckList> {
  final List<bool> _taskCompleted = List.generate(10, (_) => false);

  final List<String> _taskDescriptions = [
    "Picture of plane",
    "Picture on a bridge with water in the background",
    "Rectangle a famous Boston movie scene",
    "Take a picture with a stranger in a Red Soxs Hat",
    "Take a picture with a real/fake animal",
    "Take a picture with a real/fake animal",
    "Task 7",
    "Task 8",
    "Task 9",
    "Task 10",
  ];

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: simpleAppBar(title: 'Your Game Checklist'),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            LinearPercentIndicator(
              animateFromLastPercent: true,
              animateToInitialPercent: false,
              restartAnimation: false,
              lineHeight: 22.0,
              percent:
                  _taskCompleted.where((e) => e).length / _taskCompleted.length,
              padding: AppSizes.HORIZONTAL,
              linearGradient: LinearGradient(
                colors: [kPrimaryColor, Color(0xff2BFF84)],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
              ),
              backgroundColor: kPrimaryColor.withValues(alpha: .4),
              barRadius: const Radius.circular(50),
              animation: true,
              center: MyText(
                text:
                    '${_taskCompleted.where((e) => e).length}/${_taskCompleted.length} Task Completed',
                size: 14,
                weight: FontWeight.w500,
                fontFamily: AppFonts.Fredoka,
              ),
              animationDuration: 1200,
            ),
            SizedBox(height: 10),
            Expanded(
              child: ListView(
                shrinkWrap: true,
                padding: AppSizes.DEFAULT,
                physics: BouncingScrollPhysics(),
                children: [
                  MyText(
                    text: 'Task List',
                    size: 16,
                    weight: FontWeight.w500,
                    fontFamily: AppFonts.Fredoka,
                  ),
                  SizedBox(height: 16),
                  ListView.separated(
                    itemCount: _taskDescriptions.length,
                    shrinkWrap: true,
                    padding: AppSizes.ZERO,
                    physics: BouncingScrollPhysics(),
                    separatorBuilder: (context, index) => SizedBox(height: 8),
                    itemBuilder: (context, index) {
                      final isActive = _taskCompleted[index];
                      return BlurredContainer(
                        radius: 12,
                        child: Padding(
                          padding: const EdgeInsets.all(12),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        _taskCompleted[index] =
                                            !_taskCompleted[index];
                                      });
                                    },
                                    child: AnimatedContainer(
                                      duration: Duration(milliseconds: 230),
                                      curve: Curves.easeInOut,
                                      height: 24,
                                      width: 24,
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          width: 1.0,
                                          color: kGreenColor,
                                        ),
                                        color: isActive
                                            ? kGreenColor
                                            : kPrimaryColor.withValues(
                                                alpha: 0.7,
                                              ),
                                        borderRadius: BorderRadius.circular(4),
                                      ),
                                      child: !isActive
                                          ? SizedBox()
                                          : Icon(
                                              Icons.check,
                                              size: 14,
                                              color: kPrimaryColor,
                                            ),
                                    ),
                                  ),
                                  SizedBox(width: 12),
                                  Expanded(
                                    child: MyText(
                                      text: _taskDescriptions[index],
                                      size: 16,
                                      weight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 12),
                              Row(
                                children: [
                                  Expanded(
                                    child: MyBorderButton(
                                      height: 30,
                                      textSize: 14,
                                      weight: FontWeight.w500,
                                      buttonText: 'Task Detail',
                                      onTap: () {
                                        Get.to(() => SoloHuntDetails());
                                      },
                                    ),
                                  ),
                                  SizedBox(width: 12),
                                  Expanded(
                                    child: MyButton(
                                      height: 30,
                                      textSize: 14,
                                      weight: FontWeight.w500,
                                      buttonText: 'Submit Task',
                                      onTap: () {
                                        Get.dialog(_SubmitYourEvidence());
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
            Padding(
              padding: AppSizes.DEFAULT,
              child: MyButton(
                buttonText: 'End Hunt',
                onTap: () {
                  _taskCompleted.contains(true) ? Get.dialog(_EndHunt()) : null;
                },
                isDisabled: !_taskCompleted.contains(true),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _SubmitYourEvidence extends StatelessWidget {
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
                        Image.asset(Assets.imagesLogo, height: 64),
                        GestureDetector(
                          onTap: () {
                            Get.back();
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
                      text: 'Submit your Evidence!',
                      size: 18,
                      fontFamily: AppFonts.Fredoka,
                      textAlign: TextAlign.center,
                      weight: FontWeight.w500,
                      paddingTop: 24,
                      paddingBottom: 24,
                    ),
                    MyButton(
                      buttonText: '',
                      onTap: () {
                        Get.back();
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
                        Get.back();
                        Get.to(() => UploadEvidence());
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            Assets.imagesUploadFromGallery,
                            height: 18,
                          ),
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
          ),
        ),
      ],
    );
  }
}

class _EndHunt extends StatelessWidget {
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
                        Image.asset(Assets.imagesLogo, height: 64),
                        GestureDetector(
                          onTap: () {
                            Get.back();
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
                      text: 'End the Hunt?',
                      size: 18,
                      fontFamily: AppFonts.Fredoka,
                      textAlign: TextAlign.center,
                      weight: FontWeight.w500,
                      paddingTop: 20,
                      paddingBottom: 10,
                    ),
                    MyText(
                      text:
                          'Ending the hunt will lock all submissions and start the final review phase.',
                      size: 13,
                      textAlign: TextAlign.center,
                      weight: FontWeight.w500,
                      lineHeight: 1.5,
                      paddingBottom: 24,
                    ),
                    MyBorderButton(
                      buttonText: 'Cancel',
                      onTap: () {
                        Get.back();
                      },
                    ),
                    SizedBox(height: 16),
                    MyButton(
                      buttonText: 'End Hunt',
                      onTap: () {
                        Get.back();
                      },
                    ),
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
