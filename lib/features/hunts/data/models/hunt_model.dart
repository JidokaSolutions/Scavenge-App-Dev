class Hunt {
  final String huntName;

  Hunt({this.huntName = ""});

  Hunt copyWith({final String? huntName}) => Hunt(huntName: huntName ?? this.huntName);

  factory Hunt.fromJson(Map<String, dynamic> json) => Hunt(huntName: json['hunt_name']);
}
