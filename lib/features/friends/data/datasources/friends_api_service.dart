import '../../../../core/network/api_handler.dart';
import '../../../../core/network/endpoints.dart';
import '../models/friend_models.dart';

class FriendsApiService {
  final ApiHandler _apiHandler;

  FriendsApiService(this._apiHandler);

  Future<void> addFriend(String userId, String friendId) async {
    final endpoint = Endpoints.addRemoveFriend.replaceAll('{user_id}', userId).replaceAll('{friend_id}', friendId);
    return _apiHandler.post<void>(endpoint);
  }

  Future<void> removeFriend(String userId, String friendId) async {
    final endpoint = Endpoints.addRemoveFriend.replaceAll('{user_id}', userId).replaceAll('{friend_id}', friendId);
    return _apiHandler.delete<void>(endpoint);
  }

  Future<List<FriendOut>> getUserFriends(String userId) async {
    final endpoint = Endpoints.userFriends.replaceAll('{user_id}', userId);
    return _apiHandler.get<List<FriendOut>>(
      endpoint,
      parser: (data) => (data as List).map((e) => FriendOut.fromJson(e)).toList(),
    );
  }
}
