
import 'package:flutter/material.dart';

import '../constants/app_colors.dart';
import '../constants/app_fonts.dart';
import 'my_text_widget.dart';

// ignore: must_be_immutable
class MyButton extends StatelessWidget {
  const MyButton({
    Key? key,
    required this.buttonText,
    required this.onTap,
    this.height,
    this.textSize,
    this.weight,
    this.radius,
    this.child,
    this.bgColor,
    this.textColor,
    this.isDisabled = false,
    this.haveShadow = true,
  }) : super(key: key);

  final String buttonText;
  final VoidCallback onTap;
  final double? height;
  final double? textSize;
  final FontWeight? weight;
  final double? radius;
  final Widget? child;
  final Color? bgColor;
  final Color? textColor;
  final bool isDisabled;
  final bool haveShadow;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height ?? 48,
      decoration: BoxDecoration(
        boxShadow: (isDisabled || !haveShadow)
            ? null
            : [
                BoxShadow(
                  color: Color(0xff99BADD),
                  blurRadius: 4,
                  offset: Offset(0, 4),
                ),
              ],
        border: isDisabled
            ? null
            : Border.all(width: 2.0, color: kPrimaryColor),
        borderRadius: BorderRadius.circular(radius ?? 50),
        color:
            bgColor ??
            (isDisabled
                ? kSecondaryColor.withValues(alpha: 0.3)
                : kSecondaryColor),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          splashColor: kTertiaryColor.withValues(alpha: 0.1),
          highlightColor: kTertiaryColor.withValues(alpha: 0.1),
          borderRadius: BorderRadius.circular(radius ?? 50),
          child:
              child ??
              Center(
                child: MyText(
                  text: buttonText,
                  size: textSize ?? 16,
                  fontFamily: AppFonts.Fredoka,
                  weight: weight ?? FontWeight.w500,
                  color:
                      textColor ??
                      (isDisabled
                          ? kTertiaryColor.withValues(alpha: 0.6)
                          : kTertiaryColor),
                ),
              ),
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class MyBorderButton extends StatelessWidget {
  MyBorderButton({
    required this.buttonText,
    required this.onTap,
    this.height = 48,
    this.textSize,
    this.weight,
    this.child,
    this.radius,
    this.buttonColor,
    this.textColor,
    this.haveShadow = true,
  });

  final String buttonText;
  final VoidCallback onTap;
  double? height, textSize;
  FontWeight? weight;
  Widget? child;
  double? radius;
  final Color? buttonColor;
  final Color? textColor;
  final bool? haveShadow;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      decoration: BoxDecoration(
        boxShadow: !haveShadow!
            ? null
            : [
                BoxShadow(
                  color: Color(0xff99BADD),
                  blurRadius: 4,
                  offset: Offset(0, 2),
                ),
              ],
        borderRadius: BorderRadius.circular(radius ?? 50),
        color: kPrimaryColor.withValues(alpha: 0.6),
        border: Border.all(width: 1.0, color: kPrimaryColor),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          splashColor: kTertiaryColor.withValues(alpha: 0.1),
          highlightColor: kTertiaryColor.withValues(alpha: 0.1),
          borderRadius: BorderRadius.circular(radius ?? 50),
          child: child != null
              ? child
              : Center(
                  child: MyText(
                    text: buttonText,
                    size: textSize ?? 16,
                    fontFamily: AppFonts.Fredoka,
                    weight: weight ?? FontWeight.w500,
                    color: textColor ?? kTertiaryColor,
                  ),
                ),
        ),
      ),
    );
  }
}

class SimpleToggleButton extends StatelessWidget {
  final String title;
  final bool isSelected;
  final VoidCallback onTap;

  const SimpleToggleButton({
    super.key,
    required this.title,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
        decoration: BoxDecoration(
          border: Border.all(width: 1.0, color: Color(0xffDEDEDE)),
          borderRadius: BorderRadius.circular(50),
          color: isSelected ? kSecondaryColor : Color(0xffFAFAFA),
        ),
        child: MyText(
          color: kSecondaryColor,
          size: 12,
          textAlign: TextAlign.center,
          text: title,
        ),
      ),
    );
  }
}
