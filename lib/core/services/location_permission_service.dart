import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:scavenge_hunt/core/utils/show_custom_generic_dialog.dart';
import 'package:scavenge_hunt/core/widgets/dialogs/location_permission.dart';
import 'package:scavenge_hunt/features/location/logic/location_notifier.dart';
import 'package:scavenge_hunt/features/location/logic/location_provider.dart';

class LocationPermissionService {
  LocationPermissionService._();
  static final LocationPermissionService _instance = LocationPermissionService._();
  static LocationPermissionService get instance => _instance;

  static bool _isDialogShowing = false;
  static bool _isInitializing = false;
  static BuildContext? _dialogContext;

  /// Check if location permission is granted
  static Future<bool> hasLocationPermission() async {
    try {
      final permission = await Geolocator.checkPermission();
      return permission == LocationPermission.whileInUse || permission == LocationPermission.always;
    } catch (e) {
      return false;
    }
  }

  /// Check if location services are enabled
  static Future<bool> isLocationServiceEnabled() async {
    try {
      return await Geolocator.isLocationServiceEnabled();
    } catch (e) {
      return false;
    }
  }

  /// Request location permission with proper handling
  static Future<LocationPermissionResult> requestLocationPermission() async {
    try {
      // Check if location services are enabled first
      final serviceEnabled = await isLocationServiceEnabled();
      if (!serviceEnabled) {
        return LocationPermissionResult.serviceDisabled;
      }

      // Get current permission status
      LocationPermission permission = await Geolocator.checkPermission();

      // Handle different permission states
      switch (permission) {
        case LocationPermission.denied:
          // Request permission for the first time
          permission = await Geolocator.requestPermission();

          if (permission == LocationPermission.denied) {
            return LocationPermissionResult.denied;
          }

          if (permission == LocationPermission.deniedForever) {
            return LocationPermissionResult.deniedForever;
          }

          return LocationPermissionResult.granted;

        case LocationPermission.deniedForever:
          return LocationPermissionResult.deniedForever;

        case LocationPermission.whileInUse:
        case LocationPermission.always:
          return LocationPermissionResult.granted;

        case LocationPermission.unableToDetermine:
          // Fallback for older Android versions
          try {
            permission = await Geolocator.requestPermission();
            if (permission == LocationPermission.denied || permission == LocationPermission.deniedForever) {
              return LocationPermissionResult.denied;
            }
            return LocationPermissionResult.granted;
          } catch (e) {
            return LocationPermissionResult.error;
          }
      }
    } catch (e) {
      return LocationPermissionResult.error;
    }
  }

  /// Show location permission dialog
  static Future<bool> showLocationPermissionDialog(BuildContext context) async {
    if (_isDialogShowing) return false;

    _isDialogShowing = true;

    try {
      final result = await showCustomDialog<bool>(
        context: context,
        barrierDismissible: false,
        preventBackButton: true,
        widget: LocationPermissionDialogWidget(
          onAllowPressed: () async {
            Navigator.of(context).pop(true);
            await openAppSettings();
          },
          onDontAllowPressed: () {
            Navigator.of(context).pop(false);
            _showPermissionRequiredMessage(context);
          },
        ),
      );

      return result ?? false;
    } finally {
      _isDialogShowing = false;
      _dialogContext = null;
    }
  }

