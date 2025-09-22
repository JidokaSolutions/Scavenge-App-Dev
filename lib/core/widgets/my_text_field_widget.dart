import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';

import '../constants/app_colors.dart';
import '../constants/app_fonts.dart';
import '../constants/app_images.dart';
import '../constants/app_sizes.dart';
import 'my_text_widget.dart';

// ignore: must_be_immutable
class MyTextField extends StatelessWidget {
  const MyTextField({
    super.key,
    this.controller,
    this.hintText,
    this.labelText,
    this.onChanged,
    this.isObSecure = false,
    this.marginBottom = 8.0,
    this.maxLines = 1,
    this.labelSize,
    this.prefix,
    this.suffix,
    this.isReadOnly,
    this.onTap,
    this.fillColor,
    this.validator,
  });

  final String? labelText, hintText;
  final TextEditingController? controller;
  final ValueChanged<String>? onChanged;
  final bool? isObSecure, isReadOnly;
  final double? marginBottom;
  final int? maxLines;
  final double? labelSize;
  final Color? fillColor;
  final Widget? prefix, suffix;
  final VoidCallback? onTap;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: marginBottom!),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          if (labelText != null)
            MyText(
              text: labelText ?? '',
              paddingBottom: 6,
              size: 12,
              weight: FontWeight.w600,
            ),
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: TextFormField(
              onTap: onTap,
              textAlignVertical: prefix != null || suffix != null ? TextAlignVertical.center : null,
              cursorColor: kTertiaryColor,
              maxLines: maxLines,
              readOnly: isReadOnly ?? false,
              controller: controller,
              onChanged: onChanged,
              textInputAction: TextInputAction.next,
              obscureText: isObSecure!,
              obscuringCharacter: '*',
              validator: validator,
              style: TextStyle(
                fontSize: 14,
                color: kTertiaryColor,
                fontFamily: AppFonts.Nunito,
                fontWeight: FontWeight.w500,
              ),
              decoration: InputDecoration(
                filled: true,
                fillColor: fillColor ?? kPrimaryColor,
                prefixIcon: prefix,
                suffixIcon: suffix,
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 15,
                  vertical: maxLines! > 1 ? 15 : 0,
                ),
                hintText: hintText,
                hintStyle: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: kTertiaryColor,
                  fontFamily: AppFonts.Nunito,
                ),
                border: InputBorder.none,
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
                errorBorder: InputBorder.none,
                focusedErrorBorder: InputBorder.none,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ignore: must_be_immutable
class PhoneField extends StatefulWidget {
  PhoneField({Key? key, this.controller, this.onChanged, this.fillColor}) : super(key: key);

  TextEditingController? controller;
  ValueChanged<String>? onChanged;
  Color? fillColor;

  @override
  State<PhoneField> createState() => _PhoneFieldState();
}

class _PhoneFieldState extends State<PhoneField> {
  String countryFlag = '🇺🇸';
  String countryCode = '1';
  bool isFocused = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 8),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: TextFormField(
          cursorColor: kTertiaryColor,
          controller: widget.controller,
          onChanged: widget.onChanged,
          textAlignVertical: TextAlignVertical.center,
          textInputAction: TextInputAction.next,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: kTertiaryColor,
            fontFamily: AppFonts.Nunito,
          ),
          decoration: InputDecoration(
            filled: true,
            fillColor: widget.fillColor ?? kPrimaryColor,
            prefixIcon: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 74,
                  child: Row(
                    children: [
                      SizedBox(width: 14),
                      Expanded(
                        child: MyText(
                          onTap: () {
                            showCountryPicker(
                              context: context,
                              countryListTheme: CountryListThemeData(
                                flagSize: 25,
                                margin: AppSizes.DEFAULT,
                                backgroundColor: kPrimaryColor,
                                textStyle: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: kTertiaryColor,
                                  fontFamily: AppFonts.Nunito,
                                  // fontFamily: AppFonts.URBANIST,
                                ),
                                bottomSheetHeight: 500,
                                borderRadius: BorderRadius.circular(24),
                                searchTextStyle: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: kTertiaryColor,
                                  fontFamily: AppFonts.Nunito,
                                ),
                                inputDecoration: InputDecoration(
                                  contentPadding: EdgeInsets.symmetric(
                                    horizontal: 15,
                                  ),
                                  fillColor: kTertiaryColor.withValues(
                                    alpha: 0.1,
                                  ),
                                  filled: true,
                                  hintText: 'Search',
                                  hintStyle: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    color: kTertiaryColor,
                                    fontFamily: AppFonts.Nunito,
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide.none,
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide.none,
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide.none,
                                  ),
                                ),
                              ),
                              onSelect: (Country country) {
                                setState(() {
                                  countryFlag = country.flagEmoji;
                                  countryCode = country.phoneCode;
                                });
                              },
                            );
                          },
                          text: '${countryFlag}',
                          size: 14,
                          weight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(width: 10),
                      Image.asset(Assets.imagesDropdown, height: 12),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 10),
                        height: 38,
                        width: 1,
                        color: kTertiaryColor.withValues(alpha: 0.2),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            contentPadding: EdgeInsets.symmetric(horizontal: 15),
            hintText: '(454) 726-0592',
            hintStyle: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: kTertiaryColor,
              fontFamily: AppFonts.Nunito,
            ),
            border: InputBorder.none,
            enabledBorder: InputBorder.none,
            focusedBorder: InputBorder.none,
            errorBorder: InputBorder.none,
            focusedErrorBorder: InputBorder.none,
          ),
        ),
      ),
    );
  }
}
