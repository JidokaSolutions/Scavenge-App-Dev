import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:scavenge_hunt/core/constants/app_colors.dart';
import 'package:scavenge_hunt/core/constants/app_fonts.dart';
import 'package:scavenge_hunt/core/constants/app_sizes.dart';
import 'package:scavenge_hunt/features/hunts/ui/completed_task_details.dart';
import 'package:scavenge_hunt/core/widgets/custom_app_bar_widget.dart';
import 'package:scavenge_hunt/core/widgets/custom_container_widget.dart';
import 'package:scavenge_hunt/core/widgets/my_text_widget.dart';

class CompletedTasks extends StatelessWidget {
  const CompletedTasks({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: simpleAppBar(title: 'Completed Tasks'),
        body: ListView(
          shrinkWrap: true,
          padding: AppSizes.DEFAULT,
          physics: BouncingScrollPhysics(),
          children: [
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
                        text: '4 Task Completed',
                        size: 14,
                        weight: FontWeight.w500,
                        fontFamily: AppFonts.Fredoka,
                        paddingBottom: 14,
                      ),
                      ListView.separated(
                        shrinkWrap: true,
                        padding: AppSizes.ZERO,
                        physics: BouncingScrollPhysics(),
                        itemCount: 4,
                        itemBuilder: (context, index) {
                          List<String> tasks = [
                            "Picture of plane",
                            "Picture on a bridge with water in the background",
                            "Take a picture with a stranger in a Red Soxs Hat",
                            "Take a picture with a stranger in a Red Soxs Hat",
                          ];
                          return GestureDetector(
                            onTap: () {
                              Get.to(() => CompletedTaskDetails());
                            },
                            child: Container(
                              padding: EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                color: kPrimaryColor.withValues(alpha: 0.6),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: MyText(
                                text: tasks[index],
                                size: 13,
                                weight: FontWeight.w600,
                              ),
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
      ),
    );
  }
}
