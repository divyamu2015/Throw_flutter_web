// continue_button.dart
import 'package:flutter/material.dart';
import 'package:throw_app/core/constants/app_colors.dart';
import 'package:throw_app/modules/profile_setup_module/utils/profile_setup_helper.dart';

class ContinueButton extends StatelessWidget {
  final double screenWidth;
  final bool isLoading;
  final VoidCallback onPressed;

  const ContinueButton({
    super.key,
    required this.screenWidth,
    required this.isLoading,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final buttonPadding = ProfileSetupHelper.getButtonPadding(screenWidth);
    final buttonHeight = ProfileSetupHelper.getButtonHeight(screenWidth);
    final fontSize = ProfileSetupHelper.getFontSize(screenWidth);

    return Container(
      padding: EdgeInsets.all(buttonPadding),
      color: AppColors.getBackgroundColor(
        Theme.of(context).brightness == Brightness.dark,
      ),
      child: Container(
        width: double.infinity,
        height: buttonHeight,
        decoration: BoxDecoration(
          color: AppColors.primary,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: AppColors.primary.withValues(alpha: 0.3),
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: TextButton(
          onPressed: isLoading ? null : onPressed,
          style: TextButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          child: isLoading
              ? const SizedBox(
                  width: 20,
                  height: 20,
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                  ),
                )
              : Text(
                  'Continue',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: fontSize,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 0.5,
                  ),
                ),
        ),
      ),
    );
  }
}
