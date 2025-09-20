import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../data/providers/auth_providers.dart';
import 'widgets/logout_button.dart';

/// Example widget showing how to use the authentication system
class ExampleAuthUsage extends ConsumerWidget {
  const ExampleAuthUsage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authNotifierProvider);
    final isAuthenticated = ref.watch(isAuthenticatedProvider);
    final currentUser = ref.watch(currentUserProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Auth Example'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Auth Status: ${authState.status}'),
            Text('Is Authenticated: $isAuthenticated'),
            Text('Current User: ${currentUser ?? 'None'}'),
            const SizedBox(height: 20),

            if (authState.hasError)
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.red[100],
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  'Error: ${authState.errorMessage}',
                  style: const TextStyle(color: Colors.red),
                ),
              ),

            const SizedBox(height: 20),

            if (isAuthenticated) ...[
              const Text('You are logged in!'),
              const SizedBox(height: 16),
              const LogoutButton(),
            ] else ...[
              const Text('You are not logged in'),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () async {
                  // Example login - replace with actual login form
                  final authNotifier = ref.read(authNotifierProvider.notifier);
                  await authNotifier.login('test@example.com', 'password123');
                },
                child: const Text('Test Login'),
              ),
            ],

            const SizedBox(height: 20),
            const Text('Quick Actions:'),
            const SizedBox(height: 8),

            ElevatedButton(
              onPressed: () {
                ref.read(authNotifierProvider.notifier).clearError();
              },
              child: const Text('Clear Error'),
            ),
          ],
        ),
      ),
    );
  }
}