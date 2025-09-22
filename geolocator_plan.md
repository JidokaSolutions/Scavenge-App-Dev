# Geolocator Permission Implementation Plan

## Overview
Implement comprehensive location permission handling for the Scavenge Hunt app, ensuring location access is granted before users can proceed with login and app functionality.

## Requirements
1. **Login Flow Integration**: Check location permission when user clicks login button
2. **App Startup Check**: Verify location permission at app launch
3. **Permission Dialog**: Use existing `LocationPermissionDialogWidget` from `core/widgets/dialogs/location_permission.dart`
4. **Mandatory Permission**: Location permission is compulsory for app usage
5. **Settings Integration**: "Allow" button should open device settings
6. **Error Handling**: Show appropriate messages for denied permissions

## Implementation Strategy

### 1. App Startup Permission Check
- **Location**: `lib/app.dart` or main entry points
- **Approach**: Check permission in app initialization
- **Behavior**:
  - If permission granted → proceed normally
  - If permission denied → show `LocationPermissionDialogWidget`
  - If permanently denied → guide to settings

### 2. Login Flow Integration
- **Location**: Auth/login screens
- **Approach**: Check permission before processing login
- **Behavior**:
  - Pre-check permission before login API call
  - If denied → show permission dialog
  - If granted → proceed with login

### 3. Permission Dialog Handling
- **Widget**: `LocationPermissionDialogWidget`
- **"Allow" Button**: Open device settings using `openAppSettings()`
- **"Don't Allow" Button**: Show message "Location permission is required to use this app"
- **Non-dismissible**: Dialog should not be dismissible by tapping outside

### 4. Edge Cases to Handle
- **Permission Permanently Denied**: Direct user to settings
- **Location Services Disabled**: Prompt to enable location services
- **Permission Revoked**: Handle runtime permission changes
- **Settings Return**: Check permission status when user returns from settings
- **Network Connectivity**: Ensure permission flow works offline

### 5. Integration Points

#### A. App Initialization
```dart
// In app.dart or main
class App extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return FutureBuilder<bool>(
      future: _checkInitialPermissions(),
      builder: (context, snapshot) {
        // Handle permission check results
      },
    );
  }
}
```

#### B. Login Flow
```dart
// In login screen/controller
Future<void> onLoginPressed() async {
  try {
    // Check location permission first
    await _checkLocationPermission();

    // Proceed with login if permission granted
    await performLogin();
  } catch (e) {
    // Show permission dialog
    _showLocationPermissionDialog();
  }
}
```

#### C. Permission Service
```dart
// Create a dedicated permission service
class LocationPermissionService {
  static Future<bool> checkAndRequestPermission() async { }
  static Future<void> showPermissionDialog(BuildContext context) async { }
  static Future<void> openSettings() async { }
}
```

## File Structure
```
lib/
├── core/
│   ├── services/
│   │   └── location_permission_service.dart (new)
│   └── widgets/
│       └── dialogs/
│           └── location_permission.dart (existing)
├── features/
│   ├── auth/ (modify login flow)
│   └── location/ (existing providers)
└── app.dart (modify for startup check)
```

## Dependencies Required
- `permission_handler` (likely already present)
- `geolocator` (already present)
- Existing Riverpod providers

## Testing Scenarios
1. Fresh app install - no permissions
2. Permission granted then revoked
3. Permission permanently denied
4. Location services disabled
5. Return from settings with permission granted
6. Return from settings with permission still denied
7. Network connectivity variations

## Success Criteria
- ✅ App cannot be used without location permission
- ✅ Clear user guidance for permission issues
- ✅ Seamless flow when permissions are granted
- ✅ Proper handling of all permission states
- ✅ No disruption to existing UI/functionality
- ✅ Works across all supported Android versions