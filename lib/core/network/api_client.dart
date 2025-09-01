import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:scavenge_hunt/core/env/env.dart';
import 'api_handler.dart';

part 'api_client.g.dart';

@riverpod
ApiHandler apiHandler(Ref ref) {
  final dio = Dio(
    BaseOptions(
      baseUrl: Env.baseUrl, // "https://api.scavengehunt.com",
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
    ),
  );
  return ApiHandler(dio);
}
