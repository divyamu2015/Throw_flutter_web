import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:throw_app/core/models/delivery_request_list.dart';
import 'package:throw_app/core/service/delivery_request_list.dart';

class DeliveryRequestsPage extends StatelessWidget {
  const DeliveryRequestsPage({super.key});

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
          _navItem(Icons.local_shipping, "Delivery Requests", active: true),
          _navItem(Icons.shield, "Agents"),
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
            "Delivery Requests",
            style: GoogleFonts.inter(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const Row(
            children: [
              Icon(Icons.notifications_outlined),
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
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _header(),
          const SizedBox(height: 24),
          Expanded(child: _table()),
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
        "Delivery Request Management",
        style: GoogleFonts.inter(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
    );
  }

  Widget _table() {
    final service = DeliveryRequestService();

    return StreamBuilder<List<DeliveryRequest>>(
      stream: service.getDeliveryRequests(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }

        if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const Center(child: Text("No delivery requests found"));
        }

        final requests = snapshot.data!;

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
            ],
            rows: requests.map((req) {
              return DataRow(
                cells: [
                  DataCell(Text(req.deliveryRequestId)),
                  DataCell(Text(req.pickupAddress)),
                  DataCell(Text(req.dropOffAddress)),
                  DataCell(Text(req.packageType)),
                  DataCell(Text("${req.packageWeight} kg")),
                  DataCell(Text("₹${req.agreedDeliveryCharge}")),
                  DataCell(
                    Chip(
                      label: Text(req.deliveryStatus),
                      backgroundColor: _statusColor(req.deliveryStatus),
                    ),
                  ),
                ],
              );
            }).toList(),
          ),
        );
      },
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
