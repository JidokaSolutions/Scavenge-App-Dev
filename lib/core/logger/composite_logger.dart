import 'logger.dart';

class CompositeLogger implements AppLogger {
  final List<AppLogger> _loggers;

  CompositeLogger(this._loggers);

  @override
  void breadCrumb(String message, {Map<String, dynamic>? context}) {
    for (final l in _loggers) {
      l.breadCrumb(message, context: context);
    }
  }

  @override
  void warn(String message, {Map<String, dynamic>? context}) {
    for (final l in _loggers) {
      l.warn(message, context: context);
    }
  }

  @override
  void error(dynamic exception, {StackTrace? stackTrace, Map<String, dynamic>? context}) {
    for (final l in _loggers) {
      l.error(exception, stackTrace: stackTrace, context: context);
    }
  }

  @override
  void fatal(dynamic exception, {StackTrace? stackTrace, Map<String, dynamic>? context}) {
    for (final l in _loggers) {
      l.fatal(exception, stackTrace: stackTrace, context: context);
    }
  }

  @override
  Future<void> captureMessage(String message, {LogLevel level = LogLevel.info, Map<String, dynamic>? context}) async {
    for (final l in _loggers) {
      await l.captureMessage(message, level: level, context: context);
    }
  }

  @override
  Future<void> captureEvent(LogEvent event) async {
    for (final l in _loggers) {
      await l.captureEvent(event);
    }
  }
}
