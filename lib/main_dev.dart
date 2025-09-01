import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'app.dart';
import 'core/env/env.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  const env = String.fromEnvironment("env");
  log("env from dart custom env came out to be: $env");

  Env.setEnv(env.isNotEmpty ? env : EnvType.dev);

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]).then((value) {
    runApp(
      ProviderScope(
        child: Directionality(
          textDirection: TextDirection.ltr,
          child: Banner(location: BannerLocation.topStart, color: Colors.redAccent, message: Env.appTag, child: const MyApp()),
        ),
      ),
    );
  });
}

//! # Run dev
//+ flutter run --flavor dev lib/main_dev.dart

