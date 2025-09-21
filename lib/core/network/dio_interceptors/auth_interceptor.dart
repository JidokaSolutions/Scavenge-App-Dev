// import 'package:dio/dio.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import '../../../features/auth/data/providers/auth_providers.dart';
//
// class AuthInterceptor extends Interceptor {
//   final Ref _ref;
//
//   AuthInterceptor(this._ref);
//
//   @override
//   void onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
//     // Skip auth for auth endpoints
//     if (_isAuthEndpoint(options.path)) {
//       handler.next(options);
//       return;
//     }
//
//     try {
//       final authNotifier = _ref.read(authNotifierProvider.notifier);
//       final token = await authNotifier.getAccessToken();
//
//       if (token != null && token.isNotEmpty) {
//         options.headers['Authorization'] = 'Bearer $token';
//       }
//     } catch (e) {
//       // Log error but don't block request - auth provider might not be initialized yet
//       print('Error adding auth token: $e');
//     }
//
//     handler.next(options);
//   }
//
//   @override
//   void onError(DioException err, ErrorInterceptorHandler handler) async {
//     // Handle 401 unauthorized responses
//     if (err.response?.statusCode == 401 && !_isAuthEndpoint(err.requestOptions.path)) {
//       try {
//         final authNotifier = _ref.read(authNotifierProvider.notifier);
//         final refreshSuccess = await authNotifier.refreshAccessToken();
//
//         if (refreshSuccess) {
//           // Retry the original request with new token
//           final token = await authNotifier.getAccessToken();
//           if (token != null && token.isNotEmpty) {
//             err.requestOptions.headers['Authorization'] = 'Bearer $token';
//
//             final dio = Dio();
//             final response = await dio.fetch(err.requestOptions);
//             handler.resolve(response);
//             return;
//           }
//         }
//       } catch (e) {
//         // Refresh failed, let the error pass through
//         print('Token refresh failed: $e');
//       }
//     }
//
//     handler.next(err);
//   }
//
//   bool _isAuthEndpoint(String path) {
//     return path.contains('/auth/') ||
//            path.contains('/login') ||
//            path.contains('/register') ||
//            path.contains('/refresh');
//   }
// }