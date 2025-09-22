import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/network/api_client.dart';
import '../datasources/user_api_service.dart';
import '../models/user_models.dart';

final userApiServiceProvider = Provider<UserApiService>((ref) {
  final apiHandler = ref.read(apiHandlerProvider);
  return UserApiService(apiHandler);
});

final createUserProvider = FutureProvider.autoDispose.family<UserOut, UserCreate>((ref, userCreate) async {
  final userApiService = ref.read(userApiServiceProvider);
  return userApiService.createUser(userCreate);
});

final getUsersProvider = FutureProvider.autoDispose.family<List<UserOut>, ({int limit, int offset})>((ref, params) async {
  final userApiService = ref.read(userApiServiceProvider);
  return userApiService.getUsers(limit: params.limit, offset: params.offset);
});

final getUserByIdProvider = FutureProvider.autoDispose.family<UserOut, String>((ref, userId) async {
  final userApiService = ref.read(userApiServiceProvider);
  return userApiService.getUserById(userId);
});

final updateUserProvider = FutureProvider.autoDispose.family<UserOut, ({String userId, UserUpdate userUpdate})>((ref, params) async {
  final userApiService = ref.read(userApiServiceProvider);
  return userApiService.updateUser(params.userId, params.userUpdate);
});

final deleteUserProvider = FutureProvider.autoDispose.family<void, String>((ref, userId) async {
  final userApiService = ref.read(userApiServiceProvider);
  return userApiService.deleteUser(userId);
});
