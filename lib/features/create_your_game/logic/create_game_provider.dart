import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'create_game_notifier.dart';
import 'create_game_state.dart';

final createGameProvider = StateNotifierProvider<CreateGameNotifier, CreateGameState>((ref) {
  return CreateGameNotifier();
});

// Convenience providers for commonly used state properties
final selectedGameTypeProvider = Provider<GameType?>((ref) {
  return ref.watch(createGameProvider).selectedGameType;
});

final selectedPlayModeProvider = Provider<PlayMode?>((ref) {
  return ref.watch(createGameProvider).selectedPlayMode;
});

final currentStepProvider = Provider<int>((ref) {
  return ref.watch(createGameProvider).currentStep;
});

final currentLabelsProvider = Provider<List<String>>((ref) {
  return ref.watch(createGameProvider).currentLabels;
});
