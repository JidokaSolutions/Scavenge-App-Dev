import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:scavenge_hunt/core/routes/app_navigation.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:scavenge_hunt/core/constants/app_colors.dart';
import 'package:scavenge_hunt/core/constants/app_constants.dart';
import 'package:scavenge_hunt/core/constants/app_fonts.dart';
import 'package:scavenge_hunt/core/constants/app_images.dart';
import 'package:scavenge_hunt/core/constants/app_sizes.dart';
import 'package:scavenge_hunt/app.dart';
import 'package:scavenge_hunt/core/widgets/blur_container_widget.dart';
import 'package:scavenge_hunt/core/widgets/common_image_view_widget.dart';
import 'package:scavenge_hunt/core/widgets/custom_app_bar_widget.dart';
import 'package:scavenge_hunt/core/widgets/custom_container_widget.dart';
import 'package:scavenge_hunt/core/widgets/my_button_widget.dart';
import 'package:scavenge_hunt/core/widgets/my_text_widget.dart';
import 'package:scavenge_hunt/features/create_your_game/ui/waiting_for_other_votes.dart';

class JudgeBaseVoting extends StatefulWidget {
  JudgeBaseVoting({super.key});

  @override
  State<JudgeBaseVoting> createState() => _JudgeBaseVotingState();
}

class _JudgeBaseVotingState extends State<JudgeBaseVoting> {
  // List of category builder methods
  int currentStep = 0;
  late final List<Widget Function()> _votingCategories;

