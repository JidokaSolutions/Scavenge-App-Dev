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

class TimeBaseVoting extends StatefulWidget {
  TimeBaseVoting({super.key});

  @override
  State<TimeBaseVoting> createState() => _TimeBaseVotingState();
}

class _TimeBaseVotingState extends State<TimeBaseVoting> {
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

  // Track disqualified state for each team card
  List<bool> _disqualified = List.generate(4, (_) => false);

  Widget _pictureOfPlane() {
    return ListView(
      shrinkWrap: true,
      padding: AppSizes.DEFAULT,
      physics: BouncingScrollPhysics(),
      children: [
        MyText(
          paddingBottom: 16,
          text: 'Take a picture of street entertainer.',
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
                  return _TeamCard(
                    image: dummyImg,
                    title: 'Lighting Hunt',
                    time: '12:00',
                    votes: 12,
                    onDQ: () async {
                      showDialog(
                        context: context,
                        builder: (context) => _DisqualifiedTeam(
                          onDisqualify: () {
                            setState(() {
                              _disqualified[index] = true;
                            });
                          },
                        ),
                      );
                    },
                    onPass: _goToNextStep,
                    isDisqualified: _disqualified[index],
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
          text: 'Take a picture of street entertainer.',
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
                  return _TeamCard(
                    image: dummyImg,
                    title: 'Lighting Hunt',
                    time: '12:00',
                    votes: 12,
                    onDQ: () async {
                      showDialog(
                        context: context,
                        builder: (context) => _DisqualifiedTeam(
                          onDisqualify: () {
                            setState(() {
                              _disqualified[index] = true;
                            });
                          },
                        ),
                      );
                    },
                    onPass: _goToNextStep,
                    isDisqualified: _disqualified[index],
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
          text: 'Take a picture of street entertainer.',
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
                  return _TeamCard(
                    image: dummyImg,
                    title: 'Lighting Hunt',
                    time: '12:00',
                    votes: 12,
                    onDQ: () async {
                      showDialog(
                        context: context,
                        builder: (context) => _DisqualifiedTeam(
                          onDisqualify: () {
                            setState(() {
                              _disqualified[index] = true;
                            });
                          },
                        ),
                      );
                    },
                    onPass: _goToNextStep,
                    isDisqualified: _disqualified[index],
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

class _TeamCard extends StatelessWidget {
  const _TeamCard({
    required this.image,
    required this.title,
    required this.time,
    required this.votes,
    required this.onDQ,
    required this.onPass,
    required this.isDisqualified,
  });

  final String image;
  final String title;
  final String time;
  final int votes;
  final VoidCallback onDQ;
  final VoidCallback onPass;
  final bool isDisqualified;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        BlurredContainer(
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
                        url: image,
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
                          border: Border.all(width: 1.0, color: kPrimaryColor),
                        ),
                        alignment: Alignment.center,
                        child: MyText(
                          text: '$votes votes',
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
                    Row(
                      children: [
                        Expanded(
                          child: MyText(
                            text: title,
                            size: 12,
                            fontFamily: AppFonts.Fredoka,
                            weight: FontWeight.w500,
                          ),
                        ),
                        Image.asset(Assets.imagesClock, height: 12),
                        MyText(
                          paddingBottom: 1,
                          paddingLeft: 2,
                          text: time,
                          size: 10,
                          fontFamily: AppFonts.Fredoka,
                          weight: FontWeight.w500,
                        ),
                      ],
                    ),
                    SizedBox(height: 12),
                    Row(
                      children: [
                        Expanded(
                          child: GestureDetector(
                            onTap: onDQ,
                            child: Container(
                              height: 30,
                              decoration: BoxDecoration(
                                color: kRedColor,
                                borderRadius: BorderRadius.circular(50),
                              ),
                              alignment: Alignment.center,
                              child: MyText(
                                text: 'DQ',
                                size: 12,
                                color: kPrimaryColor,
                                fontFamily: AppFonts.Fredoka,
                                weight: FontWeight.w500,
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 7),
                        Expanded(
                          child: GestureDetector(
                            onTap: onPass,
                            child: Container(
                              height: 30,
                              decoration: BoxDecoration(
                                color: kGreenColor,
                                borderRadius: BorderRadius.circular(50),
                              ),
                              alignment: Alignment.center,
                              child: MyText(
                                text: 'Pass',
                                size: 12,
                                color: kPrimaryColor,
                                fontFamily: AppFonts.Fredoka,
                                weight: FontWeight.w500,
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),

        if (isDisqualified)
          Container(
            decoration: BoxDecoration(
              color: kTertiaryColor.withValues(alpha: 0.7),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Center(
              child: MyText(
                text: 'Disqualified',
                size: 18,
                color: kPrimaryColor,
                weight: FontWeight.w700,
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

class _DisqualifiedTeam extends StatelessWidget {
  final VoidCallback onDisqualify;

  const _DisqualifiedTeam({super.key, required this.onDisqualify});
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
                      text: 'Disqualified Team',
                      size: 18,
                      fontFamily: AppFonts.Fredoka,
                      textAlign: TextAlign.center,
                      weight: FontWeight.w500,
                      paddingTop: 20,
                      paddingBottom: 10,
                    ),
                    MyText(
                      text:
                          'Are you sure you want to disqualify this team? This action cannot be undone.',
                      size: 13,
                      textAlign: TextAlign.center,
                      weight: FontWeight.w500,
                      lineHeight: 1.5,
                      paddingBottom: 24,
                    ),

                    MyButton(
                      buttonText: 'Ok',
                      onTap: () {
                        AppNavigation.pop(context);
                        onDisqualify();
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
