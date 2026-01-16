import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:throw_app/core/models/view_bid_list._model.dart';
import 'package:throw_app/core/service/view_bid_list_service.dart';
import 'package:throw_app/modules/dashboard_module/view/home_screen.dart';
import 'package:throw_app/modules/delivery_request_list_module/view.dart';
import 'package:throw_app/modules/escrow_transactions_module/escrow_transactions_view.dart';

class BidListPage extends StatelessWidget {
  final String deliveryRequestDocId;

  const BidListPage({super.key, required this.deliveryRequestDocId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F8F8),
      body: Row(
        children: [
          _SideBar(),
          Expanded(
            child: Column(
              children: [
                _TopBar(),
               Expanded(child: _ContentArea(deliveryRequestDocId: deliveryRequestDocId)),

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
          const SizedBox(height: 16),
          _navItem(
            Icons.dashboard,
            "Dashboard",
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const DashboardPage()),
              );
            },
          ),
          _navItem(
            Icons.local_shipping,
            "Deliveries",
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const DeliveryRequestsPage()),
              );
            },
          ),
          // _navItem(
          //   Icons.wallet,
          //   "Escrow Transactions",
          //   onTap: () {
          //     Navigator.push(
          //       context,
          //       MaterialPageRoute(builder: (_) => const EscrowDashboard()),
          //     );
          //   },
          // ),
          _navItem(Icons.list_alt, "View Bid List", active: true),
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
            "Bid List",
            style: GoogleFonts.inter(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: const Color.fromARGB(255, 99, 99, 99),
            ),
          ),
        ],
      ),
    );
  }
}

/* ===================== CONTENT ===================== */

class _ContentArea extends StatelessWidget {
  final String deliveryRequestDocId;

  const _ContentArea({required this.deliveryRequestDocId});

  @override
  Widget build(BuildContext context) {
    final service = BidService();

    // final String deliveryRequestDocId =
    //     (ModalRoute.of(context)!.settings.arguments as String);

    return Padding(
      padding: const EdgeInsets.all(24),
      child: FutureBuilder<List<BidModel>>(
        future: service.getBids(deliveryRequestDocId),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text("No bids found"));
          }

          final bids = snapshot.data!;

          return SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: DataTable(
              columns: const [
                DataColumn(label: Text("Agent",style: TextStyle(color: Colors.black,
                fontSize: 16),)),
                DataColumn(label: Text("Agent Name",style: TextStyle(color: Colors.black, fontSize: 16),)),
                DataColumn(label: Text("Bid Amount",style: TextStyle(color: Colors.black, fontSize: 16),)),
                DataColumn(label: Text("Bargain Amount",style: TextStyle(color: Colors.black, fontSize: 16),)),
                DataColumn(label: Text("Status",style: TextStyle(color: Colors.black, fontSize: 16),)),
              ],
              rows: bids.map((bid) {
                return DataRow(
                  cells: [
                    DataCell(
                      CircleAvatar(
                        backgroundImage: bid.agentAvatarUrl.isNotEmpty
                            ? NetworkImage(bid.agentAvatarUrl)
                            : null,
                        child: bid.agentAvatarUrl.isEmpty
                            ? const Icon(Icons.person)
                            : null,
                      ),
                    ),
                    DataCell(Text(bid.agentName,style: TextStyle(color: Colors.black),)),
                    DataCell(Text("₹${bid.bidAmount.toStringAsFixed(2)}",style: TextStyle(color: Colors.black),)),
                    DataCell(Text("₹${bid.bargainAmount.toStringAsFixed(2)}",style: TextStyle(color: Colors.black),)),
                    DataCell(_statusChip(bid.bidStatus)),
                  ],
                );
              }).toList(),
            ),
          );
        },
      ),
    );
  }

  Widget _statusChip(String status) {
    Color color;

    switch (status.toLowerCase()) {
      case "accepted":
        color = Colors.green;
        break;
      case "rejected":
        color = Colors.red;
        break;
      default:
        color = Colors.orange;
    }

    return Chip(
      label: Text(status),
      backgroundColor: color.withOpacity(0.15),
      labelStyle: TextStyle(color: color),
    );
  }
}
