import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:scavenge_hunt/core/constants/app_colors.dart';
import 'package:scavenge_hunt/core/constants/app_constants.dart';
import 'package:scavenge_hunt/core/constants/app_fonts.dart';
import 'package:scavenge_hunt/core/constants/app_sizes.dart';
import 'package:scavenge_hunt/core/constants/app_styling.dart';
import 'package:scavenge_hunt/core/widgets/blur_container_widget.dart';
import 'package:scavenge_hunt/core/widgets/common_image_view_widget.dart';
import 'package:scavenge_hunt/core/widgets/custom_container_widget.dart';
import 'package:scavenge_hunt/core/widgets/my_button_widget.dart';
import 'package:scavenge_hunt/core/widgets/my_text_widget.dart';

class TeamMemberDetails extends StatefulWidget {
  const TeamMemberDetails({super.key});

  @override
  State<TeamMemberDetails> createState() => _TeamMemberDetailsState();
}

class _TeamMemberDetailsState extends State<TeamMemberDetails> {
  final List<String> _taskDescriptions = [
    'Picture of plane',
    'Take a picture with a stranger in a Red Soxs Hat',
    'Take a picture with a real/fake animal',
    'Take a picture with a real/fake animal',
    'Take a picture with a real/fake animal',
    'Take a picture with a real/fake animal',
    'Take a picture with a real/fake animal',
    'Take a picture with a real/fake animal',
    'Take a picture with a real/fake animal',
  ];

  late List<bool> _taskCompleted;

  @override
  void initState() {
    super.initState();
    _taskCompleted = List.generate(_taskDescriptions.length, (_) => false);
  }

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: ListView(
          shrinkWrap: true,
          padding: AppSizes.DEFAULT,
          physics: BouncingScrollPhysics(),
          children: [
            SizedBox(height: 39),
            Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: kPrimaryColor.withValues(alpha: 0.6),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Center(
                    child: CommonImageView(
                      height: 72,
                      width: 72,
                      radius: 100,
                      url: dummyImg,
                      fit: BoxFit.cover,
                    ),
                  ),
                  MyText(
                    paddingTop: 16,
                    text: 'John Cena Task Progress',
                    size: 17,
                    weight: FontWeight.w500,
                    fontFamily: AppFonts.Fredoka,
                    textAlign: TextAlign.center,
                    paddingBottom: 8,
                  ),
                  MyText(
                    text: 'You can only view task status, not submitted media',
                    textAlign: TextAlign.center,
                    weight: FontWeight.w600,
                    size: 12,
                    color: kTertiaryColor.withValues(alpha: 0.8),
                    paddingBottom: 12,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 24,
                          vertical: 8,
                        ),
                        decoration: AppStyling.SIMPLE_GLOSSY,
                        child: MyText(
                          text: '1 / 10 task Completed',
                          size: 14,
                          fontFamily: AppFonts.Fredoka,
                          weight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
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
                    child: Row(
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
                              color: isActive
                                  ? kGreenColor
                                  : kPrimaryColor.withValues(alpha: 0.7),
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
                            size: 15,
                            weight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ],
        ),
        bottomNavigationBar: Padding(
          padding: AppSizes.DEFAULT,
          child: MyButton(
            buttonText: 'Back To Team',
            onTap: () {
              Get.back();
            },
          ),
        ),
      ),
    );
  }
}
