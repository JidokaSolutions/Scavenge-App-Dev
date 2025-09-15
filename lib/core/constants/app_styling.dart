import 'package:flutter/material.dart';

import 'app_colors.dart';

class AppStyling {
  static final GLOSSY_CARD = BoxDecoration(
    border: Border.all(color: kPrimaryColor, width: 1),
    color: kPrimaryColor.withValues(alpha: 0.4),
    borderRadius: BorderRadius.circular(24),
  );
  static final SIMPLE_GLOSSY = BoxDecoration(
    color: kPrimaryColor.withValues(alpha: 0.50),
    borderRadius: BorderRadius.circular(50),
  );
}
