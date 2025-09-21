import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:scavenge_hunt/core/env/env.dart';
import 'api_handler.dart';
import 'dio_interceptors/auth_interceptor.dart';

final apiHandlerProvider = Provider<ApiHandler>((ref) {
  final dio = Dio(
    BaseOptions(
      baseUrl: Env.baseUrl, // "https://api.scavengehunt.com",
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
    ),
  );

  // Add auth interceptor that can access the auth provider
  try {
    dio.interceptors.add(AuthInterceptor(ref));
  } catch (e) {
    // Handle case where auth provider isn't ready yet
    print('Auth interceptor not added: $e');
  }

  return ApiHandler(dio);
});

// Legacy function for backwards compatibility
ApiHandler apiHandler() {
  final dio = Dio(
    BaseOptions(
      baseUrl: Env.baseUrl, // "https://api.scavengehunt.com",
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
    ),
  );
  return ApiHandler(dio);
}