  /// Show message when permission is denied
  static void _showPermissionRequiredMessage(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Location permission is required to use this app'),
        backgroundColor: Colors.red,
        duration: Duration(seconds: 3),
      ),
    );
  }

  /// Check and handle location permission for app startup
  static Future<bool> checkLocationPermissionForAppStartup(BuildContext context) async {
    // Check if permission is already granted
    if (await hasLocationPermission()) {
      return true;
    }

    // Check if location services are enabled
    if (!await isLocationServiceEnabled()) {
      await _showLocationServiceDisabledDialog(context);
      return false;
    }

    // Request permission
    final result = await requestLocationPermission();

    switch (result) {
      case LocationPermissionResult.granted:
        return true;

      case LocationPermissionResult.denied:
      case LocationPermissionResult.deniedForever:
        await showLocationPermissionDialog(context);
        return false;

      case LocationPermissionResult.serviceDisabled:
        await _showLocationServiceDisabledDialog(context);
        return false;

      case LocationPermissionResult.error:
        await _showPermissionErrorDialog(context);
        return false;
    }
  }

  /// Check and handle location permission for login flow
  static Future<bool> checkLocationPermissionForLogin(BuildContext context) async {
    // Check if permission is already granted
    if (await hasLocationPermission()) {
      return true;
    }

    // Show permission dialog
    await showLocationPermissionDialog(context);

    // Re-check permission after dialog
    return await hasLocationPermission();
  }

  /// Show dialog when location services are disabled
  static Future<void> _showLocationServiceDisabledDialog(BuildContext context) async {
    await showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        title: const Text('Location Services Disabled'),
        content: const Text(
          'Please enable location services in your device settings to use this app.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('OK'),
          ),
          TextButton(
            onPressed: () async {
              Navigator.of(context).pop();
              await openAppSettings();
            },
            child: const Text('Settings'),
          ),
        ],
      ),
    );
  }

  /// Show dialog when there's an error with permission handling
  static Future<void> _showPermissionErrorDialog(BuildContext context) async {
    await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Permission Error'),
        content: const Text(
          'There was an error handling location permissions. Please check your device settings.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  /// Initialize location after permission is granted
  static Future<void> initializeLocationAfterPermission(WidgetRef ref) async {
    if (_isInitializing) return; // Prevent multiple simultaneous initializations

    _isInitializing = true;
    try {
      final locationNotifier = ref.read(locationNotifierProvider.notifier);
      await locationNotifier.getCurrentLocation();
    } catch (e) {
      // Handle initialization error silently or log it
      debugPrint('Location initialization error: $e');
    } finally {
      _isInitializing = false;
    }
  }

  /// Dismiss any showing permission dialog
  static void dismissDialog() {
    if (_isDialogShowing && _dialogContext != null) {
      try {
        Navigator.of(_dialogContext!).pop();
      } catch (e) {
        // Dialog might already be dismissed
      }
      _isDialogShowing = false;
      _dialogContext = null;
    }
  }

  /// Check permission status when returning from settings
  static Future<bool> checkPermissionAfterSettings() async {
    // Add a small delay to ensure settings changes are reflected
    await Future.delayed(const Duration(milliseconds: 500));

    final hasPermission = await hasLocationPermission();

    // If permission is granted, dismiss any showing dialog
    if (hasPermission) {
      dismissDialog();
    }

    return hasPermission;
  }

  /// Handle background location permission changes
  static Future<void> handlePermissionChange(WidgetRef ref, BuildContext context) async {
    final hasPermission = await hasLocationPermission();

    if (!hasPermission) {
      // Permission was revoked, show dialog again
      await showLocationPermissionDialog(context);
    } else {
      // Permission was granted, initialize location
      await initializeLocationAfterPermission(ref);
    }
  }

  /// Comprehensive permission validation
  static Future<LocationPermissionValidationResult> validateLocationPermission() async {
    try {
      // Check location services first
      final serviceEnabled = await isLocationServiceEnabled();
      if (!serviceEnabled) {
        return LocationPermissionValidationResult(
          isValid: false,
          errorType: LocationPermissionErrorType.serviceDisabled,
          message: 'Location services are disabled. Please enable location services in your device settings.',
        );
      }

      // Check permission
      final hasPermission = await hasLocationPermission();
      if (!hasPermission) {
        final permission = await Geolocator.checkPermission();

        if (permission == LocationPermission.deniedForever) {
          return LocationPermissionValidationResult(
            isValid: false,
            errorType: LocationPermissionErrorType.deniedForever,
            message: 'Location permission was permanently denied. Please go to Settings > Apps > Scavenge Hunt > Permissions and enable Location access.',
          );
        } else {
          return LocationPermissionValidationResult(
            isValid: false,
            errorType: LocationPermissionErrorType.denied,
            message: 'Location permission is required to use this app. Please grant location access.',
          );
        }
      }

      return LocationPermissionValidationResult(
        isValid: true,
        errorType: LocationPermissionErrorType.none,
        message: 'Location permission is granted.',
      );
    } catch (e) {
      return LocationPermissionValidationResult(
        isValid: false,
        errorType: LocationPermissionErrorType.unknown,
        message: 'An error occurred while checking location permissions: ${e.toString()}',
      );
    }
  }
}

/// Result enum for location permission requests
enum LocationPermissionResult {
  granted,
  denied,
  deniedForever,
  serviceDisabled,
  error,
}

/// Validation result for comprehensive permission check
class LocationPermissionValidationResult {
  final bool isValid;
  final LocationPermissionErrorType errorType;
  final String message;

  LocationPermissionValidationResult({
    required this.isValid,
    required this.errorType,
    required this.message,
  });
}

/// Error types for location permission
enum LocationPermissionErrorType {
  none,
  denied,
  deniedForever,
  serviceDisabled,
  unknown,
}

/// Provider for location permission service
final locationPermissionServiceProvider = Provider<LocationPermissionService>((ref) {
  return LocationPermissionService.instance;
});
