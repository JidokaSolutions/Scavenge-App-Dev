import 'package:flutter/material.dart';

import '../constants/app_images.dart';

class CustomContainer extends StatelessWidget {
  final Widget child;
  final String? bgImage;

  const CustomContainer({Key? key, required this.child, this.bgImage})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(bgImage ?? Assets.imagesMainBg),
          fit: BoxFit.cover,
        ),
      ),
      child: child,
    );
  }
}

class CustomContainer2 extends StatelessWidget {
  final Widget child;

  const CustomContainer2({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(Assets.imagesSplashBg),
          fit: BoxFit.cover,
        ),
      ),
      child: child,
    );
  }
}
