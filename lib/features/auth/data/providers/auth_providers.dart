import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/network/api_client.dart';
import '../../../../core/providers/shared_prefs_provider.dart';
import '../../logic/auth_notifier.dart';
import '../../logic/auth_state.dart';
import '../datasources/auth_api_service.dart';

final authApiServiceProvider = Provider<AuthApiService>((ref) {
  final apiHandler = ref.read(apiHandlerProvider);
  return AuthApiService(apiHandler);
});

final authNotifierProvider = StateNotifierProvider<AuthNotifier, AuthState>((ref) {
  final authApiService = ref.read(authApiServiceProvider);
  final sharedPreferences = ref.read(sharedPreferencesProvider);
  return AuthNotifier(authApiService, sharedPreferences);
});

// Convenience providers
final isAuthenticatedProvider = Provider<bool>((ref) {
  return ref.watch(authNotifierProvider).isAuthenticated;
});

final isLoadingProvider = Provider<bool>((ref) {
  return ref.watch(authNotifierProvider).isLoading;
});

final currentUserProvider = Provider<String?>((ref) {
  final authState = ref.watch(authNotifierProvider);
  return authState.user?.email;
});
