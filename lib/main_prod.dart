import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'package:shorebird_code_push/shorebird_code_push.dart';

import 'app.dart';
import 'core/env/env.dart';
import 'core/logger/sentry_logger.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  const env = String.fromEnvironment("env");
  log("env from dart custom env came out to be: $env");

  Env.setEnv(env.isNotEmpty ? env : EnvType.prod);

  // Get the current patch number. This will be null if no patch is installed.
  final patch = await ShorebirdUpdater().readCurrentPatch();

  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

  await SentryFlutter.init((options) {
    options.dsn = 'https://33a86ce2a4d3febaefa52cafe4946993@o4509947602862080.ingest.us.sentry.io/4509951176278016';
    // Set tracesSampleRate to 1.0 to capture 100% of transactions for tracing.
    // We recommend adjusting this value in production.
    options.tracesSampleRate = 0.7;
  }, appRunner: () {
    if (patch != null) {
      // Add the patch number as a tag. You can use whatever name you would like
      // as the key. `$patch` will be "null" if there is no patch. You may
      // wish to handle this case differently.
      Sentry.configureScope((scope) {
        scope.setTag('shorebird_patch_number', '${patch.number}');
      });
    }
    return runApp(ProviderScope(child: const MyApp()));
  });


  // Use Sentry implementation
  logger = MySentryLogger();
}

//! # Run prod
//+ flutter run --flavor prod lib/main_prod.dart

//! # Build release artifacts
//+ flutter build appbundle --flavor prod lib/main_prod.dart
//+ flutter build apk --flavor prod lib/main_prod.dart


//! Shorebird
//+ shorebird release android  --artifact apk --target ./lib/main_prod.dart --flavor prod --flutter-version 3.32.8
//+ shorebird release android --artifact apk --target ./lib/main_prod.dart --flavor prod --flutter-version 3.32.8 '--' --dart-define=env="prod"

//+ shorebird patch android  --artifact apk --target ./lib/main_prod.dart --flavor prod --flutter-version 3.32.8
//+ shorebird patch android --artifact apk --target ./lib/main_prod.dart --flavor prod --flutter-version 3.32.8 '--' --dart-define=env="prod"
