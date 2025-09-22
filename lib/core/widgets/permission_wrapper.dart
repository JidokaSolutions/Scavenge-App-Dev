import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:scavenge_hunt/core/services/location_permission_service.dart';

/// Wrapper widget that ensures location permission is granted before showing child
class PermissionWrapper extends ConsumerStatefulWidget {
  final Widget child;

  const PermissionWrapper({
    super.key,
    required this.child,
  });

  @override
  ConsumerState<PermissionWrapper> createState() => _PermissionWrapperState();
}

class _PermissionWrapperState extends ConsumerState<PermissionWrapper>
    with WidgetsBindingObserver {
  bool _isChecking = true;
  bool _hasPermission = false;
  bool _isDialogShowing = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    _checkPermissionOnStartup();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);

    // Check permission when app resumes (user might have granted permission in settings)
    if (state == AppLifecycleState.resumed && !_hasPermission) {
      _recheckPermissionAfterResume();
    }
  }

  Future<void> _checkPermissionOnStartup() async {
    try {
      final hasPermission = await LocationPermissionService.hasLocationPermission();

      if (hasPermission) {
        setState(() {
          _hasPermission = true;
          _isChecking = false;
        });
      } else {
        setState(() {
          _isChecking = false;
        });
        _showPermissionDialog();
      }
    } catch (e) {
      setState(() {
        _isChecking = false;
      });
      _showPermissionDialog();
    }
  }

  Future<void> _recheckPermissionAfterResume() async {
    // Small delay to ensure app state is properly restored
    await Future.delayed(const Duration(milliseconds: 500));

    final hasPermission = await LocationPermissionService.checkPermissionAfterSettings();

    if (hasPermission && !_hasPermission) {
      // Permission granted, dismiss any showing dialog and update state
      if (_isDialogShowing && mounted) {
        Navigator.of(context, rootNavigator: true).pop();
        _isDialogShowing = false;
      }

      setState(() {
        _hasPermission = true;
      });

      // Initialize location service after permission is granted
      await LocationPermissionService.initializeLocationAfterPermission(ref);
    }
  }

  Future<void> _showPermissionDialog() async {
    if (!mounted || _isDialogShowing) return;

    _isDialogShowing = true;

    try {
      await LocationPermissionService.showLocationPermissionDialog(context);
    } finally {
      _isDialogShowing = false;
    }

    // After dialog is dismissed, check permission again
    final hasPermission = await LocationPermissionService.hasLocationPermission();

    if (hasPermission) {
      setState(() {
        _hasPermission = true;
      });

      // Initialize location service after permission is granted
      await LocationPermissionService.initializeLocationAfterPermission(ref);
    } else {
      // If still no permission, show dialog again after a short delay
      // This creates a loop until permission is granted
      await Future.delayed(const Duration(milliseconds: 300));
      if (mounted && !_hasPermission) {
        _showPermissionDialog();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_isChecking) {
      return const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    if (!_hasPermission) {
      // This shouldn't be reached as we show dialog in a loop
      // But kept as safety fallback
      return const Scaffold(
        body: Center(
          child: Text('Location permission is required to use this app'),
        ),
      );
    }

    return widget.child;
  }
}