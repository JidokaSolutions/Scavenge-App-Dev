
class LocationModel {
  final double? latitude;
  final double? longitude;
  final String? address;
  final bool isLoading;
  final String? error;
  final bool isStreaming;
  final int updateCount;

  const LocationModel({this.latitude, this.longitude, this.address, this.isLoading = false, this.error, this.isStreaming = false, this.updateCount = 0});

  LocationModel copyWith({double? latitude, double? longitude, String? address, bool? isLoading, String? error, bool? isStreaming, int? updateCount}) {
    return LocationModel(
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
      address: address ?? this.address,
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
      isStreaming: isStreaming ?? this.isStreaming,
      updateCount: updateCount ?? this.updateCount,
    );
  }

  @override
  String toString() {
    if (isLoading) return "⏳ Loading location...";
    if (error != null) return "❌ Error: $error";
    if (latitude != null && longitude != null) {
      return "📍 Lat: $latitude, Lng: $longitude";
    }
    return "📭 No location yet";
  }

  bool get hasData => latitude != null && longitude != null;

  bool get hasError => error != null;
}
