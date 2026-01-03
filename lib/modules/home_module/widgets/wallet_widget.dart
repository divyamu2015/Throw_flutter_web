// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:throw_app/modules/home_module/widgets/wallet_content.dart';
import 'package:throw_app/modules/home_module/widgets/wallet_header.dart';

class WalletWidget extends StatelessWidget {
  const WalletWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final isSmallScreen = screenSize.width < 375;
    final isLargeScreen = screenSize.width > 600;
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Column(
      children: [
        // Header Section
        WalletHeader(isDark: isDark, isSmallScreen: isSmallScreen),

        // Main Content
        Expanded(
          child: WalletContent(
            isDark: isDark,
            isSmallScreen: isSmallScreen,
            isLargeScreen: isLargeScreen,
          ),
        ),
      ],
    );
  }
}
