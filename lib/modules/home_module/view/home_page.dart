import 'package:flutter/material.dart';
import 'package:throw_app/core/constants/app_colors.dart';
import 'package:throw_app/modules/home_module/widgets/home_page_bottom_navigation_bar.dart';
import 'package:throw_app/modules/home_module/widgets/home_tab_widget.dart';
import 'package:throw_app/modules/home_module/widgets/profile_widget.dart';
//import 'package:throw_app/modules/home_module/widgets/recent_deliveries_widget.dart';
import 'package:throw_app/modules/home_module/widgets/wallet_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();

  static MaterialPageRoute route() =>
      MaterialPageRoute(builder: (context) => const HomePage());
}

class _HomePageState extends State<HomePage> {
  final ValueNotifier<int> _currentIndex = ValueNotifier<int>(0);

  late final List<Widget> _tabs;

  @override
  void initState() {
    super.initState();

    _tabs = [
      const HomeTabWidget(),
     // const RecentDeliveriesWidget(),
      const WalletWidget(),
      const ProfileWidget(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    // Color definitions
    final backgroundColor = AppColors.getBackgroundColor(isDark);
    final cardColor = AppColors.getCardColor(isDark);
    final textPrimaryColor = AppColors.getTextPrimaryColor(isDark);

    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        title: Text(
          'Throw',
          style: TextStyle(
            color: textPrimaryColor,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: cardColor,
        elevation: 2,
        shadowColor: Colors.black.withValues(alpha: 0.1),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications_outlined, color: textPrimaryColor),
            onPressed: () {},
          ),
        ],
      ),
      body: ValueListenableBuilder(
        valueListenable: _currentIndex,
        builder: (context, currentIndex, child) {
          return _tabs[currentIndex];
        },
      ),
      bottomNavigationBar: ValueListenableBuilder(
        valueListenable: _currentIndex,
        builder: (context, currentIndex, child) {
          return HomePageBottomNavigationBar(
            currentIndex: currentIndex,
            onSelectingNavTab: (index) {
              _currentIndex.value = index;
            },
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    _currentIndex.dispose();
    super.dispose();
  }
}
