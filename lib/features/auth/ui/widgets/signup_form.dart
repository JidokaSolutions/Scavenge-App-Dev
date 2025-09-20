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

class SignupForm extends ConsumerStatefulWidget {
  const SignupForm({super.key});

  @override
  ConsumerState<SignupForm> createState() => _SignupFormState();
}

class _SignupFormState extends ConsumerState<SignupForm> {
  final _formKey = GlobalKey<FormState>();
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  bool _acceptTerms = false;

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  void _handleSignup() async {
    if (!_acceptTerms) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please accept terms and conditions'),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    if (_formKey.currentState?.validate() ?? false) {
      final authNotifier = ref.read(authNotifierProvider.notifier);
      await authNotifier.register(
        firstname: _firstNameController.text.trim(),
        lastname: _lastNameController.text.trim(),
        email: _emailController.text.trim(),
        password: _passwordController.text,
        phone: _phoneController.text.trim().isEmpty ? null : _phoneController.text.trim(),
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
            content: Text(next.errorMessage ?? 'Registration failed'),
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
      child: Column(
        children: [
          const AuthHeading(
            title: 'Create Account',
            subTitle: 'Sign up to get started',
          ),
          SizedBox(height: AppSizes.HEIGHT_20),

          MyTextField(
            controller: _firstNameController,
            hintText: 'First Name',
          ),

          MyTextField(
            controller: _lastNameController,
            hintText: 'Last Name',
          ),


          MyTextField(
            controller: _emailController,
            hintText: 'Email',
          ),

          MyTextField(
            hintText: '18/03/2024',
            suffix: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [Image.asset(Assets.imagesCalendar, height: 18)],
            ),
          ),

          PhoneField(),

          MyTextField(
            controller: _passwordController,
            hintText: 'Password',
            isObSecure: true,
            suffix: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [Image.asset(Assets.imagesVisibility, height: 20)],
            ),
          ),

          MyTextField(
            controller: _confirmPasswordController,
            hintText: 'Confirm Password',
            isObSecure: true,
            marginBottom: 15,
            suffix: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [Image.asset(Assets.imagesVisibility, height: 20)],
            ),
          ),

          Row(
            children: [
              CustomCheckBox(
                isActive: _acceptTerms,
                onTap: () {
                  setState(() {
                    _acceptTerms = !_acceptTerms;
                  });
                },
              ),
              SizedBox(width: 8),
              const Expanded(
                child: MyText(
                  text: 'I accept the Terms and Conditions',
                  size: 14,
                ),
              ),
            ],
          ),
          SizedBox(height: AppSizes.HEIGHT_30),

          MyButton(
            buttonText: 'Register',
            onTap: authState.isLoading ? () {} : _handleSignup,
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
              const MyText(
                text: "Already have an account? ",
                size: 12,
              ),
              GestureDetector(
                onTap: () => AppNavigation.pushToLogin(context),
                child: const MyText(
                  text: 'Login',
                  size: 12,
                  decoration: TextDecoration.underline,
                  fontFamily: AppFonts.Fredoka,
                  weight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}