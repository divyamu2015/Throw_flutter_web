// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:throw_app/core/constants/app_colors.dart';

class TransactionItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final String amount;
  final bool isPositive;
  final bool isDark;
  final bool isSmallScreen;
  const TransactionItem({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.amount,
    required this.isPositive,
    required this.isDark,
    required this.isSmallScreen,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(isSmallScreen ? 16 : 20),
      decoration: BoxDecoration(
        color: isDark ? AppColors.backgroundDark : Colors.white,
        borderRadius: BorderRadius.circular(isSmallScreen ? 12 : 16),
        border: isDark
            ? Border.all(color: Colors.white.withValues(alpha: 0.1), width: 1)
            : null,
        boxShadow: isDark
            ? null
            : [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.05),
                  blurRadius: 8,
                  offset: const Offset(0, 2),
                ),
              ],
      ),
      child: Row(
        children: [
          // Icon Container
          Container(
            width: isSmallScreen ? 48 : 56,
            height: isSmallScreen ? 48 : 56,
            decoration: BoxDecoration(
              color: isPositive
                  ? AppColors.primary.withValues(alpha: 0.1)
                  : AppColors.error.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(isSmallScreen ? 24 : 28),
            ),
            child: Icon(
              icon,
              color: isPositive ? AppColors.primary : AppColors.error,
              size: isSmallScreen ? 24 : 28,
            ),
          ),

          SizedBox(width: isSmallScreen ? 16 : 20),

          // Text Content
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: isSmallScreen ? 16 : 18,
                    fontWeight: FontWeight.bold,
                    color: isDark ? Colors.white : AppColors.textPrimaryLight,
                  ),
                ),
                SizedBox(height: isSmallScreen ? 4 : 6),
                Text(
                  subtitle,
                  style: TextStyle(
                    fontSize: isSmallScreen ? 14 : 16,
                    color: isDark
                        ? Colors.white.withValues(alpha: 0.6)
                        : AppColors.textPrimaryLight.withValues(alpha: 0.6),
                  ),
                ),
              ],
            ),
          ),

          SizedBox(width: isSmallScreen ? 12 : 16),

          // Amount
          Text(
            amount,
            style: TextStyle(
              fontSize: isSmallScreen ? 16 : 18,
              fontWeight: FontWeight.w600,
              color: isPositive
                  ? AppColors
                        .success // Green for positive
                  : AppColors.error, // Red for negative
            ),
          ),
        ],
      ),
    );
  }
}
