import 'package:flutter/material.dart';
import 'package:throw_app/core/constants/app_colors.dart';

class ProfileSetupHeader extends StatelessWidget {
  final bool isDark;
  final double screenWidth;
  final VoidCallback onBackPressed;

  const ProfileSetupHeader({
    super.key,
    required this.isDark,
    required this.screenWidth,
    required this.onBackPressed,
  });

  @override
  Widget build(BuildContext context) {
    final padding = _getPadding(screenWidth);
    final iconSize = _getIconSize(screenWidth);
    final fontSize = _getFontSize(screenWidth);

    return Container(
      color: AppColors.getBackgroundColor(isDark),
      child: Padding(
        padding: EdgeInsets.all(padding),
        child: Row(
          children: [
            // Back Button
            IconButton(
              onPressed: onBackPressed,
              icon: Icon(
                Icons.arrow_back,
                color: isDark ? Colors.white : AppColors.textPrimaryLight,
                size: iconSize,
              ),
              padding: EdgeInsets.all(padding * 0.5),
              constraints: const BoxConstraints(),
            ),
            // Title
            Expanded(
              child: Text(
                'Profile Setup',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: fontSize,
                  fontWeight: FontWeight.bold,
                  color: isDark ? Colors.white : AppColors.textPrimaryLight,
                ),
              ),
            ),
            // Balance the row with invisible container
            SizedBox(width: iconSize + padding * 0.5),
          ],
        ),
      ),
    );
  }

  double _getPadding(double screenWidth) {
    if (screenWidth < 375) return 12;
    if (screenWidth < 600) return 16;
    if (screenWidth < 900) return 20;
    return 24;
  }

  double _getIconSize(double screenWidth) {
    if (screenWidth < 375) return 20;
    if (screenWidth < 600) return 24;
    if (screenWidth < 900) return 28;
    return 32;
  }

  double _getFontSize(double screenWidth) {
    if (screenWidth < 375) return 18;
    if (screenWidth < 600) return 20;
    if (screenWidth < 900) return 22;
    return 24;
  }
}
