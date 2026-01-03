import 'package:flutter/material.dart';
import 'package:throw_app/core/constants/app_colors.dart';

class GridButtonItem extends StatelessWidget {
  final String iconImageUrl;
  final String title;
  final Function onTap;
  const GridButtonItem({
    super.key,
    required this.iconImageUrl,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final isVerySmallScreen = mediaQuery.size.width < 400;
    final isDark = Theme.of(context).brightness == Brightness.dark;

    // Color definitions
    final cardColor = AppColors.getCardColor(isDark);
    final textColor = AppColors.getTextPrimaryColor(isDark);

    // Responsive dimensions
    final padding = isVerySmallScreen ? 12.0 : 16.0;
    final iconContainerSize = isVerySmallScreen ? 48.0 : 64.0;
    final titleFontSize = isVerySmallScreen ? 12.0 : 14.0;
    final spacing = isVerySmallScreen ? 6.0 : 8.0;

    return Card(
      elevation: 2,
      color: cardColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: InkWell(
        onTap: () => onTap(),
        borderRadius: BorderRadius.circular(12),
        child: Container(
          padding: EdgeInsets.all(padding),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: iconContainerSize,
                height: iconContainerSize,
                decoration: BoxDecoration(
                  color: AppColors.primary.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(
                    isVerySmallScreen ? 16 : 24,
                  ),
                ),
                child: Center(
                  child: Image.asset(
                    iconImageUrl,
                    width: iconContainerSize * 0.6,
                    height: iconContainerSize * 0.6,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              SizedBox(height: spacing),
              Text(
                title,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: titleFontSize,
                  fontWeight: FontWeight.w600,
                  color: textColor,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
