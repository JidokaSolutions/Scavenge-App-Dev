enum PlayMode {
  solo,
  team,
}

enum RaceType {
  timeTrail,
  checkpoint,
  scavenger,
  other,
}

enum GameType {
  casual,
  ranked,
  event,
  other,
}

class HuntCreate {
  final String name;
  final PlayMode playmode;
  final RaceType racetype;
  final GameType gametype;
  final String? imagesDir;
  final String? ownerId;

  HuntCreate({
    required this.name,
    required this.playmode,
    required this.racetype,
    required this.gametype,
    this.imagesDir,
    this.ownerId,
  });

  Map<String, dynamic> toJson() => {
        'name': name,
        'playmode': playmode.name,
        'racetype': _raceTypeToJson(racetype),
        'gametype': gametype.name,
        if (imagesDir != null) 'images_dir': imagesDir,
        if (ownerId != null) 'owner_id': ownerId,
      };

  String _raceTypeToJson(RaceType type) {
    switch (type) {
      case RaceType.timeTrail:
        return 'time_trial';
      case RaceType.checkpoint:
        return 'checkpoint';
      case RaceType.scavenger:
        return 'scavenger';
      case RaceType.other:
        return 'other';
    }
  }
}

class HuntOut {
  final String name;
  final PlayMode playmode;
  final RaceType racetype;
  final GameType gametype;
  final String? imagesDir;
  final String? ownerId;
  final String id;
  final String? inviteId;

  HuntOut({
    required this.name,
    required this.playmode,
    required this.racetype,
    required this.gametype,
    this.imagesDir,
    this.ownerId,
    required this.id,
    this.inviteId,
  });

  factory HuntOut.fromJson(Map<String, dynamic> json) => HuntOut(
        name: json['name'],
        playmode: PlayMode.values.firstWhere((e) => e.name == json['playmode']),
        racetype: _raceTypeFromJson(json['racetype']),
        gametype: GameType.values.firstWhere((e) => e.name == json['gametype']),
        imagesDir: json['images_dir'],
        ownerId: json['owner_id'],
        id: json['id'],
        inviteId: json['invite_id'],
      );

  static RaceType _raceTypeFromJson(String value) {
    switch (value) {
      case 'time_trial':
        return RaceType.timeTrail;
      case 'checkpoint':
        return RaceType.checkpoint;
      case 'scavenger':
        return RaceType.scavenger;
      case 'other':
        return RaceType.other;
      default:
        return RaceType.other;
    }
  }

  Map<String, dynamic> toJson() => {
        'name': name,
        'playmode': playmode.name,
        'racetype': _raceTypeToJson(racetype),
        'gametype': gametype.name,
        if (imagesDir != null) 'images_dir': imagesDir,
        if (ownerId != null) 'owner_id': ownerId,
        'id': id,
        if (inviteId != null) 'invite_id': inviteId,
      };

  String _raceTypeToJson(RaceType type) {
    switch (type) {
      case RaceType.timeTrail:
        return 'time_trial';
      case RaceType.checkpoint:
        return 'checkpoint';
      case RaceType.scavenger:
        return 'scavenger';
      case RaceType.other:
        return 'other';
    }
  }
}

class HuntUpdate {
  final String? name;
  final PlayMode? playmode;
  final RaceType? racetype;
  final GameType? gametype;
  final String? imagesDir;
  final String? ownerId;

  HuntUpdate({
    this.name,
    this.playmode,
    this.racetype,
    this.gametype,
    this.imagesDir,
    this.ownerId,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = {};
    if (name != null) json['name'] = name;
    if (playmode != null) json['playmode'] = playmode!.name;
    if (racetype != null) json['racetype'] = _raceTypeToJson(racetype!);
    if (gametype != null) json['gametype'] = gametype!.name;
    if (imagesDir != null) json['images_dir'] = imagesDir;
    if (ownerId != null) json['owner_id'] = ownerId;
    return json;
  }

  String _raceTypeToJson(RaceType type) {
    switch (type) {
      case RaceType.timeTrail:
        return 'time_trial';
      case RaceType.checkpoint:
        return 'checkpoint';
      case RaceType.scavenger:
        return 'scavenger';
      case RaceType.other:
        return 'other';
    }
  }
}
