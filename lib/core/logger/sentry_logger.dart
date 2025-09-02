// sentry_logger.dart
import 'package:sentry_flutter/sentry_flutter.dart';
import 'logger.dart';

class MySentryLogger implements AppLogger {
  @override
  void breadCrumb(String message, {Map<String, dynamic>? context}) {
    Sentry.addBreadcrumb(Breadcrumb(message: message, data: context, level: SentryLevel.info));
  }

  @override
  void warn(String message, {Map<String, dynamic>? context}) {
    Sentry.addBreadcrumb(Breadcrumb(message: message, data: context, level: SentryLevel.warning));
  }

  @override
  void error(dynamic exception, {StackTrace? stackTrace, Map<String, dynamic>? context}) {
    Sentry.captureException(
      exception,
      stackTrace: stackTrace,
      withScope: (scope) {
        if (context != null) scope.setContexts('extra', context);
      },
    );
  }

  @override
  void fatal(dynamic exception, {StackTrace? stackTrace, Map<String, dynamic>? context}) {
    Sentry.captureException(
      exception,
      stackTrace: stackTrace,
      withScope: (scope) {
        scope.level = SentryLevel.fatal;
        if (context != null) scope.setContexts('extra', context);
      },
    );
  }

  @override
  Future<void> captureMessage(String message, {LogLevel level = LogLevel.info, Map<String, dynamic>? context}) async {
    final sentryLevel = _mapLogLevel(level);
    await Sentry.captureMessage(
      message,
      level: sentryLevel,
      withScope: (scope) {
        if (context != null) scope.setContexts("extra", context);
      },
    );
  }

  @override
  Future<void> captureEvent(LogEvent event) async {
    final sentryEvent = SentryEvent(message: SentryMessage(event.message), level: _mapLogLevel(event.level), extra: event.context);
    await Sentry.captureEvent(sentryEvent);
  }

  SentryLevel _mapLogLevel(LogLevel level) {
    switch (level) {
      case LogLevel.debug:
        return SentryLevel.debug;
      case LogLevel.info:
        return SentryLevel.info;
      case LogLevel.warning:
        return SentryLevel.warning;
      case LogLevel.error:
        return SentryLevel.error;
      case LogLevel.fatal:
        return SentryLevel.fatal;
    }
  }
}
