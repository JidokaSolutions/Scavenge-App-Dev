import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../features/auth/ui/auth_wrapper.dart';
import '../../features/auth/ui/login.dart';
import '../../features/landing/ui/splash_screen.dart';
import '../../features/landing/ui/get_started.dart';
import '../../features/landing/ui/home.dart';
import '../../features/landing/ui/location_permission.dart';
import '../../features/auth/ui/sign_up/sign_up.dart';
import '../../features/profile/ui/profile.dart';
import '../../features/profile/ui/edit_profile.dart';
import '../../features/friends/ui/view_friends.dart';
import '../../features/friends/ui/add_new_friend.dart';
import '../../features/players/ui/view_player_profile.dart';
import '../../features/leaderboard/ui/leaderboard.dart';
import '../../features/create_your_game/ui/create_your_game.dart';
import '../../features/create_your_game/ui/choose_game_type.dart';
import '../../features/create_your_game/ui/choose_play_mode.dart';
import '../../features/create_your_game/ui/choose_race_type.dart';
import '../../features/create_your_game/ui/invite_friends.dart';
import '../../features/create_your_game/ui/waiting_for_players.dart';
import '../../features/create_your_game/ui/waiting_for_other_votes.dart';
import '../../features/create_your_game/ui/chat_with_friends.dart';
import '../../features/join_game/ui/join_game.dart';
import '../../features/hunts/ui/completed_hunts.dart';
import '../../features/hunts/ui/completed_hunt_details.dart';
import '../../features/hunts/ui/completed_tasks.dart';
import '../../features/hunts/ui/completed_task_details.dart';
import '../../features/hunts/ui/team_flash.dart';
// Location page import temporarily removed - needs to be fixed

class AppRoutes {
  static const String initial = '/';
  static const String splash = '/splash';
  static const String auth = '/auth';
  static const String login = '/login';
  static const String signUp = '/signup';
  static const String getStarted = '/get-started';
  static const String home = '/home';
  static const String locationPermission = '/location-permission';
  static const String profile = '/profile';
  static const String editProfile = '/edit-profile';
  static const String friends = '/friends';
  static const String addFriend = '/add-friend';
  static const String playerProfile = '/player-profile';
  static const String leaderboard = '/leaderboard';
  static const String createGame = '/create-game';
  static const String chooseGameType = '/choose-game-type';
  static const String choosePlayMode = '/choose-play-mode';
  static const String chooseRaceType = '/choose-race-type';
  static const String inviteFriends = '/invite-friends';
  static const String waitingForPlayers = '/waiting-for-players';
  static const String waitingForVotes = '/waiting-for-votes';
  static const String chatWithFriends = '/chat-with-friends';
  static const String joinGame = '/join-game';
  static const String completedHunts = '/completed-hunts';
  static const String completedHuntDetails = '/completed-hunt-details';
  static const String completedTasks = '/completed-tasks';
  static const String completedTaskDetails = '/completed-task-details';
  static const String teamFlash = '/team-flash';
  static const String location = '/location';
}

final goRouterProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    initialLocation: AppRoutes.initial,
    routes: [
      GoRoute(
        path: AppRoutes.initial,
        builder: (context, state) => const AuthWrapper(),
      ),
      GoRoute(
        path: AppRoutes.splash,
        builder: (context, state) => SplashScreen(),
      ),
      GoRoute(
        path: AppRoutes.login,
        builder: (context, state) => const Login(),
      ),
      GoRoute(
        path: AppRoutes.signUp,
        builder: (context, state) => const SignUp(),
      ),
      GoRoute(
        path: AppRoutes.getStarted,
        builder: (context, state) => const GetStarted(),
      ),
      GoRoute(
        path: AppRoutes.home,
        builder: (context, state) => const Home(),
      ),
      GoRoute(
        path: AppRoutes.locationPermission,
        builder: (context, state) => const LocationPermission(),
      ),
      GoRoute(
        path: AppRoutes.profile,
        builder: (context, state) => const Profile(),
      ),
      GoRoute(
        path: AppRoutes.editProfile,
        builder: (context, state) => const EditProfile(),
      ),
      GoRoute(
        path: AppRoutes.friends,
        builder: (context, state) => const ViewFriends(),
      ),
      GoRoute(
        path: AppRoutes.addFriend,
        builder: (context, state) => const AddNewFriend(),
      ),
      GoRoute(
        path: '${AppRoutes.playerProfile}/:playerId',
        builder: (context, state) {
          return const ViewPlayerProfile();
        },
      ),
      GoRoute(
        path: AppRoutes.leaderboard,
        builder: (context, state) => const Leaderboard(),
      ),
      GoRoute(
        path: AppRoutes.createGame,
        builder: (context, state) => const CreateYourGame(),
      ),
      GoRoute(
        path: AppRoutes.chooseGameType,
        builder: (context, state) => const ChooseGameType(),
      ),
      GoRoute(
        path: AppRoutes.choosePlayMode,
        builder: (context, state) => const ChoosePlayMode(),
      ),
      GoRoute(
        path: AppRoutes.chooseRaceType,
        builder: (context, state) => const ChooseRaceType(),
      ),
      GoRoute(
        path: AppRoutes.inviteFriends,
        builder: (context, state) => const InviteFriends(),
      ),
      GoRoute(
        path: AppRoutes.waitingForPlayers,
        builder: (context, state) => const WaitingForPlayers(),
      ),
      GoRoute(
        path: AppRoutes.waitingForVotes,
        builder: (context, state) => const WaitingForOtherVotes(),
      ),
      GoRoute(
        path: AppRoutes.chatWithFriends,
        builder: (context, state) => const ChatWithFriends(),
      ),
      GoRoute(
        path: AppRoutes.joinGame,
        builder: (context, state) => const JoinGame(),
      ),
      GoRoute(
        path: AppRoutes.completedHunts,
        builder: (context, state) => const CompletedHunts(),
      ),
      GoRoute(
        path: '${AppRoutes.completedHuntDetails}/:huntId',
        builder: (context, state) {
          return const CompletedHuntDetails();
        },
      ),
      GoRoute(
        path: AppRoutes.completedTasks,
        builder: (context, state) => const CompletedTasks(),
      ),
      GoRoute(
        path: '${AppRoutes.completedTaskDetails}/:taskId',
        builder: (context, state) {
          return const CompletedTaskDetails();
        },
      ),
      GoRoute(
        path: AppRoutes.teamFlash,
        builder: (context, state) => const TeamFlash(),
      ),
      // TODO: Fix LocationPage import and route
      // GoRoute(
      //   path: AppRoutes.location,
      //   builder: (context, state) => const LocationWidget(),
      // ),
    ],
    errorBuilder: (context, state) => Scaffold(
      body: Center(
        child: Text('Page not found: ${state.uri}'),
      ),
    ),
  );
});
