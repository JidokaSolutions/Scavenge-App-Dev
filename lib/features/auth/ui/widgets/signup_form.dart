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
  final _dobController = TextEditingController();
  DateTime? _selectedDate;
  bool _acceptTerms = false;

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    _dobController.dispose();
    super.dispose();
  }

  Future<void> _selectDate() async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate ?? DateTime.now().subtract(const Duration(days: 365 * 18)),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: Theme.of(context).colorScheme.copyWith(
              primary: kTertiaryColor,
            ),
          ),
          child: child!,
        );
      },
    );

    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
        _dobController.text = "${picked.day.toString().padLeft(2, '0')}/${picked.month.toString().padLeft(2, '0')}/${picked.year}";
      });
    }
  }

  String? _formatDateForApi(DateTime? date) {
    if (date == null) return null;
    return "${date.year}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}";
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
        dob: _formatDateForApi(_selectedDate),
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
      child: SingleChildScrollView(
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
              controller: _dobController,
              hintText: 'Date of Birth',
              isReadOnly: true,
              onTap: _selectDate,
              suffix: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [Image.asset(Assets.imagesCalendar, height: 18)],
              ),
            ),

            PhoneField(controller: _phoneController),

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
      ),
    );
  }
}