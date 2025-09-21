import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_fonts.dart';
import '../../../../core/constants/app_images.dart';
import '../../../../core/constants/app_sizes.dart';
import '../../../../core/routes/app_navigation.dart';
import '../../../../core/widgets/custom_check_box_widget.dart';
import '../../../../core/widgets/headings_widget.dart';
import '../../../../core/widgets/my_button_widget.dart';
import '../../../../core/widgets/my_text_field_widget.dart';
import '../../../../core/widgets/my_text_widget.dart';
import '../../../../core/widgets/social_login_section.dart';
import '../../data/providers/auth_providers.dart';
import '../../logic/auth_state.dart';

class LoginForm extends ConsumerStatefulWidget {
  const LoginForm({super.key});

  @override
  ConsumerState<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends ConsumerState<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _rememberMe = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _handleLogin() async {
    if (_formKey.currentState?.validate() ?? false) {
      final authNotifier = ref.read(authNotifierProvider.notifier);
      await authNotifier.login(
        _emailController.text.trim(),
        _passwordController.text,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final authState = ref.watch(authNotifierProvider);

    // Listen to auth state changes
    ref.listen<AuthState>(authNotifierProvider, (previous, next) {
      if (next.hasError) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(next.errorMessage ?? 'Login failed'),
            backgroundColor: Colors.red,
          ),
        );
      } else if (next.isAuthenticated) {
        // Navigate to home screen
        // Navigation handled by AuthWrapper
      }
    });

    return Form(
      key: _formKey,
      child: SingleChildScrollView(
        child: Column(
          children: [
            const AuthHeading(
              title: 'Welcome back!',
              subTitle: 'Sign in to continue',
            ),
            SizedBox(height: AppSizes.HEIGHT_20),

            MyTextField(
              controller: _emailController,
              hintText: 'Email',
            ),

            MyTextField(
              controller: _passwordController,
              hintText: 'Password',
              isObSecure: true,
              marginBottom: 12,
              suffix: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [Image.asset(Assets.imagesVisibility, height: 20)],
              ),
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    CustomCheckBox(
                      isActive: _rememberMe,
                      onTap: () {
                        setState(() {
                          _rememberMe = !_rememberMe;
                        });
                      },
                    ),
                    SizedBox(width: 8),
                    MyText(
                      text: 'Remember me',
                      size: 14,
                      weight: FontWeight.w500,
                    ),
                  ],
                ),
                GestureDetector(
                  onTap: () {
                    // TODO: Add ForgotPassword route to GoRouter
                    // AppNavigation.pushToForgotPassword(context);
                  },
                  child: const MyText(
                    text: 'Forgot Password?',
                    size: 14,
                    weight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            SizedBox(height: AppSizes.HEIGHT_30),

            MyButton(
              buttonText: 'Sign In',
              onTap: authState.isLoading ? () {} : _handleLogin,
              isDisabled: authState.isLoading,
              child: authState.isLoading
                  ? const CircularProgressIndicator(color: Colors.white)
                  : null,
            ),
            SizedBox(height: AppSizes.HEIGHT_20),

            const SocialLoginWidget(),
            SizedBox(height: AppSizes.HEIGHT_20),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                MyText(
                  text: "Don't have an account? ",
                  size: 12,
                  color: kTertiaryColor.withValues(alpha: 0.6),
                ),
                GestureDetector(
                  onTap: () => AppNavigation.pushToSignUp(context),
                  child: const MyText(
                    text: 'Sign Up',
                    size: 12,
                    decoration: TextDecoration.underline,
                    // color: kSecondaryColor,
                    weight: FontWeight.w500,
                    fontFamily: AppFonts.Fredoka,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}