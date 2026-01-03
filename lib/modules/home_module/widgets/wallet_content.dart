// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:throw_app/core/constants/app_colors.dart';
import 'package:throw_app/modules/home_module/widgets/transaction_item.dart';

class WalletContent extends StatelessWidget {
  final bool isDark;
  final bool isSmallScreen;
  final bool isLargeScreen;
  const WalletContent({
    super.key,
    required this.isDark,
    required this.isSmallScreen,
    required this.isLargeScreen,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(isSmallScreen ? 16 : 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Section Title
          Text(
            'Payment History',
            style: TextStyle(
              fontSize: isSmallScreen ? 18 : 22,
              fontWeight: FontWeight.bold,
              color: isDark ? Colors.white : AppColors.textPrimaryLight,
            ),
          ),

          SizedBox(height: isSmallScreen ? 16 : 24),

          // Transactions List
          Expanded(
            child: ListView(
              children: [
                TransactionItem(
                  icon: Icons.refresh,
                  title: 'Refund',
                  subtitle: 'From Throw',
                  amount: '+₹12.00',
                  isPositive: true,
                  isDark: isDark,
                  isSmallScreen: isSmallScreen,
                ),
                SizedBox(height: isSmallScreen ? 12 : 16),
                TransactionItem(
                  icon: Icons.cancel,
                  title: 'Failed Transaction',
                  subtitle: 'To Throw',
                  amount: '-₹12.00',
                  isPositive: false,
                  isDark: isDark,
                  isSmallScreen: isSmallScreen,
                ),
                SizedBox(height: isSmallScreen ? 12 : 16),
                TransactionItem(
                  icon: Icons.refresh,
                  title: 'Refund',
                  subtitle: 'From Throw',
                  amount: '+₹12.00',
                  isPositive: true,
                  isDark: isDark,
                  isSmallScreen: isSmallScreen,
                ),
                SizedBox(height: isSmallScreen ? 12 : 16),
                TransactionItem(
                  icon: Icons.cancel,
                  title: 'Failed Transaction',
                  subtitle: 'To Throw',
                  amount: '-₹12.00',
                  isPositive: false,
                  isDark: isDark,
                  isSmallScreen: isSmallScreen,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
