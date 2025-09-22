import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scavenge_hunt/core/constants/app_colors.dart';
import 'package:scavenge_hunt/core/constants/app_fonts.dart';
import 'package:scavenge_hunt/core/constants/app_images.dart';
import 'package:scavenge_hunt/core/constants/app_sizes.dart';
import 'package:scavenge_hunt/core/constants/getx_controller_instances.dart';
import 'package:scavenge_hunt/core/widgets/custom_app_bar_widget.dart';
import 'package:scavenge_hunt/core/widgets/custom_container_widget.dart';
import 'package:scavenge_hunt/core/widgets/my_text_widget.dart';

class CreateYourGame extends StatelessWidget {
  const CreateYourGame({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: simpleAppBar(
          title: 'Create Your Game',
          onLeadingTap: () => createGameController.previousStep(),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Obx(
              () => _CustomStepper(labels: createGameController.currentLabels),
            ),
            Expanded(
              child: Obx(
                () => createGameController.stepChildren[createGameController.currentStep.value],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _CustomStepper extends StatelessWidget {
  const _CustomStepper({required this.labels});
  final List<String> labels;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppSizes.DEFAULT,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14),
            child: Stack(
              clipBehavior: Clip.none,
              alignment: Alignment.center,
              children: [
                Row(
                  children: List.generate(labels.length - 1, (index) {
                    return Expanded(
                      child: Obx(
                        () => Container(
                          height: 8,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              stops: [0.0, 1.0],
                              colors: createGameController.currentStep.value > index
                                  ? [Color(0xff2BFF84), Color(0xFFFFFFFF)]
                                  : [
                                      kPrimaryColor.withOpacity(0.3),
                                      kPrimaryColor.withOpacity(0.3),
                                    ],
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                            ),
                            color: kPrimaryColor.withOpacity(0.3),
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(index == 0 ? 50 : 0),
                              bottomLeft: Radius.circular(index == 0 ? 50 : 0),
                              topRight: Radius.circular(index == 3 ? 50 : 0),
                              bottomRight: Radius.circular(index == 3 ? 50 : 0),
                            ),
                          ),
                        ),
                      ),
                    );
                  }),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: List.generate(labels.length, (index) {
                    return Obx(
                      () => Image.asset(
                        createGameController.currentStep.value >= index ? Assets.imagesCurrentStep : Assets.imagesNotCurrentStep,
                        height: 24,
                      ),
                    );
                  }),
                ),
              ],
            ),
          ),
          SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(labels.length, (index) {
              return Obx(
                () => MyText(
                  paddingLeft: 5,
                  paddingRight: 5,
                  text: labels[index],
                  size: 12,
                  fontFamily: AppFonts.Fredoka,
                  color: createGameController.currentStep.value >= index ? kPrimaryColor : kTertiaryColor,
                  weight: FontWeight.w500,
                ),
              );
            }),
          ),
        ],
      ),
    );
  }
}
