// logger.dart
abstract class AppLogger {
  /// Capture a normal log/trace/debug message
  void breadCrumb(String message, {Map<String, dynamic>? context});

  /// Capture a warning
  void warn(String message, {Map<String, dynamic>? context});

  /// Capture an error/exception with optional stack trace
  void error(dynamic exception, {StackTrace? stackTrace, Map<String, dynamic>? context});

  /// Capture a fatal crash
  void fatal(dynamic exception, {StackTrace? stackTrace, Map<String, dynamic>? context});

  /// Capture a custom message (like Sentry's captureMessage)

  Future<void> captureMessage(String message, {LogLevel level = LogLevel.info, Map<String, dynamic>? context});

  /// Capture a full custom event (like SentryEvent)
  Future<void> captureEvent(LogEvent event);
}

// logger_event.dart
enum LogLevel { debug, info, warning, error, fatal }

class LogEvent {
  final String message;
  final LogLevel level;
  final Map<String, dynamic>? context;

  LogEvent({required this.message, this.level = LogLevel.info, this.context});
}
