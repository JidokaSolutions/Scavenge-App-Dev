import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

import 'app.dart';
import 'core/env/env.dart';
import 'core/logger/sentry_logger.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  const env = String.fromEnvironment("env");
  log("env from dart custom env came out to be: $env");

  Env.setEnv(env.isNotEmpty ? env : EnvType.dev);


  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

  await SentryFlutter.init(
    (options) {
      options.dsn = 'https://33a86ce2a4d3febaefa52cafe4946993@o4509947602862080.ingest.us.sentry.io/4509951176278016';
      // Set tracesSampleRate to 1.0 to capture 100% of transactions for tracing.
      // We recommend adjusting this value in production.
      options.tracesSampleRate = 0.3;
      options.environment = env;

      options.release = "1.0.0";
      options.enablePrintBreadcrumbs = true;
      options.enableMemoryPressureBreadcrumbs = true;
      options.enableNativeCrashHandling = true;
      options.enableLogs = true;

      // you can also configure SENTRY_DSN, SENTRY_RELEASE, SENTRY_DIST, and
      // SENTRY_ENVIRONMENT via Dart environment variable (--dart-define)
    },
    appRunner: () => runApp(
      ProviderScope(
        child: Directionality(
          textDirection: TextDirection.ltr,
          child: Banner(location: BannerLocation.topStart, color: Colors.redAccent, message: Env.appTag, child: const MyApp()),
        ),
      ),
    ),
  );

  // Use Sentry implementation
  logger = MySentryLogger();

  try {
    throw StateError('Sentry Test Exception');
  } catch (exception, stackTrace) {
    await Sentry.captureException(
      exception,
      stackTrace: stackTrace,
    );
  }
}

//! # Run dev
//+ flutter run --flavor dev lib/main_dev.dart
