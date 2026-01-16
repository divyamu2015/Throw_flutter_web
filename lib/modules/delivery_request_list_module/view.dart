import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:throw_app/core/models/delivery_request_list.dart';
import 'package:throw_app/core/service/delivery_request_list.dart';
import 'package:throw_app/modules/dashboard_module/view/home_screen.dart';
import 'package:throw_app/modules/escrow_transactions_module/escrow_transactions_view.dart';
import 'package:throw_app/modules/view_bid_list_module/view_bid_list_view.dart';

class DeliveryRequestsPage extends StatelessWidget {
  const DeliveryRequestsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F8F8),
      body: Row(
        children: [
          _SideBar(),
          //const SideNavBar(selected: SideNavItem.deliveries),
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
          Row(
            children: [
              CircleAvatar(
                radius: 20,
                child: Icon(Icons.send, color: Color(0xFF0EA5E9), size: 32),
              ),
              SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Throw",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Admin Panel",
                    style: TextStyle(fontSize: 12, color: Colors.grey),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 16),
          _navItem(
            Icons.dashboard,
            "Dashboard",
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const DashboardPage()),
              );
            },
          ),
          _navItem(
            Icons.local_shipping,
            "Deliveries",
            active: true,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const DeliveryRequestsPage(),
                ),
              );
            },
          ),
          _navItem(
            Icons.wallet,
            "Escrow Transactions",
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const EscrowDashboard(),
                ),
              );
            },
          ),
          //   _navItem(Icons.wallet, "View Bid List",onTap: () {
          //   Navigator.push(
          //     context,
          //     MaterialPageRoute(
          //       builder: (context) => const BidListPage(),
          //     ),
          //   );
          // },),
          const Spacer(),
          _navItem(Icons.logout, "Logout"),
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
            // fontWeight: FontWeight.w500,
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
            "Delivery Requests",
            style: GoogleFonts.inter(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: const Color.fromARGB(255, 99, 99, 99),
            ),
          ),
          // const Row(
          //   children: [
          //     Icon(Icons.notifications_outlined),
          //     SizedBox(width: 16),
          //     CircleAvatar(radius: 18),
          //   ],
          // ),
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
    final service = DeliveryRequestService();

    return Padding(
      padding: const EdgeInsets.all(24),
      child: StreamBuilder<List<DeliveryRequest>>(
        stream: service.getDeliveryRequests(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text("No delivery requests found"));
          }

          final requests = snapshot.data!
              .where((req) => req.deliveryRequestId.trim().isNotEmpty)
              .toList();

          return SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: DataTable(
              columns: const [
                DataColumn(label: Text("Request ID")),
                DataColumn(label: Text("Pickup")),
                DataColumn(label: Text("Drop")),
                DataColumn(label: Text("Package")),
                DataColumn(label: Text("Weight")),
                DataColumn(label: Text("Charge")),
                DataColumn(label: Text("Status")),
                DataColumn(label: Text("Pickup Date")),
                DataColumn(label: Text("Drop Date")),
                DataColumn(label: Text("Agent ID")),
              ],
              rows: requests.map((req) {
                return DataRow(
                  onSelectChanged: (_) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => BidListPage(
                          deliveryRequestDocId: req.id, // 🔥 Firestore doc id
                        ),
                      ),
                    );
                  },
                  cells: [
                    DataCell(
                      Text(
                        req.deliveryRequestId,
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                    DataCell(
                      Text(
                        req.pickupAddress,
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                    DataCell(
                      Text(
                        req.dropOffAddress,
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                    DataCell(
                      Text(
                        req.packageType,
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                    DataCell(
                      Text(
                        "${req.packageWeight} kg",
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                    DataCell(
                      Text(
                        "₹${req.agreedDeliveryCharge}",
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                    DataCell(
                      Chip(
                        label: Text(req.deliveryStatus),
                        backgroundColor: _statusColor(req.deliveryStatus),
                      ),
                    ),
                    DataCell(
                      Text(
                        "${req.pickupDate.day}/${req.pickupDate.month}/${req.pickupDate.year}",
                        style: const TextStyle(color: Colors.black),
                      ),
                    ),
                    DataCell(
                      Text(
                        "${req.dropOffDate.day}/${req.dropOffDate.month}/${req.dropOffDate.year}",
                        style: const TextStyle(color: Colors.black),
                      ),
                    ),
                    DataCell(
                      Text(
                        req.deliveryAgentId,
                        style: const TextStyle(color: Colors.black),
                      ),
                    ),
                  ],
                );
              }).toList(),
            ),
          );
        },
      ),
    );
  }

  Color _statusColor(String status) {
    switch (status.toLowerCase()) {
      case "completed":
        return Colors.green.shade100;
      case "pending":
        return Colors.orange.shade100;
      case "cancelled":
        return Colors.red.shade100;
      default:
        return Colors.grey.shade200;
    }
  }
}
