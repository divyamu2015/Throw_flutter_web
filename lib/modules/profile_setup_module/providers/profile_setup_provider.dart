// profile_setup_provider.dart
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ProfileSetupProvider with ChangeNotifier {
  // Form state
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  File? _profileImage;
  bool _isLoading = false;
  bool _isPasswordVisible = false;

  // Getters
  TextEditingController get fullNameController => _fullNameController;
  TextEditingController get phoneNumberController => _phoneNumberController;
  TextEditingController get emailController => _emailController;
  TextEditingController get passwordController => _passwordController;

  File? get profileImage => _profileImage;
  bool get isLoading => _isLoading;
  bool get isPasswordVisible => _isPasswordVisible;

  // Setters
  set profileImage(File? image) {
    _profileImage = image;
    notifyListeners();
  }

  set isLoading(bool loading) {
    _isLoading = loading;
    notifyListeners();
  }

  set isPasswordVisible(bool visible) {
    _isPasswordVisible = visible;
    notifyListeners();
  }

  // Methods
  Future<void> pickImage() async {
    final ImagePicker imagePicker = ImagePicker();
    try {
      final XFile? image = await imagePicker.pickImage(
        source: ImageSource.gallery,
        imageQuality: 85,
        maxWidth: 512,
        maxHeight: 512,
      );

      if (image != null) {
        profileImage = File(image.path);
      }
    } catch (e) {
      debugPrint('Error picking image: $e');
      rethrow;
    }
  }

  void togglePasswordVisibility() {
    isPasswordVisible = !_isPasswordVisible;
  }

  void clearForm() {
    _fullNameController.clear();
    _phoneNumberController.clear();
    _emailController.clear();
    _passwordController.clear();
    _profileImage = null;
    _isLoading = false;
    _isPasswordVisible = false;
    notifyListeners();
  }

  @override
  void dispose() {
    _fullNameController.dispose();
    _phoneNumberController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  // Validation methods
  static String? validateFullName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your full name';
    }
    if (value.length < 2) {
      return 'Name must be at least 2 characters';
    }
    return null;
  }

  static String? validatePhoneNumber(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your phone number';
    }
    final phoneRegex = RegExp(r'^[0-9]{10,}$');
    final cleanedValue = value.replaceAll(RegExp(r'[-\s()]'), '');
    if (!phoneRegex.hasMatch(cleanedValue)) {
      return 'Please enter a valid phone number';
    }
    return null;
  }

  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your email address';
    }
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (!emailRegex.hasMatch(value)) {
      return 'Please enter a valid email address';
    }
    return null;
  }

  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter a password';
    }
    if (value.length < 6) {
      return 'Password must be at least 6 characters';
    }
    return null;
  }
}
