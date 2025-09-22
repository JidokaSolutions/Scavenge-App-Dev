import 'package:flutter/material.dart';
import 'package:scavenge_hunt/core/routes/app_navigation.dart';

import '../constants/app_colors.dart';
import '../constants/app_fonts.dart';
import '../constants/app_images.dart';
import 'my_text_widget.dart';

AppBar simpleAppBar({
  bool haveLeading = true,
  bool centerTitle = true,
  String? title,
  Color? bgColor,
  final Widget? leading,
  List<Widget>? actions,
  VoidCallback? onLeadingTap,
  BuildContext? context,
}) {
  return AppBar(
    elevation: 0,
    backgroundColor: bgColor ?? Colors.transparent,
    automaticallyImplyLeading: false,
    centerTitle: centerTitle,
    leading: haveLeading
        ? leading ??
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: onLeadingTap ??
                      () {
                        if (context != null) {
                          AppNavigation.pop(context);
                        }
                      },
                  child: Image.asset(Assets.imagesArrowBack, height: 20),
                ),
              ],
            )
        : null,
    title: MyText(
      text: title ?? '',
      size: 16,
      fontFamily: AppFonts.Fredoka,
      weight: FontWeight.w500,
      color: kTertiaryColor,
    ),
    actions: actions,
  );
}
