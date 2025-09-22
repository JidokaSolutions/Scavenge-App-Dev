import 'package:flutter/material.dart';

import '../constants/app_fonts.dart';
import '../constants/app_images.dart';
import 'my_text_widget.dart';

class AuthHeading extends StatelessWidget {
  const AuthHeading({
    super.key,
    required this.title,
    required this.subTitle,
    this.marginTop,
    this.showLogo = true,
  });

  final String? title;
  final String? subTitle;
  final double? marginTop;
  final bool? showLogo;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        if (showLogo!) Center(child: Image.asset(Assets.imagesLogo, height: 65)),
        MyText(
          paddingTop: marginTop ?? 24,
          text: title ?? '',
          size: 24,
          fontFamily: AppFonts.Fredoka,
          paddingBottom: subTitle!.isEmpty ? 24 : 12,
          textAlign: TextAlign.center,
          weight: FontWeight.w600,
        ),
        if (subTitle!.isNotEmpty)
          MyText(
            text: subTitle ?? '',
            size: 12,
            textAlign: TextAlign.center,
            weight: FontWeight.w500,
            lineHeight: 1.5,
            paddingBottom: 24,
          ),
      ],
    );
  }
}
