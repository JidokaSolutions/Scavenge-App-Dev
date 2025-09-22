// providers/location_provider.dart
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:scavenge_hunt/features/location/logic/location_notifier.dart';
import 'package:scavenge_hunt/features/location/logic/location_state.dart';

// Provider for the LocationNotifier
final locationProvider = StateNotifierProvider<LocationNotifier, LocationModel>((ref) => LocationNotifier());

// Provider for location permission status
final locationPermissionProvider = FutureProvider<PermissionStatus>((ref) async {
  return await Permission.location.status;
});

// Provider to check if location services are enabled
final locationServiceEnabledProvider = FutureProvider<bool>((ref) async {
  return await Geolocator.isLocationServiceEnabled();
});

// Provider for location stream settings
final locationStreamSettingsProvider = StateProvider<LocationStreamSettings>(
  (ref) => LocationStreamSettings(accuracy: LocationAccuracy.high, distanceFilter: 10, interval: const Duration(seconds: 5)),
);

class LocationStreamSettings {
  final LocationAccuracy accuracy;
  final int distanceFilter; // meters
  final Duration interval;

  LocationStreamSettings({required this.accuracy, required this.distanceFilter, required this.interval});
}
