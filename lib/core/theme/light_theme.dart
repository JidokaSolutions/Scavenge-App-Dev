import 'package:flutter/material.dart';
import '../constants/app_colors.dart';
import '../constants/app_fonts.dart';

ThemeData lightTheme = ThemeData(
  scaffoldBackgroundColor: kPrimaryColor,
  fontFamily: AppFonts.Nunito,
  appBarTheme: AppBarTheme(elevation: 0, backgroundColor: Colors.transparent),
  splashColor: kTertiaryColor.withValues(alpha: 0.1),
  highlightColor: kTertiaryColor.withValues(alpha: 0.1),
  colorScheme: ColorScheme.fromSwatch().copyWith(
    secondary: kSecondaryColor.withValues(alpha: 0.1),
    primary: kSecondaryColor,
  ),
  useMaterial3: false,
  textSelectionTheme: TextSelectionThemeData(cursorColor: kTertiaryColor),
);
