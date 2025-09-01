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

  Env.setEnv(env.isNotEmpty ? env : EnvType.prod);

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]).then((value) {
    runApp(ProviderScope(child: const MyApp()));
  });
}

//! # Run prod
//+ flutter run --flavor prod lib/main_prod.dart

//! # Build release artifacts
//+ flutter build appbundle --flavor prod lib/main_prod.dart
//+ flutter build apk --flavor dev lib/main_dev.dart
