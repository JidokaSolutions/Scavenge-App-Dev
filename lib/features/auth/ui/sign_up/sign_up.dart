import 'package:flutter/material.dart';
import 'package:scavenge_hunt/core/constants/app_images.dart';
import 'package:scavenge_hunt/core/constants/app_sizes.dart';
import 'package:scavenge_hunt/core/widgets/blur_container_widget.dart';
import 'package:scavenge_hunt/core/widgets/custom_container_widget.dart';
import '../widgets/signup_form.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      bgImage: Assets.imagesAuthBg,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Column(
          children: [
            const SizedBox(height: 39),
            Expanded(child: _Signup()),
          ],
        ),
      ),
    );
  }
}

class _Signup extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppSizes.DEFAULT,
      child: BlurredContainer(
        child: const Padding(
          padding: AppSizes.AUTH_PADDING,
          child: SignupForm(),
        ),
      ),
    );
  }
}