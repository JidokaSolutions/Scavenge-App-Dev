import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:scavenge_hunt/core/constants/app_colors.dart';
import 'package:scavenge_hunt/core/constants/app_constants.dart';
import 'package:scavenge_hunt/core/constants/app_fonts.dart';
import 'package:scavenge_hunt/core/constants/app_images.dart';
import 'package:scavenge_hunt/core/constants/app_sizes.dart';
import 'package:scavenge_hunt/core/constants/app_styling.dart';
import 'package:scavenge_hunt/core/routes/app_navigation.dart';
import 'package:scavenge_hunt/core/widgets/blur_container_widget.dart';
import 'package:scavenge_hunt/core/widgets/common_image_view_widget.dart';
import 'package:scavenge_hunt/core/widgets/custom_app_bar_widget.dart';
import 'package:scavenge_hunt/core/widgets/custom_container_widget.dart';
import 'package:scavenge_hunt/core/widgets/my_button_widget.dart';
import 'package:scavenge_hunt/core/widgets/my_text_widget.dart';
import 'package:scavenge_hunt/features/create_your_game/logic/create_game_provider.dart';
import 'package:scavenge_hunt/features/create_your_game/logic/create_game_state.dart';

class WithFriends extends StatefulWidget {
  const WithFriends({super.key});

  @override
  State<WithFriends> createState() => _WithFriendsState();
}

