import 'package:flutter/material.dart';
import 'package:throw_app/core/constants/app_colors.dart';

import 'package:throw_app/modules/home_module/typedefs/selecting_nav_tab.dart';

class HomePageNavItem extends StatelessWidget {
  final IconData icon;
  final IconData activeIcon;
  final String label;
  final int index;
  final int currentIndex;
  final SelectingNavTab onSelectingNavTab;
  final double iconSize;
  final double fontSize;
  const HomePageNavItem({
    super.key,
    required this.icon,
    required this.activeIcon,
    required this.label,
    required this.index,
    required this.currentIndex,
    required this.onSelectingNavTab,
    this.iconSize = 24,
    this.fontSize = 12,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    bool isSelected = currentIndex == index;

    const primaryColor = AppColors.primary;
    const selectedColor = primaryColor;
    final unselectedColor = AppColors.getTextSecondaryColor(isDark);

    return GestureDetector(
      onTap: () {
        onSelectingNavTab(index);
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            isSelected ? activeIcon : icon,
            color: isSelected ? selectedColor : unselectedColor,
            size: iconSize,
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(
              fontSize: fontSize,
              fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
              color: isSelected ? selectedColor : unselectedColor,
            ),
          ),
        ],
      ),
    );
  }
}
