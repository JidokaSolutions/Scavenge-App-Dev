import '../../../../core/network/api_handler.dart';
import '../../../../core/network/endpoints.dart';
import '../models/auth_models.dart';
import '../models/user_models.dart';

class AuthApiService {
  final ApiHandler _apiHandler;

  AuthApiService(this._apiHandler);

  Future<AuthResponse> login(LoginRequest loginRequest) async {
    return _apiHandler.post<AuthResponse>(
      Endpoints.login,
      body: loginRequest.toJson(),
      parser: (data) => AuthResponse.fromJson(data),
    );
  }

  Future<UserOut> register(RegisterRequest registerRequest) async {
    return _apiHandler.post<UserOut>(
      Endpoints.register,
      body: registerRequest.toJson(),
      parser: (data) => UserOut.fromJson(data),
    );
  }

  // Future<RefreshTokenResponse> refreshToken(RefreshTokenRequest refreshRequest) async {
  //   return _apiHandler.post<RefreshTokenResponse>(
  //     Endpoints.refreshToken,
  //     body: refreshRequest.toJson(),
  //     parser: (data) => RefreshTokenResponse.fromJson(data),
  //   );
  // }

  Future<void> logout() async {
    return;
    // return _apiHandler.post<void>(Endpoints.logout);
  }
}
