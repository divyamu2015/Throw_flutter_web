import 'package:flutter/material.dart';
import 'package:throw_app/modules/dashboard_module/widgets/dashboard_content.dart';
import 'package:throw_app/modules/dashboard_module/widgets/sidenavbar.dart';
import 'package:throw_app/modules/dashboard_module/widgets/top_navigationbar.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
   static MaterialPageRoute route() =>
      MaterialPageRoute(builder: (context) => const DashboardPage()); 
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F8F8),
      body: Row(
        children: const [
          SideNavBar(),
          Expanded(
            child: Column(
              children: [
                TopNavBar(),
                Expanded(child: DashboardContent()),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
