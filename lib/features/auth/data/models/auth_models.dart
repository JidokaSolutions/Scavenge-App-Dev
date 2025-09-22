class LoginRequest {
  final String email;
  final String password;

  LoginRequest({
    required this.email,
    required this.password,
  });

  Map<String, dynamic> toJson() => {
        'email': email,
        'password': password,
      };
}

class RegisterRequest {
  final String firstname;
  final String lastname;
  final String email;
  final String password;
  final String? dob;
  final String? phone;

  RegisterRequest({
    required this.firstname,
    required this.lastname,
    required this.email,
    required this.password,
    this.dob,
    this.phone,
  });

  Map<String, dynamic> toJson() => {
        'firstname': firstname,
        'lastname': lastname,
        'email': email,
        'password': password,
        if (dob != null) 'dob': dob,
        if (phone != null) 'phone': phone,
        'access': 'user',
      };
}

class AuthResponse {
  final String accessToken;
  final String refreshToken;
  final String userId;
  final String email;
  final String firstname;
  final String lastname;

  AuthResponse({
    required this.accessToken,
    required this.refreshToken,
    required this.userId,
    required this.email,
    required this.firstname,
    required this.lastname,
  });

  factory AuthResponse.fromJson(Map<String, dynamic> json) => AuthResponse(
        accessToken: json['access_token'] ?? "",
        refreshToken: json['refresh_token'] ?? "",
        userId: json['user_id'],
        email: json['email'],
        firstname: json['firstname'],
        lastname: json['lastname'],
      );

  Map<String, dynamic> toJson() => {
        'access_token': accessToken,
        'refresh_token': refreshToken,
        'user_id': userId,
        'email': email,
        'firstname': firstname,
        'lastname': lastname,
      };
}

class RefreshTokenRequest {
  final String refreshToken;

  RefreshTokenRequest({required this.refreshToken});

  Map<String, dynamic> toJson() => {
        'refresh_token': refreshToken,
      };
}

class RefreshTokenResponse {
  final String accessToken;
  final String refreshToken;

  RefreshTokenResponse({
    required this.accessToken,
    required this.refreshToken,
  });

  factory RefreshTokenResponse.fromJson(Map<String, dynamic> json) => RefreshTokenResponse(
        accessToken: json['access_token'],
        refreshToken: json['refresh_token'],
      );
}
