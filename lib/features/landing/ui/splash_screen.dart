import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scavenge_hunt/core/constants/app_colors.dart';
import 'package:scavenge_hunt/features/landing/ui/get_started.dart';

import '../../../core/constants/app_images.dart';
import 'package:scavenge_hunt/core/constants/app_constants.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    splashScreenHandler();
  }

  void splashScreenHandler() {
    Timer(Duration(seconds: 3), () => Get.offAll(() => GetStarted()));
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: kPrimaryColor,
      child: Container(
        height: Get.height,
        width: Get.width,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(Assets.imagesSplashBg),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(child: Image.asset(Assets.imagesLogo, height: 130)),
      ),
    );
  }
}
