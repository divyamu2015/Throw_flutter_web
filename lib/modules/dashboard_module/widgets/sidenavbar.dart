import 'package:flutter/material.dart';
import 'package:throw_app/modules/customer_list_module/view.dart';
import 'package:throw_app/modules/dashboard_module/view/home_screen.dart';
import 'package:throw_app/modules/dashboard_module/widgets/enum_sidenavbar.dart';
import 'package:throw_app/modules/delivery_module/delivery_agent_list/delivery_agent_view.dart';
import 'package:throw_app/modules/delivery_request_list_module/view.dart';

class SideNavBar extends StatelessWidget {
  final SideNavItem selected;

  const SideNavBar({
    super.key,
    required this.selected,
  });

  void _navigate(
    BuildContext context,
    Widget page,
  ) {
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (_) => page),
      (route) => false, // clears stack
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 260,
      padding: const EdgeInsets.all(16),
      decoration: const BoxDecoration(
        color: Colors.white,
        border: Border(right: BorderSide(color: Colors.black12)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(radius: 20,
              child:Icon(Icons.send,color: Color(0xFF0EA5E9), size: 32),
                             ),
              SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Throw",
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.black),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Admin Panel",
                    style: TextStyle(fontSize: 12, color: Colors.grey),
                  ),
                ],
              )
            ],
          ),
          const SizedBox(height: 24),

          /// DASHBOARD
          NavItem(
            Icon(Icons.dashboard,),
            "Dashboard",
            active: selected == SideNavItem.dashboard,
            onTap: () => _navigate(context, const DashboardPage()),
          ),

          /// DELIVERIES
          NavItem(
            Icon(Icons.local_shipping),
            "Deliveries",
            active: selected == SideNavItem.deliveries,
            onTap: () => _navigate(context, const DeliveryRequestsPage()),
          ),

          /// CUSTOMERS
          NavItem(
            Icon(Icons.group),
            "Customers",
            active: selected == SideNavItem.customers,
            onTap: () => _navigate(context, const CustomersPage()),
          ),

          /// AGENTS
          NavItem(
            Icon(Icons.shield),
            "Agents",
            active: selected == SideNavItem.agents,
            onTap: () =>
                _navigate(context, const DeliveryAgentApproval()),
          ),
        ],
      ),
    );
  }
}


class NavItem extends StatelessWidget {
  final Icon icon;
  final String title;
  final bool active;
  final VoidCallback? onTap;

  const NavItem(this.icon, this.title, {this.active = false, this.onTap, super.key});

  @override
  Widget build(BuildContext context) {
    final color = active ? const Color(0xFF00BFFF) : Colors.blueGrey;

    return InkWell(
       onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        margin: const EdgeInsets.only(bottom: 8),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        decoration: BoxDecoration(
          color: active ? color.withOpacity(0.15) : Colors.transparent,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            Icon(icon.icon, color: color),
            const SizedBox(width: 12),
            Text(title, style: TextStyle(color: color)),
          ],
        ),
      ),
    );
  }
}
