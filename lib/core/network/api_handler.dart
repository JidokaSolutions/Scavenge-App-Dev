import 'dart:async';
import 'package:dio/dio.dart';

import '../../app.dart';
import 'dio_interceptors/dio_auth_and_error_interceptor.dart';
import 'dio_interceptors/dio_retry_interceptor.dart';

/// Custom Exception for API Errors
class ApiException implements Exception {
  final String message;
  final int? statusCode;

  ApiException(this.message, {this.statusCode});

  @override
  String toString() => 'ApiException($statusCode): $message';
}

/// A wrapper around Dio to handle base config, errors, and auth.
class ApiHandler {
  final Dio _dio;

  ApiHandler(this._dio) {
    _dio.interceptors.addAll([
      LogInterceptor(requestBody: true, responseBody: true),
      AuthAndErrorInterceptor(_dio, _getAccessToken, _refreshToken),
      RetryInterceptor(dio: _dio, retries: 3, retryDelay: Duration(seconds: 1)),
    ]);
  }

  // Example GET
  Future<T> get<T>(String path, {Map<String, dynamic>? queryParameters, T Function(dynamic data)? parser}) async {
    return _wrapRequest(() => _dio.get(path, queryParameters: queryParameters), parser);
  }

  // Example POST
  Future<T> post<T>(String path, {dynamic body, T Function(dynamic data)? parser}) async {
    return _wrapRequest(() => _dio.post(path, data: body), parser);
  }

  // Error mapper
  ApiException _mapDioError(DioException e, StackTrace stacktrace) {
    if (e.type == DioExceptionType.connectionTimeout) {
      return ApiException("Connection Timeout");
    }
    if (e.type == DioExceptionType.receiveTimeout) {
      return ApiException("Receive Timeout");
    }
    if (e.type == DioExceptionType.badResponse) {
      final status = e.response?.statusCode;
      final msg = e.response?.data.toString() ?? "Unknown error";
      return ApiException(msg, statusCode: status);
    }
    if (e.type == DioExceptionType.connectionError) {
      return ApiException("No internet connection.");
    }
    return ApiException(e.message ?? "Unexpected error");
  }

  // 🔑 Stub: load token from secure storage
  Future<String?> _getAccessToken() async {
    // TODO: implement SecureStorage/SharedPrefs
    return null;
  }

  // 🔄 Stub: refresh token
  Future<bool> _refreshToken() async {
    // TODO: call refresh endpoint, update secure storage
    return false;
  }

  Future<T> _wrapRequest<T>(Future<Response> Function() request, T Function(dynamic data)? parser) async {
    try {
      final response = await request();
      return parser != null ? parser(response.data) : response.data as T;
    } on DioException catch (e, stacktrace) {
      throw _mapDioError(e, stacktrace);
    }
  }
}
