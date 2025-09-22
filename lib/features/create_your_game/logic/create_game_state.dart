import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';

enum GameType { timeBase, judging, combination }

enum PlayMode { solo, withFriends }

class CreateGameState extends Equatable {
  final GameType? selectedGameType;
  final PlayMode? selectedPlayMode;
  final int currentStep;
  final List<String> soloLabels;
  final List<String> withFriendsLabels;
  final List<Widget> stepChildren;

  const CreateGameState({
    this.selectedGameType,
    this.selectedPlayMode,
    this.currentStep = 0,
    required this.soloLabels,
    required this.withFriendsLabels,
    required this.stepChildren,
  });

  CreateGameState copyWith({
    GameType? selectedGameType,
    PlayMode? selectedPlayMode,
    int? currentStep,
    List<String>? soloLabels,
    List<String>? withFriendsLabels,
    List<Widget>? stepChildren,
  }) {
    return CreateGameState(
      selectedGameType: selectedGameType ?? this.selectedGameType,
      selectedPlayMode: selectedPlayMode ?? this.selectedPlayMode,
      currentStep: currentStep ?? this.currentStep,
      soloLabels: soloLabels ?? this.soloLabels,
      withFriendsLabels: withFriendsLabels ?? this.withFriendsLabels,
      stepChildren: stepChildren ?? this.stepChildren,
    );
  }

  List<String> get currentLabels {
    return selectedPlayMode == PlayMode.solo ? soloLabels : withFriendsLabels;
  }

  @override
  List<Object?> get props => [
        selectedGameType,
        selectedPlayMode,
        currentStep,
        soloLabels,
        withFriendsLabels,
        stepChildren,
      ];
}