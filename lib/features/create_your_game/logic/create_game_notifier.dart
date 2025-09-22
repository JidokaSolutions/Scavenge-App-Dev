import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../ui/choose_play_mode.dart';
import '../ui/choose_race_type.dart';
import '../ui/choose_game_type.dart';
import '../ui/invite_friends.dart';
import 'create_game_state.dart';

class CreateGameNotifier extends StateNotifier<CreateGameState> {
  CreateGameNotifier()
      : super(CreateGameState(
          soloLabels: const ['Play Mode', 'Race Type', 'Game Type'],
          withFriendsLabels: const [
            'Play Mode',
            'Race Type',
            'Game Type',
            'Invite Friend',
          ],
          stepChildren: const [
            ChoosePlayMode(),
            ChooseRaceType(),
            ChooseGameType(),
            InviteFriends(),
          ],
        ));

  void selectGameType(GameType type) {
    state = state.copyWith(selectedGameType: type);
  }

  void selectPlayMode(PlayMode mode) {
    state = state.copyWith(selectedPlayMode: mode);
  }

  void nextStep() {
    final maxSteps = (state.selectedPlayMode == PlayMode.solo)
        ? state.soloLabels.length - 1
        : state.withFriendsLabels.length - 1;

    if (state.currentStep < maxSteps) {
      state = state.copyWith(currentStep: state.currentStep + 1);
    }
  }

  void previousStep({VoidCallback? ifNone}) {
    if (state.currentStep > 0) {
      state = state.copyWith(currentStep: state.currentStep - 1);
    } else {
      ifNone?.call();
    }
  }

  void resetToInitialState() {
    state = CreateGameState(
      soloLabels: const ['Play Mode', 'Race Type', 'Game Type'],
      withFriendsLabels: const [
        'Play Mode',
        'Race Type',
        'Game Type',
        'Invite Friend',
      ],
      stepChildren: const [
        ChoosePlayMode(),
        ChooseRaceType(),
        ChooseGameType(),
        InviteFriends(),
      ],
    );
  }
}