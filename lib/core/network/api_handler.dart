import 'dart:async';
import 'package:dio/dio.dart';

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
      LogInterceptor(
        requestBody: true,
        responseBody: true,
      ),
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          // 🔑 Add token to every request if available
          final token = await _getAccessToken();
          if (token != null) {
            options.headers['Authorization'] = 'Bearer $token';
          }
          handler.next(options);
        },
        onError: (DioException e, handler) async {
          // 🔄 Handle 401 Unauthorized by refreshing token
          if (e.response?.statusCode == 401) {
            final refreshed = await _refreshToken();
            if (refreshed) {
              // retry request
              final opts = e.requestOptions;
              final cloneReq = await _dio.fetch(opts);
              return handler.resolve(cloneReq);
            }
          }
          handler.next(e);
        },
      ),
    ]);
  }

  // Example GET
  Future<T> get<T>(
      String path, {
        Map<String, dynamic>? queryParameters,
        T Function(dynamic data)? parser,
      }) async {
    try {
      final response = await _dio.get(path, queryParameters: queryParameters);
      final data = parser != null ? parser(response.data) : response.data as T;
      return data;
    } on DioException catch (e) {
      throw _mapDioError(e);
    }
  }

  // Example POST
  Future<T> post<T>(
      String path, {
        dynamic body,
        T Function(dynamic data)? parser,
      }) async {
    try {
      final response = await _dio.post(path, data: body);
      final data = parser != null ? parser(response.data) : response.data as T;
      return data;
    } on DioException catch (e) {
      throw _mapDioError(e);
    }
  }

  // Error mapper
  ApiException _mapDioError(DioException e) {
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
}
