import 'package:flutter/material.dart';
import 'package:throw_app/modules/profile_setup_module/widgets/validate_text_input.dart';

class ProfileTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final double screenWidth;
  final bool isDark;
  final TextInputType? keyboardType;
  final bool obscureText;
  final Widget? suffixIcon;
  final ValidateTextInput validator;

  const ProfileTextFormField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.screenWidth,
    required this.isDark,
    this.keyboardType,
    this.obscureText = false,
    this.suffixIcon,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    final fieldHeight = _getFieldHeight(screenWidth);
    final horizontalPadding = _getHorizontalPadding(screenWidth);
    final verticalPadding = _getVerticalPadding(screenWidth);
    final fontSize = _getFontSize(screenWidth);
    final errorFontSize = _getErrorFontSize(screenWidth);

    return Container(
      height: fieldHeight,
      decoration: BoxDecoration(
        color: isDark ? const Color(0xFF1c2a38) : const Color(0xFFe7eef3),
        borderRadius: BorderRadius.circular(12),
      ),
      child: TextFormField(
        controller: controller,
        keyboardType: keyboardType,
        obscureText: obscureText,
        decoration: InputDecoration(
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(
            horizontal: horizontalPadding,
            vertical: verticalPadding,
          ),
          hintText: hintText,
          hintStyle: TextStyle(
            color: isDark ? const Color(0xFFa0b3c4) : const Color(0xFF4c779a),
            fontSize: fontSize,
          ),
          filled: true,
          fillColor: Colors.transparent,
          suffixIcon: suffixIcon,
          errorStyle: TextStyle(fontSize: errorFontSize),
        ),
        style: TextStyle(
          color: isDark ? Colors.white : const Color(0xFF0d151b),
          fontSize: fontSize,
          fontWeight: FontWeight.normal,
        ),
        validator: validator,
      ),
    );
  }

  double _getFieldHeight(double screenWidth) {
    if (screenWidth < 375) return 48;
    if (screenWidth < 600) return 52;
    if (screenWidth < 900) return 56;
    return 60;
  }

  double _getHorizontalPadding(double screenWidth) {
    if (screenWidth < 375) return 12;
    if (screenWidth < 600) return 14;
    if (screenWidth < 900) return 16;
    return 18;
  }

  double _getVerticalPadding(double screenWidth) {
    if (screenWidth < 375) return 12;
    if (screenWidth < 600) return 14;
    if (screenWidth < 900) return 16;
    return 18;
  }

  double _getFontSize(double screenWidth) {
    if (screenWidth < 375) return 14;
    if (screenWidth < 600) return 15;
    if (screenWidth < 900) return 16;
    return 17;
  }

  double _getErrorFontSize(double screenWidth) {
    if (screenWidth < 375) return 12;
    if (screenWidth < 600) return 13;
    if (screenWidth < 900) return 14;
    return 15;
  }
}
