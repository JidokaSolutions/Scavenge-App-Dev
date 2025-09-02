import 'package:dio/dio.dart';

import '../../../app.dart';

/* + Auth & Error Interceptor + */
class AuthAndErrorInterceptor extends Interceptor {
  final Dio dio;
  final Future<String?> Function() _getAccessToken;
  final Future<bool> Function() _refreshToken;

  AuthAndErrorInterceptor(this.dio, this._getAccessToken, this._refreshToken);

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    final token = await _getAccessToken();
    if (token != null) {
      options.headers['Authorization'] = 'Bearer $token';
    }
    handler.next(options);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    // 🔄 Handle 401
    if (err.response?.statusCode == 401) {
      final refreshed = await _refreshToken();
      if (refreshed) {
        final cloneReq = err.requestOptions.copyWith();
        final newResponse = await dio.fetch(cloneReq);
        return handler.resolve(newResponse);
      }
    }

    logger.breadCrumb("Error in dio call:");
    // 📡 Log error
    logger.error(
      err,
      stackTrace: err.stackTrace,
      context: {"url": err.requestOptions.uri.toString(), "method": err.requestOptions.method, "data": err.requestOptions.data},
    );

    // // Optionally map error → user-friendly message
    // final message = _mapToMessage(err);
    // // Maybe even show a toast/snackbar

    handler.next(err);
  }

  // @override
  // void onError(DioException err, ErrorInterceptorHandler handler) {
  //   logger.error(err, stackTrace: err.stackTrace, context: {
  //     "url": err.requestOptions.uri.toString(),
  //     "method": err.requestOptions.method,
  //     "data": err.requestOptions.data,
  //   });
  //
  //   // Optionally map error → user-friendly message
  //   final message = _mapToMessage(err);
  //   // Maybe even show a toast/snackbar
  //
  //   super.onError(err, handler);
  // }

  String _mapToMessage(DioException err) {
    switch (err.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.receiveTimeout:
        return "Connection timed out. Please try again.";
      case DioExceptionType.badResponse:
        return "Server returned an error.";
      case DioExceptionType.connectionError:
        return "No internet connection.";
      default:
        return "Unexpected error occurred.";
    }
  }
}
