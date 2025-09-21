import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:scavenge_hunt/core/routes/app_navigation.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:scavenge_hunt/core/constants/app_colors.dart';
import 'package:scavenge_hunt/core/constants/app_constants.dart';
import 'package:scavenge_hunt/core/constants/app_fonts.dart';
import 'package:scavenge_hunt/core/constants/app_images.dart';
import 'package:scavenge_hunt/core/constants/app_sizes.dart';
import 'package:scavenge_hunt/core/constants/app_styling.dart';
import 'package:scavenge_hunt/app.dart';
import 'package:scavenge_hunt/core/widgets/blur_container_widget.dart';
import 'package:scavenge_hunt/core/widgets/common_image_view_widget.dart';
import 'package:scavenge_hunt/core/widgets/custom_app_bar_widget.dart';
import 'package:scavenge_hunt/core/widgets/custom_container_widget.dart';
import 'package:scavenge_hunt/core/widgets/my_button_widget.dart';
import 'package:scavenge_hunt/core/widgets/my_text_widget.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class CheckEvidenceAccuracy extends StatelessWidget {
  CheckEvidenceAccuracy({super.key});

  final PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: simpleAppBar(title: 'Evidence Accuracy'),
        body: ListView(
          shrinkWrap: true,
          padding: AppSizes.DEFAULT,
          physics: BouncingScrollPhysics(),
          children: [
            SizedBox(
              height: 300,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: PageView.builder(
                  physics: BouncingScrollPhysics(),
                  controller: pageController,
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return CommonImageView(
                      height: MediaQuery.of(context).size.height,
                      width: MediaQuery.of(context).size.width,
                      radius: 0,
                      url: dummyImg,
                      fit: BoxFit.cover,
                    );
                  },
                ),
              ),
            ),
            SizedBox(height: 16),
            Center(
              child: SmoothPageIndicator(
                controller: pageController,
                count: 5,
                effect: WormEffect(
                  dotHeight: 10,
                  dotWidth: 10,
                  activeDotColor: kPrimaryColor,
                  dotColor: kPrimaryColor.withValues(alpha: .25),
                ),
              ),
            ),
            SizedBox(height: 16),
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
                      MyText(
                        text: 'Accuracy Breakdown',
                        size: 16,
                        weight: FontWeight.w500,
                        fontFamily: AppFonts.Fredoka,
                      ),
                      SizedBox(height: 20),
                      ListView.separated(
                        shrinkWrap: true,
                        padding: AppSizes.ZERO,
                        physics: BouncingScrollPhysics(),
                        itemCount: 3,
                        itemBuilder: (context, index) {
                          final List<Map<String, dynamic>> accuracyBreakdown = [
                            {
                              'image': Assets.imagesLocationMatching,
                              'title': 'Location Match',
                              'progress': 0.9,
                            },
                            {
                              'image': Assets.imagesObjectMatching,
                              'title': 'Object Match',
                              'progress': 0.9,
                            },
                            {
                              'image': Assets.imagesLighting,
                              'title': 'Lighting/Clarity',
                              'progress': 0.9,
                            },
                          ];
                          final item = accuracyBreakdown[index];
                          return Container(
                            padding: EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: kPrimaryColor.withValues(alpha: 0.6),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Row(
                              children: [
                                Image.asset(item['image'], height: 38),
                                SizedBox(width: 12),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.stretch,
                                    children: [
                                      Row(
                                        children: [
                                          Expanded(
                                            child: MyText(
                                              text: item['title'],
                                              size: 12,
                                              weight: FontWeight.w500,
                                            ),
                                          ),
                                          Container(
                                            padding: EdgeInsets.symmetric(
                                              horizontal: 10,
                                              vertical: 2,
                                            ),
                                            decoration: BoxDecoration(
                                              color: kGreenColor,
                                              borderRadius:
                                                  BorderRadius.circular(50),
                                            ),
                                            child: MyText(
                                              text:
                                                  '${(item['progress'] * 100).toInt()}%',
                                              size: 10,
                                              fontFamily: AppFonts.Fredoka,
                                              color: kPrimaryColor,
                                              weight: FontWeight.w500,
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 8),
                                      LinearPercentIndicator(
                                        restartAnimation: false,
                                        lineHeight: 4.0,
                                        percent: item['progress'],
                                        padding: AppSizes.ZERO,
                                        linearGradient: LinearGradient(
                                          colors: [
                                            kPrimaryColor,
                                            Color(0xff2BFF84),
                                          ],
                                          begin: Alignment.centerLeft,
                                          end: Alignment.centerRight,
                                        ),
                                        backgroundColor: kPrimaryColor
                                            .withValues(alpha: 0.4),
                                        barRadius: const Radius.circular(50),
                                        animation: true,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                        separatorBuilder: (context, index) {
                          return SizedBox(height: 8);
                        },
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: [
              MyButton(
                buttonText: 'Submit Evidence',
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (context) => _UploadingTask(),
                  );
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

class _UploadingTask extends StatefulWidget {
  @override
  State<_UploadingTask> createState() => _UploadingTaskState();
}

class _UploadingTaskState extends State<_UploadingTask> {
  double percent = 0.0;
  bool failed = false;
  bool success = false;
  bool retrying = false;

  @override
  void initState() {
    super.initState();
    _startUpload();
  }

  void _startUpload() async {
    setState(() {
      percent = 0.0;
      failed = false;
      success = false;
      retrying = false;
    });
    // Animate to 0.5, then fail
    await Future.delayed(const Duration(milliseconds: 300));
    setState(() {
      percent = 0.5;
    });
    await Future.delayed(const Duration(milliseconds: 1200));
    setState(() {
      failed = true;
    });
  }

  void _retryUpload() async {
    setState(() {
      retrying = true;
      failed = false;
    });
    // Animate to 1.0, then show success
    await Future.delayed(const Duration(milliseconds: 300));
    setState(() {
      percent = 1.0;
    });
    await Future.delayed(const Duration(milliseconds: 1200));
    setState(() {
      success = true;
    });
    await Future.delayed(const Duration(milliseconds: 800));
    if (mounted) {
      AppNavigation.pop(context);
      showDialog(
        context: context,
        builder: (context) => _SuccessDialog(),
      );
    }
  }

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
                      text: 'Task Uploaded',
                      size: 18,
                      fontFamily: AppFonts.Fredoka,
                      textAlign: TextAlign.center,
                      weight: FontWeight.w500,
                      paddingTop: 20,
                      paddingBottom: 16,
                    ),
                    MyText(
                      text: 'Please wait while we upload your task.',
                      size: 13,
                      weight: FontWeight.w600,
                      lineHeight: 1.5,
                      paddingBottom: 10,
                    ),
                    LinearPercentIndicator(
                      lineHeight: 16.0,
                      percent: percent,
                      padding: EdgeInsets.zero,
                      backgroundColor: kGreenColor.withValues(alpha: 0.26),
                      progressColor: kGreenColor,
                      barRadius: const Radius.circular(50),
                      animation: true,
                      animationDuration: 1200,
                    ),
                    MyText(
                      paddingTop: 10,
                      text: failed
                          ? 'Something went wrong. Please try again.'
                          : '2 out of 3 remaining..',
                      size: 13,
                      color: failed ? kRedColor : kTertiaryColor,
                      weight: FontWeight.w600,
                      lineHeight: 1.5,
                    ),
                    SizedBox(height: 24),
                    MyButton(
                      buttonText: failed ? 'Retry' : 'Cancel',
                      onTap: failed
                          ? _retryUpload
                          : () {
                              AppNavigation.pop(context);
                            },
                      textSize: 16,
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

class _SuccessDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Material(
        color: Colors.transparent,
        child: Padding(
          padding: AppSizes.DEFAULT,
          child: BlurredContainer(
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                mainAxisSize: MainAxisSize.min,
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
                    text: 'Task submitted successfully',
                    size: 18,
                    fontFamily: AppFonts.Fredoka,
                    textAlign: TextAlign.center,
                    weight: FontWeight.w500,
                    paddingTop: 20,
                    paddingBottom: 16,
                  ),
                  MyText(
                    text:
                        'All your images successfully uploaded. Please wait while review your task',
                    size: 13,
                    weight: FontWeight.w600,
                    lineHeight: 1.5,
                    paddingBottom: 24,
                    textAlign: TextAlign.center,
                  ),
                  MyButton(
                    buttonText: 'Back To Task List',
                    onTap: () {
                      AppNavigation.pop(context);
                      AppNavigation.pop(context);
                      AppNavigation.pop(context);
                    },
                    textSize: 16,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
