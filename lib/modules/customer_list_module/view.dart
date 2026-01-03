import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:throw_app/core/models/customer_list.dart';
import 'package:throw_app/core/service/custome_service.dart';
import 'package:throw_app/modules/delivery_module/delivery_agent_list/delivery_agent_view.dart';

class CustomersPage extends StatelessWidget {
  const CustomersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F8F8),
      body: Row(
        children: [
          const _SideBar(),
          Expanded(
            child: Column(
              children: const [
                _TopBar(),
                Expanded(child: _ContentArea()),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

/* ===================== SIDEBAR ===================== */

class _SideBar extends StatelessWidget {
  const _SideBar();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 260,
      color: Colors.white,
      child: Column(
        children: [
          const SizedBox(height: 24),
          ListTile(
            leading: const CircleAvatar(radius: 20),
            title: Text(
              "Admin User",
              style: GoogleFonts.inter(fontWeight: FontWeight.w600),
            ),
            subtitle: Text(
              "admin@throw.com",
              style: GoogleFonts.inter(fontSize: 12),
            ),
          ),
          const SizedBox(height: 16),
          _navItem(Icons.dashboard, "Dashboard"),
          _navItem(Icons.group, "Customers", active: true),
          _navItem(Icons.local_shipping, "Deliveries",onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => const DeliveryAgentApproval()));
          }),
          _navItem(Icons.shield, "Agents",onTap: () {}),
          const Spacer(),
          _navItem(Icons.logout, "Logout", onTap: () {}),
          const SizedBox(height: 16),
        ],
      ),
    );
  }

  Widget _navItem(
    IconData icon,
    String label, {
    bool active = false,
    VoidCallback? onTap,
  }) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      decoration: BoxDecoration(
        color: active ? Colors.lightBlue.withOpacity(0.2) : null,
        borderRadius: BorderRadius.circular(12),
      ),
      child: ListTile(
        onTap: onTap,
        leading: Icon(icon, color: active ? Colors.lightBlue : Colors.grey),
        title: Text(
          label,
          style: GoogleFonts.inter(
            fontWeight: FontWeight.w500,
            color: active ? Colors.lightBlue : Colors.black87,
          ),
        ),
      ),
    );
  }
}

/* ===================== TOP BAR ===================== */

class _TopBar extends StatelessWidget {
  const _TopBar();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      padding: const EdgeInsets.symmetric(horizontal: 24),
      decoration: const BoxDecoration(
        color: Colors.white,
        border: Border(bottom: BorderSide(color: Colors.black12)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Customers",
            style: GoogleFonts.inter(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          Row(
            children: const [
              Icon(Icons.notifications_outlined),
              SizedBox(width: 16),
              Icon(Icons.help_outline),
              SizedBox(width: 16),
              CircleAvatar(radius: 18),
            ],
          ),
        ],
      ),
    );
  }
}

/* ===================== CONTENT ===================== */

class _ContentArea extends StatelessWidget {
  const _ContentArea();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _header(),
          const SizedBox(height: 24),
          _filters(),
          const SizedBox(height: 24),
          _table(),
          const SizedBox(height: 16),
          _pagination(),
        ],
      ),
    );
  }

  Widget _header() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.lightBlue,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Text(
        "Customer Management",
        style: GoogleFonts.inter(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
    );
  }

  Widget _filters() {
    return Row(
      children: [
        Expanded(
          child: TextField(
            decoration: InputDecoration(
              prefixIcon: const Icon(Icons.search),
              hintText: "Search by name, email, or phone...",
              filled: true,
              fillColor: Colors.white,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide.none,
              ),
            ),
          ),
        ),
        const SizedBox(width: 12),
        ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.lightBlue,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          child: const Text("Add Customer"),
        ),
      ],
    );
  }

  Widget _table() {
    final customerService = CustomerService();

    return StreamBuilder<List<Customer>>(
      stream: customerService.getCustomers(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return const Center(child: Text("Error fetching customers"));
        }

        if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const Center(child: Text("No customers found"));
        }

        final customers = snapshot.data!;

        // Remove the SizedBox with fixed height and the extra SingleChildScrollView
        return SingleChildScrollView(
          // This SingleChildScrollView is for horizontal scrolling if needed
          scrollDirection: Axis
              .horizontal, // Changed to horizontal for potential wider tables
          child: DataTable(
            columns: const [
              DataColumn(label: Text("Customer Name")),
              DataColumn(label: Text("Phone")),
              DataColumn(label: Text("Email")),
            ],
            rows: customers.map((customer) {
              return DataRow(
                cells: [
                  DataCell(
                    Text(customer.name, style: TextStyle(color: Colors.black)),
                  ),
                  DataCell(
                    Text(
                      customer.phone.isEmpty ? '-' : customer.phone,
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                  DataCell(
                    Text(customer.email, style: TextStyle(color: Colors.black)),
                  ),
                ],
              );
            }).toList(),
          ),
        );
      },
    );
  }

  // DataRow _row(
  //   String name,
  //   String phone,
  //   String email,
  // //  bool active,
  //  // int deliveries,
  // ) {
  //   return DataRow(cells: [
  //     DataCell(Text(name)),
  //     DataCell(Text(phone)),
  //     DataCell(Text(email)),
  //     // DataCell(
  //     //   Chip(
  //     //     label: Text(active ? "Active" : "Suspended"),
  //     //     backgroundColor: active ? Colors.green.shade100 : Colors.red.shade100,
  //     //   ),
  //     // ),
  //     // DataCell(Text(deliveries.toString())),
  //     //const DataCell(Text("View Profile")),
  //   ]);
  // }

  Widget _pagination() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text("Showing 1–5 of 1000"),
        Row(
          children: [
            TextButton(onPressed: () {}, child: const Text("Previous")),
            TextButton(onPressed: () {}, child: const Text("Next")),
          ],
        ),
      ],
    );
  }
}
