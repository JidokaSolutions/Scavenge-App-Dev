import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/widgets/my_button_widget.dart';
import '../../../../core/widgets/my_text_widget.dart';
import '../../data/providers/auth_providers.dart';

class LogoutButton extends ConsumerWidget {
  final String? text;
  final VoidCallback? onPressed;

  const LogoutButton({
    super.key,
    this.text,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authNotifierProvider);

    return MyButton(
      buttonText: text ?? 'Logout',
      onTap: authState.isLoading
          ? () {}
          : () async {
              await ref.read(authNotifierProvider.notifier).logout();
              onPressed?.call();
            },
      isDisabled: authState.isLoading,
      child: authState.isLoading
          ? const CircularProgressIndicator(color: Colors.white)
          : null,
    );
  }
}