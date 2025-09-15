import 'package:flutter/material.dart';

import '../constants/app_colors.dart';

class SocialLogin extends StatelessWidget {
  const SocialLogin({super.key, required this.icon, required this.onTap});

  final String icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      decoration: BoxDecoration(
        color: kWhiteColor,
        border: Border.all(color: kBorderColor2, width: 1),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(10),
          splashColor: kTertiaryColor.withValues(alpha: 0.1),
          highlightColor: kTertiaryColor.withValues(alpha: 0.1),
          child: Center(child: Image.asset(icon, height: 18)),
        ),
      ),
    );
  }
}
