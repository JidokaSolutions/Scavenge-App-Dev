import 'package:flutter/material.dart';

/// Generic method to show any dialog widget
Future<T?> showCustomDialog<T>({required BuildContext context, required Widget widget, bool barrierDismissible = true, bool preventBackButton = false}) async {
  return await showDialog<T>(
    context: context,
    barrierDismissible: barrierDismissible,
    builder: (dialogContext) {
      if (preventBackButton) {
        return PopScope(
          canPop: false,
          child: widget,
        );
      }
      return widget;
    },
  );
}
