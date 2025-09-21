import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:scavenge_hunt/features/create_your_game/ui/choose_game_type.dart';
import 'package:scavenge_hunt/features/create_your_game/ui/choose_play_mode.dart';
import 'package:scavenge_hunt/features/create_your_game/ui/choose_race_type.dart';
import 'package:scavenge_hunt/features/create_your_game/ui/invite_friends.dart';

enum GameType { timeBase, judging, combination }

enum PlayMode { solo, withFriends }

// Riverpod providers for game creation state
final selectedGameTypeProvider = StateProvider<GameType?>((ref) => null);
final selectedPlayModeProvider = StateProvider<PlayMode?>((ref) => null);
final currentStepProvider = StateProvider<int>((ref) => 0);

class CreateGameController {
  static const instance = CreateGameController._();

  const CreateGameController._();

  static const List<String> withFriendsLabels = [
    'Play Mode',
    'Race Type',
    'Game Type',
    'Invite Friend',
  ];
  static const List<String> soloLabels = ['Play Mode', 'Race Type', 'Game Type'];

  static const List<Widget> stepChildren = [
    ChoosePlayMode(),
    ChooseRaceType(),
    ChooseGameType(),
    InviteFriends(),
  ];
}

// Provider for getting current labels based on play mode
final currentLabelsProvider = Provider<List<String>>((ref) {
  final playMode = ref.watch(selectedPlayModeProvider);
  return playMode == PlayMode.solo
      ? CreateGameController.soloLabels
      : CreateGameController.withFriendsLabels;
});

// Provider for navigation actions
final createGameActionsProvider = Provider<CreateGameActions>((ref) {
  return CreateGameActions(ref);
});

class CreateGameActions {
  final Ref ref;

  CreateGameActions(this.ref);

  void selectGameType(GameType type) {
    ref.read(selectedGameTypeProvider.notifier).state = type;
  }

  void selectPlayMode(PlayMode mode) {
    ref.read(selectedPlayModeProvider.notifier).state = mode;
  }

  void nextStep() {
    final currentStep = ref.read(currentStepProvider);
    final playMode = ref.read(selectedPlayModeProvider);
    final maxStep = playMode == PlayMode.solo
        ? CreateGameController.soloLabels.length - 1
        : CreateGameController.withFriendsLabels.length - 1;

    if (currentStep < maxStep) {
      ref.read(currentStepProvider.notifier).state = currentStep + 1;
    }
  }

  void previousStep() {
    final currentStep = ref.read(currentStepProvider);
    if (currentStep > 0) {
      ref.read(currentStepProvider.notifier).state = currentStep - 1;
    }
    // Note: Navigation back handled in UI layer
  }
}
