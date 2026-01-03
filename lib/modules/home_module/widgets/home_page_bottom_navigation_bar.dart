import 'package:flutter/material.dart';
import 'package:throw_app/modules/home_module/typedefs/selecting_nav_tab.dart';
import 'package:throw_app/modules/home_module/widgets/home_page_nav_item.dart';

class HomePageBottomNavigationBar extends StatelessWidget {
  final int currentIndex;
  final SelectingNavTab onSelectingNavTab;
  const HomePageBottomNavigationBar({
    super.key,
    required this.currentIndex,
    required this.onSelectingNavTab,
  });

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final isVerySmallScreen = mediaQuery.size.width < 400;
    final isDark = Theme.of(context).brightness == Brightness.dark;

    // Color definitions
    final backgroundColor = isDark ? const Color(0xFF182430) : Colors.white;
    final borderColor = isDark
        ? const Color(0xFF374151)
        : Colors.grey.withValues(alpha: 0.3);

    // Responsive dimensions
    final barHeight = isVerySmallScreen ? 60.0 : 70.0;
    final iconSize = isVerySmallScreen ? 20.0 : 24.0;
    final fontSize = isVerySmallScreen ? 10.0 : 12.0;

    return Container(
      decoration: BoxDecoration(
        border: Border(top: BorderSide(color: borderColor, width: 1)),
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
      ),
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
        child: BottomAppBar(
          color: backgroundColor,
          elevation: 8,
          shadowColor: Colors.black.withValues(alpha: 0.1),
          child: SizedBox(
            height: barHeight,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                HomePageNavItem(
                  icon: Icons.home_outlined,
                  activeIcon: Icons.home,
                  label: 'Home',
                  index: 0,
                  currentIndex: currentIndex,
                  onSelectingNavTab: onSelectingNavTab,
                  iconSize: iconSize,
                  fontSize: fontSize,
                ),
                HomePageNavItem(
                  icon: Icons.local_shipping_outlined,
                  activeIcon: Icons.local_shipping,
                  label: 'Deliveries',
                  index: 1,
                  currentIndex: currentIndex,
                  onSelectingNavTab: onSelectingNavTab,
                  iconSize: iconSize,
                  fontSize: fontSize,
                ),
                HomePageNavItem(
                  icon: Icons.account_balance_wallet_outlined,
                  activeIcon: Icons.account_balance_wallet,
                  label: 'Wallet',
                  index: 2,
                  currentIndex: currentIndex,
                  onSelectingNavTab: onSelectingNavTab,
                  iconSize: iconSize,
                  fontSize: fontSize,
                ),
                HomePageNavItem(
                  icon: Icons.person_outlined,
                  activeIcon: Icons.person,
                  label: 'Profile',
                  index: 3,
                  currentIndex: currentIndex,
                  onSelectingNavTab: onSelectingNavTab,
                  iconSize: iconSize,
                  fontSize: fontSize,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
