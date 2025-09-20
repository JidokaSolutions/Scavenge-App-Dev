import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'routes.dart';

class AppNavigation {
  static void goToSplash(BuildContext context) {
    context.go(AppRoutes.splash);
  }

  static void goToLogin(BuildContext context) {
    context.go(AppRoutes.login);
  }

  static void goToSignUp(BuildContext context) {
    context.go(AppRoutes.signUp);
  }

  static void goToGetStarted(BuildContext context) {
    context.go(AppRoutes.getStarted);
  }

  static void goToHome(BuildContext context) {
    context.go(AppRoutes.home);
  }

  static void goToLocationPermission(BuildContext context) {
    context.go(AppRoutes.locationPermission);
  }

  static void goToProfile(BuildContext context) {
    context.go(AppRoutes.profile);
  }

  static void goToEditProfile(BuildContext context) {
    context.go(AppRoutes.editProfile);
  }

  static void goToFriends(BuildContext context) {
    context.go(AppRoutes.friends);
  }

  static void goToAddFriend(BuildContext context) {
    context.go(AppRoutes.addFriend);
  }

  static void goToPlayerProfile(BuildContext context, String playerId) {
    context.go('${AppRoutes.playerProfile}/$playerId');
  }

  static void goToLeaderboard(BuildContext context) {
    context.go(AppRoutes.leaderboard);
  }

  static void goToCreateGame(BuildContext context) {
    context.go(AppRoutes.createGame);
  }

  static void goToChooseGameType(BuildContext context) {
    context.go(AppRoutes.chooseGameType);
  }

  static void goToChoosePlayMode(BuildContext context) {
    context.go(AppRoutes.choosePlayMode);
  }

  static void goToChooseRaceType(BuildContext context) {
    context.go(AppRoutes.chooseRaceType);
  }

  static void goToInviteFriends(BuildContext context) {
    context.go(AppRoutes.inviteFriends);
  }

  static void goToWaitingForPlayers(BuildContext context) {
    context.go(AppRoutes.waitingForPlayers);
  }

  static void goToWaitingForVotes(BuildContext context) {
    context.go(AppRoutes.waitingForVotes);
  }

  static void goToChatWithFriends(BuildContext context) {
    context.go(AppRoutes.chatWithFriends);
  }

  static void goToJoinGame(BuildContext context) {
    context.go(AppRoutes.joinGame);
  }

  static void goToCompletedHunts(BuildContext context) {
    context.go(AppRoutes.completedHunts);
  }

  static void goToCompletedHuntDetails(BuildContext context, String huntId) {
    context.go('${AppRoutes.completedHuntDetails}/$huntId');
  }

  static void goToCompletedTasks(BuildContext context) {
    context.go(AppRoutes.completedTasks);
  }

  static void goToCompletedTaskDetails(BuildContext context, String taskId) {
    context.go('${AppRoutes.completedTaskDetails}/$taskId');
  }

  static void goToTeamFlash(BuildContext context) {
    context.go(AppRoutes.teamFlash);
  }

  static void goToLocation(BuildContext context) {
    context.go(AppRoutes.location);
  }

  static void pushToSplash(BuildContext context) {
    context.push(AppRoutes.splash);
  }

  static void pushToLogin(BuildContext context) {
    context.push(AppRoutes.login);
  }

  static void pushToSignUp(BuildContext context) {
    context.push(AppRoutes.signUp);
  }

  static void pushToGetStarted(BuildContext context) {
    context.push(AppRoutes.getStarted);
  }

  static void pushToHome(BuildContext context) {
    context.push(AppRoutes.home);
  }

  static void pushToLocationPermission(BuildContext context) {
    context.push(AppRoutes.locationPermission);
  }

  static void pushToProfile(BuildContext context) {
    context.push(AppRoutes.profile);
  }

  static void pushToEditProfile(BuildContext context) {
    context.push(AppRoutes.editProfile);
  }

  static void pushToFriends(BuildContext context) {
    context.push(AppRoutes.friends);
  }

  static void pushToAddFriend(BuildContext context) {
    context.push(AppRoutes.addFriend);
  }

  static void pushToPlayerProfile(BuildContext context, String playerId) {
    context.push('${AppRoutes.playerProfile}/$playerId');
  }

  static void pushToLeaderboard(BuildContext context) {
    context.push(AppRoutes.leaderboard);
  }

  static void pushToCreateGame(BuildContext context) {
    context.push(AppRoutes.createGame);
  }

  static void pushToChooseGameType(BuildContext context) {
    context.push(AppRoutes.chooseGameType);
  }

  static void pushToChoosePlayMode(BuildContext context) {
    context.push(AppRoutes.choosePlayMode);
  }

  static void pushToChooseRaceType(BuildContext context) {
    context.push(AppRoutes.chooseRaceType);
  }

  static void pushToInviteFriends(BuildContext context) {
    context.push(AppRoutes.inviteFriends);
  }

  static void pushToWaitingForPlayers(BuildContext context) {
    context.push(AppRoutes.waitingForPlayers);
  }

  static void pushToWaitingForVotes(BuildContext context) {
    context.push(AppRoutes.waitingForVotes);
  }

  static void pushToChatWithFriends(BuildContext context) {
    context.push(AppRoutes.chatWithFriends);
  }

  static void pushToJoinGame(BuildContext context) {
    context.push(AppRoutes.joinGame);
  }

  static void pushToCompletedHunts(BuildContext context) {
    context.push(AppRoutes.completedHunts);
  }

  static void pushToCompletedHuntDetails(BuildContext context, String huntId) {
    context.push('${AppRoutes.completedHuntDetails}/$huntId');
  }

  static void pushToCompletedTasks(BuildContext context) {
    context.push(AppRoutes.completedTasks);
  }

  static void pushToCompletedTaskDetails(BuildContext context, String taskId) {
    context.push('${AppRoutes.completedTaskDetails}/$taskId');
  }

  static void pushToTeamFlash(BuildContext context) {
    context.push(AppRoutes.teamFlash);
  }

  static void pushToLocation(BuildContext context) {
    context.push(AppRoutes.location);
  }

  static void pop(BuildContext context) {
    context.pop();
  }

  static bool canPop(BuildContext context) {
    return context.canPop();
  }

  static void popUntil(BuildContext context, String routeName) {
    Navigator.of(context).popUntil(ModalRoute.withName(routeName));
  }

  static void goAndClearStack(BuildContext context, String routeName) {
    context.go(routeName);
  }
}