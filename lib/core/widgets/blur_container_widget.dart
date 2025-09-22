import 'dart:ui';

import 'package:flutter/material.dart';

import '../constants/app_colors.dart';

class BlurredContainer extends StatelessWidget {
  const BlurredContainer({
    super.key,
    required this.child,
    this.height,
    this.bgColor,
    this.radius,
  });

  final Widget child;
  final double? height;
  final Color? bgColor;
  final double? radius;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(radius ?? 24),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
        child: Container(
          height: height ?? null,
          decoration: BoxDecoration(
            border: Border.all(color: kPrimaryColor, width: 2),
            color: bgColor ?? kPrimaryColor.withValues(alpha: 0.6),
            borderRadius: BorderRadius.circular(radius ?? 24),
          ),
          child: child,
        ),
      ),
    );
  }
}
