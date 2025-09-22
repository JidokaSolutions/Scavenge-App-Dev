import '../../../../core/network/api_handler.dart';
import '../../../../core/network/endpoints.dart';
import '../models/user_models.dart';

class UserApiService {
  final ApiHandler _apiHandler;

  UserApiService(this._apiHandler);

  Future<UserOut> createUser(UserCreate userCreate) async {
    return _apiHandler.post<UserOut>(
      Endpoints.users,
      body: userCreate.toJson(),
      parser: (data) => UserOut.fromJson(data),
    );
  }

  Future<List<UserOut>> getUsers({int limit = 50, int offset = 0}) async {
    return _apiHandler.get<List<UserOut>>(
      Endpoints.users,
      queryParameters: {'limit': limit, 'offset': offset},
      parser: (data) => (data as List).map((e) => UserOut.fromJson(e)).toList(),
    );
  }

  Future<UserOut> getUserById(String userId) async {
    final endpoint = Endpoints.userById.replaceAll('{user_id}', userId);
    return _apiHandler.get<UserOut>(
      endpoint,
      parser: (data) => UserOut.fromJson(data),
    );
  }

  Future<UserOut> updateUser(String userId, UserUpdate userUpdate) async {
    final endpoint = Endpoints.userById.replaceAll('{user_id}', userId);
    return _apiHandler.patch<UserOut>(
      endpoint,
      body: userUpdate.toJson(),
      parser: (data) => UserOut.fromJson(data),
    );
  }

  Future<void> deleteUser(String userId) async {
    final endpoint = Endpoints.userById.replaceAll('{user_id}', userId);
    return _apiHandler.delete<void>(endpoint);
  }
}
