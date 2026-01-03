import 'package:flutter/material.dart';

class AccountItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final String? subtitle;
  final Color primaryColor;
  final Color textSecondaryColor;
  final bool hasArrow;
  final bool isSmallScreen;
  const AccountItem({
    super.key,
    required this.icon,
    required this.title,
    this.subtitle,
    required this.primaryColor,
    required this.textSecondaryColor,
    this.hasArrow = false,
    this.isSmallScreen = false,
  });

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final isVerySmallScreen = mediaQuery.size.width < 400;
    final isDark = Theme.of(context).brightness == Brightness.dark;

    // Responsive dimensions
    final iconSize = isVerySmallScreen ? 40.0 : 48.0;
    final iconInnerSize = isVerySmallScreen ? 20.0 : 24.0;
    final spacing = isVerySmallScreen ? 12.0 : 16.0;
    final titleFontSize = isVerySmallScreen ? 16.0 : 18.0;
    final subtitleFontSize = isVerySmallScreen ? 14.0 : 16.0;
    final itemPadding = isVerySmallScreen ? 12.0 : 16.0;

    return Container(
      margin: EdgeInsets.only(bottom: isVerySmallScreen ? 8 : 12),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(12),
          onTap: () {},
          child: Container(
            padding: EdgeInsets.all(itemPadding),
            child: Row(
              children: [
                Container(
                  width: iconSize,
                  height: iconSize,
                  decoration: BoxDecoration(
                    color: primaryColor.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Icon(icon, color: primaryColor, size: iconInnerSize),
                ),
                SizedBox(width: spacing),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: TextStyle(
                          fontSize: titleFontSize,
                          fontWeight: FontWeight.w500,
                          color: isDark
                              ? Colors.white
                              : const Color(0xFF111518),
                        ),
                      ),
                      if (subtitle != null) ...[
                        const SizedBox(height: 2),
                        Text(
                          subtitle!,
                          style: TextStyle(
                            fontSize: subtitleFontSize,
                            color: textSecondaryColor,
                          ),
                        ),
                      ],
                    ],
                  ),
                ),
                if (hasArrow)
                  Icon(
                    Icons.arrow_forward_ios_rounded,
                    size: isVerySmallScreen ? 16 : 18,
                    color: textSecondaryColor,
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
