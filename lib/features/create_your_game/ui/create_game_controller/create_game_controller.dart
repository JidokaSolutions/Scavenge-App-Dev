import 'package:flutter/widgets.dart';
// TODO: Convert this GetX controller to Riverpod provider
import 'package:get/get.dart';
import 'package:scavenge_hunt/features/create_your_game/ui/choose_game_type.dart';
import 'package:scavenge_hunt/features/create_your_game/ui/choose_play_mode.dart';
import 'package:scavenge_hunt/features/create_your_game/ui/choose_race_type.dart';
import 'package:scavenge_hunt/features/create_your_game/ui/invite_friends.dart';

enum GameType { timeBase, judging, combination }

enum PlayMode { solo, withFriends }

class CreateGameController extends GetxController {
  // TODO: Replace with Riverpod provider reference
  static CreateGameController instance = Get.find<CreateGameController>();

  final Rx<GameType?> selectedGameType = Rx<GameType?>(null);

  void selectGameType(GameType type) {
    switch (type) {
      case GameType.timeBase:
        selectedGameType.value = GameType.timeBase;
        break;
      case GameType.judging:
        selectedGameType.value = GameType.judging;
        break;
      case GameType.combination:
        selectedGameType.value = GameType.combination;
        break;
    }
  }

  final Rx<PlayMode?> selectedPlayMode = Rx<PlayMode?>(null);

  void selectPlayMode(PlayMode mode) {
    switch (mode) {
      case PlayMode.solo:
        selectedPlayMode.value = PlayMode.solo;
        break;
      case PlayMode.withFriends:
        selectedPlayMode.value = PlayMode.withFriends;
        break;
    }
  }

  final List<String> withFriendsLabels = [
    'Play Mode',
    'Race Type',
    'Game Type',
    'Invite Friend',
  ];
  final List<String> soloLabels = ['Play Mode', 'Race Type', 'Game Type'];

  RxList<String> get currentLabels => RxList<String>.from(
    selectedPlayMode.value == PlayMode.solo ? soloLabels : withFriendsLabels,
  );

  final List<Widget> stepChildren = [
    ChoosePlayMode(),
    ChooseRaceType(),
    ChooseGameType(),
    InviteFriends(),
  ];

  final RxInt currentStep = 0.obs;

  void nextStep() {
    if (currentStep.value <
        ((selectedPlayMode.value == PlayMode.solo)
            ? soloLabels.length - 1
            : withFriendsLabels.length - 1)) {
      currentStep.value++;
    }
  }

  void previousStep() {
    if (currentStep.value > 0) {
      currentStep.value--;
    } else {
      // TODO: Replace with AppNavigation.pop(context) when converting to Riverpod
      Get.back();
    }
  }
}