class _WithFriendsState extends State<WithFriends> {
  int currentIndex = 0;
  final List<String> tabLabels = ['My Progress', 'Opponent Progress'];

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: simpleAppBar(title: 'Your Game Checklist'),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: Container(
                height: 40,
                padding: EdgeInsets.all(4),
                decoration: BoxDecoration(
                  color: kPrimaryColor.withValues(alpha: 0.3),
                  borderRadius: BorderRadius.circular(50),
                ),
                margin: AppSizes.DEFAULT,
                child: Row(
                  children: List.generate(2, (index) {
                    return Expanded(
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            currentIndex = index;
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: currentIndex == index ? kGreenColor : Colors.transparent,
                            borderRadius: BorderRadius.circular(50),
                          ),
                          alignment: Alignment.center,
                          child: RichText(
                            text: TextSpan(
                              style: TextStyle(
                                fontFamily: AppFonts.Nunito,
                                color: currentIndex == index ? kPrimaryColor : kTertiaryColor,
                                fontWeight: FontWeight.w600,
                                fontSize: 12,
                              ),
                              children: [
                                TextSpan(text: tabLabels[index]),
                                TextSpan(
                                  text: currentIndex == index ? '/ 10%' : ' / 50%',
                                  style: TextStyle(
                                    color: currentIndex == index ? kPrimaryColor : kTertiaryColor,
                                    fontWeight: currentIndex == index ? FontWeight.w700 : FontWeight.w600,
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  }),
                ),
              ),
            ),
            Expanded(
              child: IndexedStack(
                index: currentIndex,
                children: [_MyProgress(), _OpponentProgress()],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _MyProgress extends StatefulWidget {
  @override
  State<_MyProgress> createState() => _MyProgressState();
}

class _MyProgressState extends State<_MyProgress> {
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
                      text: 'Task List',
                      size: 16,
                      weight: FontWeight.w500,
                      fontFamily: AppFonts.Fredoka,
                    ),
                  ),
                  Consumer(
                    builder: (context, ref, _) {
                      final selectedGameType = ref.watch(selectedGameTypeProvider);
                      if (selectedGameType == GameType.timeBase) {
                        return SizedBox(
                          width: 130,
                          child: MyBorderButton(
                            haveShadow: false,
                            height: 40,
                            buttonText: 'Time Left: 30:00',
                            textSize: 14,
                            onTap: () {},
                          ),
                        );
                      } else {
                        return SizedBox.shrink();
                      }
                    },
                  ),
                  SizedBox(width: 8),
                  SizedBox(
                    width: 95,
                    child: MyBorderButton(
                      haveShadow: false,
                      height: 40,
                      buttonText: '',
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        spacing: 8,
                        children: [
                          Image.asset(Assets.imagesChat, height: 20),
                          MyText(
                            text: 'Chat',
                            size: 14,
                            paddingRight: 4,
                            weight: FontWeight.w500,
                            fontFamily: AppFonts.Fredoka,
                          ),
                        ],
                      ),
                      onTap: () {
                        AppNavigation.pushToChatWithFriends(context);
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(height: 24),
              SizedBox(
                width: 130,
                child: MyBorderButton(
                  height: 40,
                  textSize: 14,
                  haveShadow: false,
                  buttonText: 'View Team Progress',
                  onTap: () {
                    AppNavigation.pushToViewTeamProgress(context);
                  },
                ),
              ),
              SizedBox(height: 12),
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
                                    _taskCompleted[index] = !_taskCompleted[index];
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
                                    color: isActive ? kGreenColor : kPrimaryColor.withValues(alpha: 0.7),
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
                                  buttonText: 'Task detail',
                                  onTap: () {
                                    AppNavigation.pushToGameTaskDetails(context);
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
                                    showDialog(
                                      context: context,
                                      builder: (context) => _SubmitYourEvidence(),
                                    );
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
              _taskCompleted.contains(true)
                  ? showDialog(
                      context: context,
                      builder: (context) => _EndHunt(),
                    )
                  : null;
            },
            isDisabled: !_taskCompleted.contains(true),
          ),
        ),
      ],
    );
  }
}

class _OpponentProgress extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> opponents = [
      {
        'image': dummyImg,
        'teamName': 'Team Alpha',
        'totalTasks': 10,
        'completed': 10,
        'progress': 1.0,
      },
      {
        'image': dummyImg,
        'teamName': 'Team Foxtrot',
        'totalTasks': 10,
        'completed': 8,
        'progress': 0.8,
      },
      {
        'image': dummyImg,
        'teamName': 'Team Bravo',
        'totalTasks': 10,
        'completed': 7,
        'progress': 0.7,
      },
      {
        'image': dummyImg,
        'teamName': 'Team Echo',
        'totalTasks': 10,
        'completed': 6,
        'progress': 0.6,
      },
      {
        'image': dummyImg,
        'teamName': 'Team Charlie',
        'totalTasks': 10,
        'completed': 5,
        'progress': 0.5,
      },
      {
        'image': dummyImg,
        'teamName': 'Team Delta',
        'totalTasks': 10,
        'completed': 3,
        'progress': 0.3,
      },
    ];
    return ListView(
      shrinkWrap: true,
      padding: AppSizes.DEFAULT,
      physics: BouncingScrollPhysics(),
      children: [
        Row(
          spacing: 10,
          children: [
            Expanded(
              child: Container(
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
                    hintText: 'Search by Team Name',
                    hintStyle: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: kTertiaryColor.withValues(alpha: 0.7),
                    ),
                  ),
                ),
              ),
            ),
            PopupMenuButton<String>(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              constraints: BoxConstraints(minWidth: 48, maxWidth: 120),
              padding: EdgeInsets.zero,
              offset: Offset(0, 50),
              icon: Image.asset(Assets.imagesSortBy, height: 48),
              onSelected: (value) {},
              itemBuilder: (context) => [
                PopupMenuItem(
                  height: 30,
                  value: 'High to Low',
                  child: Text(
                    'High to Low',
                    style: TextStyle(
                      fontFamily: AppFonts.Nunito,
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                PopupMenuItem(
                  height: 30,
                  value: 'Low to High',
                  child: Text(
                    'Low to High',
                    style: TextStyle(
                      fontFamily: AppFonts.Nunito,
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
        MyText(
          paddingTop: 24,
          text: '12 Opponents',
          size: 16,
          weight: FontWeight.w500,
          fontFamily: AppFonts.Fredoka,
        ),
        SizedBox(height: 14),
        ListView.separated(
          itemCount: opponents.length,
          shrinkWrap: true,
          padding: AppSizes.ZERO,
          physics: BouncingScrollPhysics(),
          separatorBuilder: (context, index) => SizedBox(height: 8),
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                // Get.to(() => TeamMemberDetails());
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
                      url: opponents[index]['image'],
                      fit: BoxFit.cover,
                    ),
                    SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.stretch,
                                  children: [
                                    MyText(
                                      text: opponents[index]['teamName'],
                                      size: 16,
                                      fontFamily: AppFonts.Fredoka,
                                      weight: FontWeight.w500,
                                      paddingBottom: 8,
                                    ),
                                    MyText(
                                      text: '${opponents[index]['completed']} OF ${opponents[index]['totalTasks']} Task Completed',
                                      size: 12,
                                      color: kTertiaryColor.withValues(
                                        alpha: 0.8,
                                      ),
                                      paddingBottom: 8,
                                      weight: FontWeight.w600,
                                    ),
                                    LinearPercentIndicator(
                                      restartAnimation: false,
                                      lineHeight: 4.0,
                                      percent: opponents[index]['progress'],
                                      padding: AppSizes.ZERO,
                                      linearGradient: LinearGradient(
                                        colors: [
                                          kPrimaryColor,
                                          Color(0xff2BFF84),
                                        ],
                                        begin: Alignment.centerLeft,
                                        end: Alignment.centerRight,
                                      ),
                                      backgroundColor: kPrimaryColor.withValues(
                                        alpha: 0.4,
                                      ),
                                      barRadius: const Radius.circular(50),
                                      animation: true,
                                    ),
                                  ],
                                ),
                              ),
                              if (index == 0)
                                Image.asset(Assets.imagesGoldMeal, height: 32)
                              else if (index == 1)
                                Image.asset(
                                  Assets.imagesSilverMedal,
                                  height: 32,
                                )
                              else if (index == 2)
                                Image.asset(
                                  Assets.imagesBronzeMedal,
                                  height: 32,
                                )
                              else
                                Container(
                                  height: 26,
                                  width: 26,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    color: kPrimaryColor.withValues(alpha: 0.6),
                                    shape: BoxShape.circle,
                                  ),
                                  child: MyText(
                                    text: '#${index + 1}',
                                    size: 10,
                                    fontFamily: AppFonts.Fredoka,
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
            );
          },
        ),
      ],
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
                        AppNavigation.pop(context);
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
                        AppNavigation.pop(context);
                        AppNavigation.pushToUploadEvidence(context);
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

class _EndHunt extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
                      text: 'End the Hunt?',
                      size: 18,
                      fontFamily: AppFonts.Fredoka,
                      textAlign: TextAlign.center,
                      weight: FontWeight.w500,
                      paddingTop: 20,
                      paddingBottom: 10,
                    ),
                    MyText(
                      text: 'Ending the hunt will lock all submissions and start the final review phase.',
                      size: 13,
                      textAlign: TextAlign.center,
                      weight: FontWeight.w500,
                      lineHeight: 1.5,
                      paddingBottom: 24,
                    ),
                    MyBorderButton(
                      buttonText: 'Cancel',
                      onTap: () {
                        AppNavigation.pop(context);
                      },
                    ),
                    SizedBox(height: 16),
                    MyButton(
                      buttonText: 'End Hunt',
                      onTap: () {
                        AppNavigation.pop(context);
                        final selectedGameType = ref.read(selectedGameTypeProvider);
                        if (selectedGameType == GameType.timeBase) {
                          AppNavigation.pushToTimeBaseVoting(context);
                        } else {
                          AppNavigation.pushToJudgeBaseVoting(context);
                        }
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
