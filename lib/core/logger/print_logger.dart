import 'package:logger/logger.dart' hide LogEvent;

import 'logger.dart';

class PrintLogger implements AppLogger {
  final Logger _logger = Logger(
    printer: PrettyPrinter(
      methodCount: 2, // number of method calls to show
      errorMethodCount: 5, // number of method calls if stacktrace is provided
      lineLength: 100, // width of the output
      colors: true, // color output
      printEmojis: true, // print emojis for levels
      printTime: true, // include timestamp
    ),
  );

  @override
  void breadCrumb(String message, {Map<String, dynamic>? context}) {
    _logger.d(_format(message, context));
  }

  @override
  void warn(String message, {Map<String, dynamic>? context}) {
    _logger.w(_format(message, context));
  }

  @override
  void error(dynamic exception,
      {StackTrace? stackTrace, Map<String, dynamic>? context}) {
    _logger.e(_format(exception.toString(), context), error: exception, stackTrace: stackTrace);
  }

  @override
  void fatal(dynamic exception,
      {StackTrace? stackTrace, Map<String, dynamic>? context}) {
    // fatal isn’t a separate level in logger, so map it to error
    _logger.wtf(_format(exception.toString(), context), error: exception, stackTrace: stackTrace);
  }

  @override
  Future<void> captureMessage(String message,
      {LogLevel level = LogLevel.info, Map<String, dynamic>? context}) async {
    switch (level) {
      case LogLevel.debug:
        _logger.d(_format(message, context));
        break;
      case LogLevel.info:
        _logger.i(_format(message, context));
        break;
      case LogLevel.warning:
        _logger.w(_format(message, context));
        break;
      case LogLevel.error:
        _logger.e(_format(message, context));
        break;
      case LogLevel.fatal:
        _logger.wtf(_format(message, context));
        break;
    }
  }

  @override
  Future<void> captureEvent(LogEvent event) async {
    await captureMessage(
      event.message,
      level: event.level,
      context: event.context,
    );
  }

  String _format(String message, Map<String, dynamic>? context) {
    if (context == null || context.isEmpty) return message;
    return '$message | context: $context';
  }
}
