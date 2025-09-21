import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:scavenge_hunt/features/friends/data/models/friend_models.dart';
import '../../../../core/network/api_client.dart';
import '../../../auth/data/models/user_models.dart';
import '../datasources/friends_api_service.dart';

final friendsApiServiceProvider = Provider<FriendsApiService>((ref) {
  final apiHandler = ref.read(apiHandlerProvider);
  return FriendsApiService(apiHandler);
});

final addFriendProvider = FutureProvider.autoDispose.family<void, ({String userId, String friendId})>((ref, params) async {
  final friendsApiService = ref.read(friendsApiServiceProvider);
  return friendsApiService.addFriend(params.userId, params.friendId);
});

final removeFriendProvider = FutureProvider.autoDispose.family<void, ({String userId, String friendId})>((ref, params) async {
  final friendsApiService = ref.read(friendsApiServiceProvider);
  return friendsApiService.removeFriend(params.userId, params.friendId);
});

final getUserFriendsProvider = FutureProvider.autoDispose.family<List<FriendOut>, String>((ref, userId) async {
  final friendsApiService = ref.read(friendsApiServiceProvider);
  return friendsApiService.getUserFriends(userId);
});