  void _goToNextStep() {
    if (currentStep < _votingCategories.length - 1) {
      setState(() {
        currentStep++;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _votingCategories = [_pictureOfPlane, _bestTeamWork, _funniestMoment];
  }

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: simpleAppBar(title: 'Judge-Based Voting'),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            LinearPercentIndicator(
              animateFromLastPercent: true,
              animateToInitialPercent: false,
              restartAnimation: false,
              lineHeight: 22.0,
              percent: (currentStep + 1) / _votingCategories.length,
              padding: AppSizes.HORIZONTAL,
              linearGradient: LinearGradient(
                colors: [kPrimaryColor, Color(0xff2BFF84)],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
              ),
              backgroundColor: kPrimaryColor.withValues(alpha: 0.4),
              barRadius: const Radius.circular(50),
              animation: true,
              center: MyText(
                text: '${currentStep + 1}/${_votingCategories.length}',
                size: 14,
                weight: FontWeight.w500,
                fontFamily: AppFonts.Fredoka,
              ),
              animationDuration: 1200,
            ),
            Expanded(child: _votingCategories[currentStep]()),
          ],
        ),
        bottomNavigationBar: currentStep == _votingCategories.length - 1
            ? Padding(
                padding: AppSizes.DEFAULT,
                child: MyButton(
                  buttonText: 'Submit',
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) => _ThanksForVote(),
                    );
                  },
                ),
              )
            : null,
      ),
    );
  }

  Widget _pictureOfPlane() {
    return ListView(
      shrinkWrap: true,
      padding: AppSizes.DEFAULT,
      physics: BouncingScrollPhysics(),
      children: [
        MyText(
          paddingBottom: 16,
          text: 'Picture of plane',
          textAlign: TextAlign.center,
          size: 16,
          fontFamily: AppFonts.Fredoka,
          weight: FontWeight.w700,
        ),
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
              child: GridView.builder(
                shrinkWrap: true,
                padding: AppSizes.ZERO,
                physics: BouncingScrollPhysics(),
                itemCount: 4,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 16,
                  mainAxisExtent: 180,
                ),
                itemBuilder: (BuildContext context, int index) {
                  return BlurredContainer(
                    radius: 12,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Expanded(
                          child: Stack(
                            children: [
                              ClipRRect(
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(12),
                                  topRight: Radius.circular(12),
                                ),
                                child: CommonImageView(
                                  height: double.infinity,
                                  width: double.infinity,
                                  radius: 0,
                                  url: dummyImg,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Positioned(
                                right: 10,
                                top: 10,
                                child: Container(
                                  width: 66,
                                  height: 22,
                                  decoration: BoxDecoration(
                                    color: kPrimaryColor.withValues(alpha: 0.6),
                                    borderRadius: BorderRadius.circular(50),
                                    border: Border.all(
                                      width: 1.0,
                                      color: kPrimaryColor,
                                    ),
                                  ),
                                  alignment: Alignment.center,
                                  child: MyText(
                                    text: '12 votes',
                                    size: 12,
                                    fontFamily: AppFonts.Fredoka,
                                    weight: FontWeight.w500,
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              MyText(
                                text: 'Lighting Hunt',
                                size: 12,
                                paddingBottom: 12,
                                fontFamily: AppFonts.Fredoka,
                                weight: FontWeight.w500,
                              ),
                              GestureDetector(
                                onTap: _goToNextStep,
                                child: Container(
                                  height: 30,
                                  decoration: BoxDecoration(
                                    color: kSecondaryColor,
                                    borderRadius: BorderRadius.circular(50),
                                  ),
                                  alignment: Alignment.center,
                                  child: MyText(
                                    text: 'Vote this team',
                                    size: 12,
                                    fontFamily: AppFonts.Fredoka,
                                    weight: FontWeight.w500,
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _bestTeamWork() {
    return ListView(
      shrinkWrap: true,
      padding: AppSizes.DEFAULT,
      physics: BouncingScrollPhysics(),
      children: [
        MyText(
          paddingBottom: 16,
          text: 'Best Teamwork Display',
          textAlign: TextAlign.center,
          size: 16,
          fontFamily: AppFonts.Fredoka,
          weight: FontWeight.w700,
        ),
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
              child: GridView.builder(
                shrinkWrap: true,
                padding: AppSizes.ZERO,
                physics: BouncingScrollPhysics(),
                itemCount: 4,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 16,
                  mainAxisExtent: 180,
                ),
                itemBuilder: (BuildContext context, int index) {
                  return BlurredContainer(
                    radius: 12,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Expanded(
                          child: Stack(
                            children: [
                              ClipRRect(
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(12),
                                  topRight: Radius.circular(12),
                                ),
                                child: CommonImageView(
                                  height: double.infinity,
                                  width: double.infinity,
                                  radius: 0,
                                  url: dummyImg,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Positioned(
                                right: 10,
                                top: 10,
                                child: Container(
                                  width: 66,
                                  height: 22,
                                  decoration: BoxDecoration(
                                    color: kPrimaryColor.withValues(alpha: 0.6),
                                    borderRadius: BorderRadius.circular(50),
                                    border: Border.all(
                                      width: 1.0,
                                      color: kPrimaryColor,
                                    ),
                                  ),
                                  alignment: Alignment.center,
                                  child: MyText(
                                    text: '12 votes',
                                    size: 12,
                                    fontFamily: AppFonts.Fredoka,
                                    weight: FontWeight.w500,
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              MyText(
                                text: 'Lighting Hunt',
                                size: 12,
                                paddingBottom: 12,
                                fontFamily: AppFonts.Fredoka,
                                weight: FontWeight.w500,
                              ),
                              GestureDetector(
                                onTap: _goToNextStep,
                                child: Container(
                                  height: 30,
                                  decoration: BoxDecoration(
                                    color: kSecondaryColor,
                                    borderRadius: BorderRadius.circular(50),
                                  ),
                                  alignment: Alignment.center,
                                  child: MyText(
                                    text: 'Vote this team',
                                    size: 12,
                                    fontFamily: AppFonts.Fredoka,
                                    weight: FontWeight.w500,
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _funniestMoment() {
    return ListView(
      shrinkWrap: true,
      padding: AppSizes.DEFAULT,
      physics: BouncingScrollPhysics(),
      children: [
        MyText(
          paddingBottom: 16,
          text: 'Funniest Moment',
          textAlign: TextAlign.center,
          size: 16,
          fontFamily: AppFonts.Fredoka,
          weight: FontWeight.w700,
        ),
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
              child: GridView.builder(
                shrinkWrap: true,
                padding: AppSizes.ZERO,
                physics: BouncingScrollPhysics(),
                itemCount: 4,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 16,
                  mainAxisExtent: 180,
                ),
                itemBuilder: (BuildContext context, int index) {
                  return BlurredContainer(
                    radius: 12,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Expanded(
                          child: Stack(
                            children: [
                              ClipRRect(
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(12),
                                  topRight: Radius.circular(12),
                                ),
                                child: CommonImageView(
                                  height: double.infinity,
                                  width: double.infinity,
                                  radius: 0,
                                  url: dummyImg,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Positioned(
                                right: 10,
                                top: 10,
                                child: Container(
                                  width: 66,
                                  height: 22,
                                  decoration: BoxDecoration(
                                    color: kPrimaryColor.withValues(alpha: 0.6),
                                    borderRadius: BorderRadius.circular(50),
                                    border: Border.all(
                                      width: 1.0,
                                      color: kPrimaryColor,
                                    ),
                                  ),
                                  alignment: Alignment.center,
                                  child: MyText(
                                    text: '12 votes',
                                    size: 12,
                                    fontFamily: AppFonts.Fredoka,
                                    weight: FontWeight.w500,
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              MyText(
                                text: 'Lighting Hunt',
                                size: 12,
                                paddingBottom: 12,
                                fontFamily: AppFonts.Fredoka,
                                weight: FontWeight.w500,
                              ),
                              GestureDetector(
                                onTap: _goToNextStep,
                                child: Container(
                                  height: 30,
                                  decoration: BoxDecoration(
                                    color: kSecondaryColor,
                                    borderRadius: BorderRadius.circular(50),
                                  ),
                                  alignment: Alignment.center,
                                  child: MyText(
                                    text: 'Vote this team',
                                    size: 12,
                                    fontFamily: AppFonts.Fredoka,
                                    weight: FontWeight.w500,
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _ThanksForVote extends StatefulWidget {
  @override
  State<_ThanksForVote> createState() => _ThanksForVoteState();
}

class _ThanksForVoteState extends State<_ThanksForVote> {
  @override
  void initState() {
    super.initState();
    dialogHolder();
  }

  void dialogHolder() {
    Timer(Duration(seconds: 3), () => AppNavigation.pushToWaitingForVotes(context));
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
                    Center(
                      child: Image.asset(
                        Assets.imagesThanksForVote,
                        height: 64,
                      ),
                    ),
                    MyText(
                      text: 'Thanks for Voting! ',
                      size: 22,
                      fontFamily: AppFonts.Fredoka,
                      textAlign: TextAlign.center,
                      weight: FontWeight.w500,
                      paddingTop: 20,
                      paddingBottom: 16,
                    ),
                    MyText(
                      text: 'Your votes have been submitted successfully.',
                      size: 13,
                      textAlign: TextAlign.center,
                      weight: FontWeight.w500,
                      lineHeight: 1.5,
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
