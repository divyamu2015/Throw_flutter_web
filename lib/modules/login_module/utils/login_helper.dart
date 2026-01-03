// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:throw_app/core/widgets/snackbars/custom_snackbar.dart';
import 'package:throw_app/modules/home_module/view/home_page.dart';
import 'package:throw_app/modules/profile_setup_module/view/profile_setup_page.dart';

class LoginHelper {
  final BuildContext context;
  final GlobalKey<FormState> loginFormKey;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final ValueNotifier<bool> isPasswordVisible;
  const LoginHelper({
    required this.context,
    required this.loginFormKey,
    required this.emailController,
    required this.passwordController,
    required this.isPasswordVisible,
  });

  void togglePasswordVisibility() {
    isPasswordVisible.value = !isPasswordVisible.value;
  }

  void handleLogin() {
    if (loginFormKey.currentState!.validate()) {
      final String email = emailController.text.trim();
      final String password = passwordController.text.trim();
      debugPrint('Email: $email');
      debugPrint('Password: $password');
      if (email == 'user@email.com' && password == 'password') {
        debugPrint('Login successful');
        CustomSnackbar.showSuccess(
          context: context,
          message: 'User logged in successfully!',
        );
        Navigator.pushAndRemoveUntil(context, HomePage.route(), (_) => false);
      } else {
        debugPrint('User have not registered');
        CustomSnackbar.showInfo(
          context: context,
          message: 'Please register your account first.',
        );
        Navigator.pushAndRemoveUntil(
          context,
          ProfileSetupPage.route(),
          (_) => false,
        );
      }
    }
  }

  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your phone number or email';
    }

    // Basic email validation
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');

    if (!emailRegex.hasMatch(value)) {
      return 'Please enter a valid email';
    }

    return null;
  }

  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your password';
    }
    if (value.length < 6) {
      return 'Password must be at least 6 characters';
    }
    return null;
  }
}
