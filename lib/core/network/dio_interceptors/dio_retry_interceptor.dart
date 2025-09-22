/* + Retry Interceptor + */
import 'package:dio/dio.dart';

class RetryInterceptor extends Interceptor {
  final Dio dio;
  final int retries;
  final Duration retryDelay;

  RetryInterceptor({
    required this.dio,
    this.retries = 3,
    this.retryDelay = const Duration(seconds: 2),
  });

  @override
  Future<void> onError(DioException err, ErrorInterceptorHandler handler) async {
    // Retry only for network-related errors
    if (_shouldRetry(err)) {
      for (int attempt = 0; attempt < retries; attempt++) {
        await Future.delayed(retryDelay);
        try {
          final response = await dio.fetch(err.requestOptions);
          return handler.resolve(response);
        } catch (e) {
          if (attempt == retries - 1) {
            return handler.next(err); // give up
          }
        }
      }
    }

    // Otherwise, just forward error
    handler.next(err);
  }

  bool _shouldRetry(DioException err) {
    return err.type == DioExceptionType.connectionTimeout || err.type == DioExceptionType.receiveTimeout || err.type == DioExceptionType.connectionError;
  }
}
