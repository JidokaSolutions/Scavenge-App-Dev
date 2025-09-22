import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../features/auth/ui/auth_wrapper.dart';
import '../../features/auth/ui/forgot_pass/create_new_pass.dart';
// Auth pages
import '../../features/auth/ui/forgot_pass/forgot_pass.dart';
import '../../features/auth/ui/forgot_pass/otp_verification.dart';
import '../../features/auth/ui/login.dart';
import '../../features/auth/ui/sign_up/sign_up.dart';
import '../../features/create_your_game/ui/chat_with_friends.dart';
import '../../features/create_your_game/ui/choose_game_type.dart';
import '../../features/create_your_game/ui/choose_play_mode.dart';
import '../../features/create_your_game/ui/choose_race_type.dart';
import '../../features/create_your_game/ui/create_your_game.dart';
import '../../features/create_your_game/ui/invite_friends.dart';
// Solo game pages
import '../../features/create_your_game/ui/solo/solo_exploring_hunt.dart';
import '../../features/create_your_game/ui/solo/solo_game_checklist.dart';
import '../../features/create_your_game/ui/solo/solo_hunt_details.dart';
import '../../features/create_your_game/ui/solo/solo_racing_hunt_details.dart';
import '../../features/create_your_game/ui/solo/solo_time_base_hunt.dart';
import '../../features/create_your_game/ui/voting/judge_base_voting.dart';
// Voting pages
import '../../features/create_your_game/ui/voting/time_base_voting.dart';
import '../../features/create_your_game/ui/waiting_for_other_votes.dart';
import '../../features/create_your_game/ui/waiting_for_players.dart';
import '../../features/create_your_game/ui/with_friends/check_evidence_accuracy.dart';
import '../../features/create_your_game/ui/with_friends/game_task_details.dart';
import '../../features/create_your_game/ui/with_friends/team_member_details.dart';
import '../../features/create_your_game/ui/with_friends/upload_evidence.dart';
import '../../features/create_your_game/ui/with_friends/view_team_progress.dart';
// With friends game pages
import '../../features/create_your_game/ui/with_friends/with_friends.dart';
import '../../features/friends/ui/add_new_friend.dart';
import '../../features/friends/ui/view_friends.dart';
import '../../features/hunts/ui/completed_hunt_details.dart';
import '../../features/hunts/ui/completed_hunts.dart';
import '../../features/hunts/ui/completed_task_details.dart';
import '../../features/hunts/ui/completed_tasks.dart';
import '../../features/hunts/ui/team_flash.dart';
import '../../features/join_game/ui/join_game.dart';
import '../../features/landing/ui/get_started.dart';
import '../../features/landing/ui/home.dart';
import '../widgets/dialogs/location_permission.dart';
import '../../features/landing/ui/splash_screen.dart';
import '../../features/leaderboard/ui/leaderboard.dart';
import '../../features/players/ui/view_player_profile.dart';
import '../../features/profile/ui/edit_profile.dart';
import '../../features/profile/ui/profile.dart';
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

  // Auth routes
  static const String forgotPassword = '/forgot-password';
  static const String otpVerification = '/otp-verification';
  static const String createNewPassword = '/create-new-password';

  // Solo game routes
  static const String soloExploringHunt = '/solo-exploring-hunt';
  static const String soloTimeBaseHunt = '/solo-time-base-hunt';
  static const String soloHuntDetails = '/solo-hunt-details';
  static const String soloGameCheckList = '/solo-game-checklist';
  static const String soloRacingHuntDetails = '/solo-racing-hunt-details';

  // With friends game routes
  static const String withFriends = '/with-friends';
  static const String viewTeamProgress = '/view-team-progress';
  static const String gameTaskDetails = '/game-task-details';
  static const String uploadEvidence = '/upload-evidence';
  static const String checkEvidenceAccuracy = '/check-evidence-accuracy';
  static const String teamMemberDetails = '/team-member-details';

  // Voting routes
  static const String timeBaseVoting = '/time-base-voting';
  static const String judgeBaseVoting = '/judge-base-voting';
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
        builder: (context, state) => const LocationPermissionDialogWidget(),
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
      // Auth routes
      GoRoute(
        path: AppRoutes.forgotPassword,
        builder: (context, state) => const ForgotPassword(),
      ),
      GoRoute(
        path: AppRoutes.otpVerification,
        builder: (context, state) => const OTPVerification(),
      ),
      GoRoute(
        path: AppRoutes.createNewPassword,
        builder: (context, state) => const CreateNewPassword(),
      ),
      // Solo game routes
      GoRoute(
        path: AppRoutes.soloExploringHunt,
        builder: (context, state) => const SoloExploringHunt(),
      ),
      GoRoute(
        path: AppRoutes.soloTimeBaseHunt,
        builder: (context, state) => const SoloTimeBaseHunt(),
      ),
      GoRoute(
        path: AppRoutes.soloHuntDetails,
        builder: (context, state) => const SoloHuntDetails(),
      ),
      GoRoute(
        path: AppRoutes.soloGameCheckList,
        builder: (context, state) => const SoloGameCheckList(),
      ),
      GoRoute(
        path: AppRoutes.soloRacingHuntDetails,
        builder: (context, state) => const SoloRacingHuntDetails(),
      ),
      // With friends game routes
      GoRoute(
        path: AppRoutes.withFriends,
        builder: (context, state) => const WithFriends(),
      ),
      GoRoute(
        path: AppRoutes.viewTeamProgress,
        builder: (context, state) => const ViewTeamProgress(),
      ),
      GoRoute(
        path: AppRoutes.gameTaskDetails,
        builder: (context, state) => const GameTaskDetails(),
      ),
      GoRoute(
        path: AppRoutes.uploadEvidence,
        builder: (context, state) => const UploadEvidence(),
      ),
      GoRoute(
        path: AppRoutes.checkEvidenceAccuracy,
        builder: (context, state) => CheckEvidenceAccuracy(),
      ),
      GoRoute(
        path: AppRoutes.teamMemberDetails,
        builder: (context, state) => const TeamMemberDetails(),
      ),
      // Voting routes
      GoRoute(
        path: AppRoutes.timeBaseVoting,
        builder: (context, state) => TimeBaseVoting(),
      ),
      GoRoute(
        path: AppRoutes.judgeBaseVoting,
        builder: (context, state) => JudgeBaseVoting(),
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
