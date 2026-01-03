// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:throw_app/core/constants/app_colors.dart';

class WalletHeader extends StatelessWidget {
  const WalletHeader({
    super.key,
    required this.isDark,
    required this.isSmallScreen,
  });
  final bool isDark;
  final bool isSmallScreen;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.only(
        left: isSmallScreen ? 16 : 24,
        right: isSmallScreen ? 16 : 24,
        top: isSmallScreen ? 24 : 32,
        bottom: isSmallScreen ? 16 : 24,
      ),
      decoration: BoxDecoration(
        color: AppColors.primary,
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.1),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          // Navigation Row
          Text(
            'Escrow Wallet',
            style: TextStyle(
              fontSize: isSmallScreen ? 20 : 24,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),

          // Spacer for balance
          SizedBox(width: isSmallScreen ? 40 : 48),

          SizedBox(height: isSmallScreen ? 24 : 32),

          // Balance Section
          Column(
            children: [
              Text(
                'Available Balance',
                style: TextStyle(
                  fontSize: isSmallScreen ? 14 : 16,
                  color: Colors.white.withValues(alpha: 0.8),
                ),
              ),
              SizedBox(height: isSmallScreen ? 8 : 12),
              Text(
                '₹250.00',
                style: TextStyle(
                  fontSize: isSmallScreen ? 36 : 48,
                  fontWeight: FontWeight.w800,
                  color: Colors.white,
                  letterSpacing: -0.5,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// To use this page, you can navigate to it like this:
// Navigator.push(context, MaterialPageRoute(builder: (context) => WalletPage()));
