import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../app.dart';
import '../data/datasources/auth_api_service.dart';
import '../data/models/auth_models.dart';
import 'auth_state.dart';

class AuthNotifier extends StateNotifier<AuthState> {
  final AuthApiService _authApiService;
  final SharedPreferences _prefs;

  AuthNotifier(this._authApiService, this._prefs) : super(const AuthState()) {
    _loadStoredAuth();
  }

  static const String _accessTokenKey = 'access_token';
  static const String _refreshTokenKey = 'refresh_token';
  static const String _userDataKey = 'user_data';

  Future<void> _loadStoredAuth() async {
    try {
      final accessToken = _prefs.getString(_accessTokenKey);
      final refreshToken = _prefs.getString(_refreshTokenKey);
      final userData = _prefs.getString(_userDataKey);

      if (accessToken != null && refreshToken != null && userData != null) {
        try {
          // Parse user data and set authenticated state
          final userMap = json.decode(userData) as Map<String, dynamic>;
          final authResponse = AuthResponse.fromJson(userMap);

          state = state.copyWith(
            status: AuthStatus.authenticated,
            user: authResponse,
          );
        } catch (e) {
          logger.error('Error parsing stored user data: $e');
          state = state.copyWith(status: AuthStatus.unauthenticated);
        }
      } else {
        state = state.copyWith(status: AuthStatus.unauthenticated);
      }
    } catch (e) {
      logger.error('Error loading stored auth: $e');
      state = state.copyWith(status: AuthStatus.unauthenticated);
    }
  }

  Future<void> login(String email, String password) async {
    state = state.copyWith(status: AuthStatus.loading);

    try {
      final loginRequest = LoginRequest(email: email, password: password);
      // final authResponse = await _authApiService.login(loginRequest);

      // await _storeAuthData(authResponse);

      state = state.copyWith(
        status: AuthStatus.authenticated,
        // user: authResponse,
        errorMessage: null,
      );
    } catch (e) {
      logger.error('Login error: $e');
      state = state.copyWith(
        status: AuthStatus.error,
        errorMessage: e.toString(),
      );
    }
  }

  Future<void> register({
    required String firstname,
    required String lastname,
    required String email,
    required String password,
    String? dob,
    String? phone,
  }) async {
    state = state.copyWith(status: AuthStatus.loading);

    try {
      final registerRequest = RegisterRequest(
        firstname: firstname,
        lastname: lastname,
        email: email,
        password: password,
        dob: dob,
        phone: phone,
      );

      // Register user (creates user, returns UserOut)
      await _authApiService.register(registerRequest);

      // Registration successful - set state to show success
      state = state.copyWith(
        status: AuthStatus.registrationSuccess,
        errorMessage: null,
      );

    } catch (e) {
      logger.error('Registration error: $e');
      state = state.copyWith(
        status: AuthStatus.error,
        errorMessage: e.toString(),
      );
    }
  }

  Future<void> logout() async {
    try {
      await _authApiService.logout();
    } catch (e) {
      logger.error('Logout API error: $e');
      // Continue with local logout even if API call fails
    }

    await _clearAuthData();
    state = state.copyWith(
      status: AuthStatus.unauthenticated,
      user: null,
      errorMessage: null,
    );
  }

  Future<String?> getAccessToken() async {
    return _prefs.getString(_accessTokenKey);
  }

  // Future<bool> refreshAccessToken() async {
  //   try {
  //     final refreshToken = _prefs.getString(_refreshTokenKey);
  //     if (refreshToken == null) return false;
  //
  //     final refreshRequest = RefreshTokenRequest(refreshToken: refreshToken);
  //     final refreshResponse = await _authApiService.refreshToken(refreshRequest);
  //
  //     await _prefs.setString(_accessTokenKey, refreshResponse.accessToken);
  //     await _prefs.setString(_refreshTokenKey, refreshResponse.refreshToken);
  //
  //     return true;
  //   } catch (e) {
  //     logger.error('Token refresh error: $e');
  //     await logout(); // Force logout if refresh fails
  //     return false;
  //   }
  // }

  Future<void> _storeAuthData(AuthResponse authResponse) async {
    await _prefs.setString(_accessTokenKey, authResponse.accessToken);
    await _prefs.setString(_refreshTokenKey, authResponse.refreshToken);
    await _prefs.setString(_userDataKey, json.encode(authResponse.toJson()));
  }

  Future<void> _clearAuthData() async {
    await _prefs.remove(_accessTokenKey);
    await _prefs.remove(_refreshTokenKey);
    await _prefs.remove(_userDataKey);
  }

  void clearError() {
    state = state.copyWith(
      status: state.status == AuthStatus.error ? AuthStatus.unauthenticated : state.status,
      errorMessage: null,
    );
  }
}