import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:scavenge_hunt/features/landing/ui/home.dart';

import '../../landing/ui/landing_page.dart';
import '../data/providers/auth_providers.dart';
import '../logic/auth_state.dart';
import 'login.dart';

class AuthWrapper extends ConsumerWidget {
  const AuthWrapper({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authNotifierProvider);

    return switch (authState.status) {
      AuthStatus.initial => const _LoadingScreen(),
      AuthStatus.loading => const _LoadingScreen(),
      // AuthStatus.authenticated => const LandingPage(),
      AuthStatus.authenticated => const Home(),
      AuthStatus.unauthenticated => const Login(),
      AuthStatus.registrationSuccess => const Login(),
      AuthStatus.error => const Login(),
    };
  }
}

class _LoadingScreen extends StatelessWidget {
  const _LoadingScreen();

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
