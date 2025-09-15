// providers/location_notifier.dart
import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:scavenge_hunt/features/location/data/models/location_state.dart';

class LocationNotifier extends StateNotifier<LocationModel> {
  LocationNotifier() : super(const LocationModel());

  StreamSubscription<Position>? _positionStreamSubscription;
  final GeolocatorPlatform _geolocator = GeolocatorPlatform.instance;

  Future<void> getCurrentLocation() async {
    try {
      // Set loading state
      state = state.copyWith(isLoading: true, error: null);

      // Check and request permission
      await _checkLocationPermission();

      // Get current position
      final position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);

      // Update state with location data
      state = state.copyWith(latitude: position.latitude, longitude: position.longitude, isLoading: false, error: null, updateCount: state.updateCount + 1);

      // Optional: Get address from coordinates
      // await _getAddressFromCoordinates(position.latitude, position.longitude);
    } catch (e) {
      state = state.copyWith(isLoading: false, error: e.toString());
    }
  }

  Future<void> startLocationStream({
    LocationAccuracy accuracy = LocationAccuracy.high,
    int distanceFilter = 10, // meters
    Duration interval = const Duration(seconds: 5),
  }) async {
    try {
      // Stop any existing stream
      await stopLocationStream();

      // Check and request permission
      await _checkLocationPermission();

      // Check if location services are enabled
      final serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        state = state.copyWith(error: "Please enable location services");

        throw Exception('Location services are disabled');
      }

      // Start location stream
      _positionStreamSubscription =
          Geolocator.getPositionStream(
            locationSettings: LocationSettings(accuracy: accuracy, distanceFilter: distanceFilter, timeLimit: interval),
          ).listen(
            (Position position) {
              // Update state with new position
              state = state.copyWith(latitude: position.latitude, longitude: position.longitude, isStreaming: true, updateCount: state.updateCount + 1, error: null);

              // Get address for the new position
              // _getAddressFromCoordinates(position.latitude, position.longitude);
            },
            onError: (error) {
              state = state.copyWith(error: error.toString(), isStreaming: false);
            },
          );

      state = state.copyWith(isStreaming: true, error: null);
    } catch (e) {
      state = state.copyWith(isStreaming: false, error: e.toString());
    }
  }

  Future<void> stopLocationStream() async {
    await _positionStreamSubscription?.cancel();
    _positionStreamSubscription = null;

    if (state.isStreaming) {
      state = state.copyWith(isStreaming: false);
    }
  }

  Future<void> _checkLocationPermission() async {
    final permission = await Permission.location.status;

    if (permission.isDenied) {
      final requestedPermission = await Permission.location.request();

      if (requestedPermission.isDenied || requestedPermission.isPermanentlyDenied) {
        throw Exception('Location permission denied');
      }
    }
  }

  // Future<void> _getAddressFromCoordinates(double lat, double lng) async {
  //   try {
  //     final placemarks = await Geolocator.placemarkFromCoordinates(lat, lng);
  //
  //     if (placemarks.isNotEmpty) {
  //       final placemark = placemarks.first;
  //       final address = _formatAddress(placemark);
  //
  //       state = state.copyWith(address: address);
  //     }
  //   } catch (e) {
  //     // Silently fail address lookup
  //     print('Address lookup failed: $e');
  //   }
  // }
  //
  // String _formatAddress(Placemark placemark) {
  //   final parts = [placemark.street, placemark.locality, placemark.administrativeArea, placemark.country].where((part) => part != null && part.isNotEmpty).toList();
  //
  //   return parts.join(', ');
  // }

  void clearError() {
    if (state.hasError) {
      state = state.copyWith(error: null);
    }
  }

  void reset() {
    stopLocationStream();
    state = const LocationModel();
  }

  @override
  void dispose() {
    _positionStreamSubscription?.cancel();
    super.dispose();
  }
}
