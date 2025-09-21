import 'package:flutter/material.dart';
import '../constants/app_colors.dart';
import '../constants/app_images.dart';
import 'my_text_widget.dart';
import 'social_login_ widget.dart';

class SocialLoginWidget extends StatelessWidget {
  const SocialLoginWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // "Or login with" divider
        Row(
          children: [
            Expanded(child: Container(height: 1, color: kPrimaryColor)),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: MyText(
                text: 'Or login with',
                size: 14,
                weight: FontWeight.w500,
              ),
            ),
            Expanded(child: Container(height: 1, color: kPrimaryColor)),
          ],
        ),
        const SizedBox(height: 25),

        // Social login buttons
        Row(
          children: List.generate(3, (index) {
            return Expanded(
              child: Padding(
                padding: EdgeInsets.only(
                  right: index < 2 ? 16 : 0,
                ),
                child: SocialLogin(
                  icon: [
                    Assets.imagesGoogle,
                    Assets.imagesFacebook,
                    Assets.imagesApple,
                  ][index],
                  onTap: () {
                    // TODO: Implement social login functionality
                    print('Social login tapped: ${['Google', 'Facebook', 'Apple'][index]}');
                  },
                ),
              ),
            );
          }),
        ),
      ],
    );
  }
}