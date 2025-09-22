# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Development Commands

### Running the App
```bash
# Development environment
flutter run --flavor dev lib/main_dev.dart
flutter run --release --flavor dev lib/main_dev.dart

# Production environment
flutter run --flavor prod lib/main_prod.dart
```

### Building Release Artifacts
```bash
# Development builds
flutter build apk --flavor dev lib/main_dev.dart

# Production builds
flutter build appbundle --flavor prod lib/main_prod.dart
flutter build apk --flavor prod lib/main_prod.dart
```

### Code Analysis and Linting
```bash
flutter analyze
dart fix --apply
```

### Asset Generation
```bash
# Generate app icons
dart run flutter_launcher_icons -f flutter_launcher_icons.yaml

# Get dependencies
flutter pub get

# Code generation (for Drift database and API clients)
dart run build_runner build
```

### Shorebird Code Push
```bash
# Release builds
shorebird release android --artifact apk --target ./lib/main_dev.dart --flavor dev --flutter-version 3.32.8
shorebird release android --artifact apk --target ./lib/main_prod.dart --flavor prod --flutter-version 3.32.8

# Patches
shorebird patch android --artifact apk --target ./lib/main_dev.dart --flavor dev --flutter-version 3.32.8
shorebird patch android --artifact apk --target ./lib/main_prod.dart --flavor prod --flutter-version 3.32.8
```

## Architecture Overview

### State Management
- **Primary**: Riverpod 2.x for state management
- **Legacy**: GetX is present but being phased out (see lib/core/constants/getx_controller_instances.dart)
- Location: `lib/features/location/logic/location_provider.dart` shows Riverpod provider patterns

### Environment Configuration
- Multi-environment setup: dev, staging, prod
- Configuration: `lib/core/env/env.dart`
- API endpoints vary by environment:
  - Dev: `https://api-dev.scavengehunt.com`
  - Staging: `https://api-staging.scavengehunt.com`
  - Prod: `https://api.scavengehunt.com`

### Network Layer
- **HTTP Client**: Dio with custom configuration
- **Base**: `lib/core/network/api_client.dart` and `lib/core/network/api_handler.dart`
- **Interceptors**:
  - `lib/core/network/dio_interceptors/dio_auth_and_error_interceptor.dart`
  - `lib/core/network/dio_interceptors/dio_retry_interceptor.dart`
- **API Services**: Generated code in `lib/features/hunts/data/hunts_api.dart`

### Logging and Error Handling
- **Abstract Interface**: `lib/core/logger/logger.dart`
- **Implementations**:
  - Sentry: `lib/core/logger/sentry_logger.dart`
  - Print: `lib/core/logger/print_logger.dart`
  - Composite: `lib/core/logger/composite_logger.dart`
- **Error Reporting**: Sentry integration with environment-specific configuration

### Local Storage
- **SharedPreferences**: `lib/core/storage/shared_prefs.dart`
- **Database**: Drift ORM configured (see pubspec.yaml) but may not be fully implemented
- **Cache**: User data, authentication state, and app preferences

### Location Services
- **Provider**: Geolocator with permission handling
- **State Management**: Riverpod providers in `lib/features/location/logic/`
- **Components**: Location permission screens and location-based features

### Code Push Integration
- **Shorebird**: Over-the-air updates configured with separate app IDs for dev/prod flavors
- **Configuration**: `shorebird.yaml` with flavor-specific app IDs

## Project Structure

### Feature Organization
```
lib/features/
├── auth/           # Authentication flows (login, signup, forgot password)
├── create_your_game/  # Game creation flows (solo/multiplayer, voting systems)
├── friends/        # Friend management
├── hunts/          # Hunt data models and UI
├── join_game/      # Game joining functionality
├── landing/        # App landing, splash, onboarding
├── leaderboard/    # Leaderboard displays
├── location/       # Location services and UI
├── players/        # Player profiles
└── profile/        # User profile management
```

### Core Infrastructure
```
lib/core/
├── constants/      # App-wide constants (colors, fonts, strings, images)
├── env/           # Environment configuration
├── logger/        # Logging abstraction and implementations
├── network/       # HTTP client and API infrastructure
├── routes/        # Navigation (minimal GetX routes, mostly direct navigation)
├── storage/       # Local data persistence
├── theme/         # App theming
└── widgets/       # Reusable UI components
```

### Entry Points
- `lib/main_dev.dart` - Development environment entry point
- `lib/main_prod.dart` - Production environment entry point
- `lib/app.dart` - Main app widget with force update integration

## Key Dependencies

### UI and Theming
- Custom fonts: Nunito and Fredoka families
- Icons: FontAwesome and Cupertino icons
- UI components: Custom widgets in `lib/core/widgets/`

### Core Libraries
- **flutter_riverpod**: State management (v2.6.1)
- **dio**: HTTP client (v5.9.0)
- **geolocator**: Location services (v14.0.2)
- **shared_preferences**: Local storage (v2.5.3)
- **sentry_flutter**: Error reporting (v9.6.0)
- **shorebird_code_push**: Over-the-air updates (v2.0.4)

### Development Tools
- **flutter_lints**: Code analysis (v5.0.0)
- **custom_lint**: Additional linting (v0.8.0)
- **build_runner**: Code generation (v2.7.0)
- **drift_dev**: Database code generation (v2.28.1)