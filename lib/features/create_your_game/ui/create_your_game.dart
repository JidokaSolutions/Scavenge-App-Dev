import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:scavenge_hunt/core/constants/app_colors.dart';
import 'package:scavenge_hunt/core/constants/app_fonts.dart';
import 'package:scavenge_hunt/core/constants/app_images.dart';
import 'package:scavenge_hunt/core/constants/app_sizes.dart';
import 'package:scavenge_hunt/core/routes/app_navigation.dart';
import 'package:scavenge_hunt/core/widgets/custom_app_bar_widget.dart';
import 'package:scavenge_hunt/core/widgets/custom_container_widget.dart';
import 'package:scavenge_hunt/core/widgets/my_text_widget.dart';

import '../logic/create_game_provider.dart';

class CreateYourGame extends ConsumerWidget {
  const CreateYourGame({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return CustomContainer(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: simpleAppBar(
          title: 'Create Your Game',
          onLeadingTap: () => ref.read(createGameProvider.notifier).previousStep(ifNone: () => AppNavigation.pop(context)),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Consumer(
              builder: (context, ref, _) => _CustomStepper(labels: ref.watch(currentLabelsProvider)),
            ),
            Expanded(
              child: Consumer(
                builder: (context, ref, _) {
                  final currentStep = ref.watch(currentStepProvider);
                  final state = ref.watch(createGameProvider);
                  return state.stepChildren[currentStep];
                },
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
                      child: Consumer(
                        builder: (context, ref, _) {
                          final currentStep = ref.watch(currentStepProvider);
                          return Container(
                            height: 8,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                stops: [0.0, 1.0],
                                colors: currentStep > index
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
                          );
                        },
                      ),
                    );
                  }),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: List.generate(labels.length, (index) {
                    return Consumer(
                      builder: (context, ref, _) {
                        final currentStep = ref.watch(currentStepProvider);
                        return Image.asset(
                          currentStep >= index ? Assets.imagesCurrentStep : Assets.imagesNotCurrentStep,
                          height: 24,
                        );
                      },
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
              return Consumer(
                builder: (context, ref, _) {
                  final currentStep = ref.watch(currentStepProvider);
                  return MyText(
                    paddingLeft: 5,
                    paddingRight: 5,
                    text: labels[index],
                    size: 12,
                    fontFamily: AppFonts.Fredoka,
                    color: currentStep >= index ? kPrimaryColor : kTertiaryColor,
                    weight: FontWeight.w500,
                  );
                },
              );
            }),
          ),
        ],
      ),
    );
  }
}
