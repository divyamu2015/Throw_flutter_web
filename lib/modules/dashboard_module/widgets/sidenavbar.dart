import 'package:flutter/material.dart';
import 'package:throw_app/modules/customer_list_module/view.dart';
import 'package:throw_app/modules/delivery_module/delivery_agent_list/delivery_agent_view.dart';

class SideNavBar extends StatelessWidget {
  const SideNavBar({super.key});

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
            children: const [
              CircleAvatar(radius: 20),
              SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Throw", style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black)),
                  SizedBox(height: 10,),
                  Text("Admin Panel",
                      style: TextStyle(fontSize: 12, color: Colors.grey,)),
                ],
              )
            ],
          ),
          const SizedBox(height: 24),
          NavItem(Icons.dashboard, "Dashboard", active: true),
          NavItem(Icons.local_shipping, "Deliveries",onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => const DeliveryAgentApproval()));
          },),
          NavItem(Icons.group, "Customers",onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => const CustomersPage()));
          },),
          NavItem(Icons.shield, "Agents",onTap: () {
            
          },),
        //  NavItem(Icons.settings, "Settings"),
        ],
      ),
    );
  }
}

class NavItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final bool active;
  final VoidCallback? onTap;

  const NavItem(this.icon, this.title, {this.active = false, this.onTap, super.key});

  @override
  Widget build(BuildContext context) {
    final color = active ? const Color(0xFF00BFFF) : Colors.black87;

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
            Icon(icon, color: color),
            const SizedBox(width: 12),
            Text(title, style: TextStyle(color: color)),
          ],
        ),
      ),
    );
  }
}
