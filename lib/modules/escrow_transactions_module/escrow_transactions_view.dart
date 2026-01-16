// Flutter representation of the Escrow Transactions dashboard UI
// Note: This is a UI translation, not a 1:1 feature-complete clone.
// Tailwind styles are mapped to Material + basic theming.

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:throw_app/core/models/delivery_request_list.dart';
import 'package:throw_app/core/service/escrow_transcations_service.dart';
import 'package:throw_app/modules/dashboard_module/view/home_screen.dart';
import 'package:throw_app/modules/delivery_request_list_module/view.dart';


class EscrowDashboard extends StatelessWidget {
  const EscrowDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children:  [
          _SideBar(),
          Expanded(child: MainContent()),
        ],
      ),
    );
  }
}


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
               active: true,
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

// ---------------- Main Content ----------------
class MainContent extends StatelessWidget {
  const MainContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        TopBar(),
        Expanded(child: PageBody()),
      ],
    );
  }
}

class TopBar extends StatelessWidget {
  const TopBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 72,
      padding: const EdgeInsets.symmetric(horizontal: 24),
      decoration: const BoxDecoration(
        border: Border(bottom: BorderSide(color: Color(0xFFE5E7EB))),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text('Escrow Transactions',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          
        ],
      ),
    );
  }
}

class PageBody extends StatelessWidget {
  const PageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Escrow Transactions',
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.w900)),
          const SizedBox(height: 4),
          Text('Manage and review all escrow payments within the platform.',
              style: TextStyle(color: Colors.grey[600])),
          const SizedBox(height: 24),
          Expanded(child: TransactionsTable()),
        ],
      ),
    );
  }
}

// ---------------- Table ----------------
class TransactionsTable extends StatelessWidget {
  // final List<Map<String, String>> rows = const [
  //   {
  //     'id': '#T84512',
  //     'users': 'John Doe → Jane Smith',
  //     'delivery': '#D11287',
  //     'amount': '\$45.50',
  //     'status': 'Completed',
  //     'date': '2023-10-26'
  //   },
  //   {
  //     'id': '#T84511',
  //     'users': 'Emily White → Michael Brown',
  //     'delivery': '#D11286',
  //     'amount': '\$120.00',
  //     'status': 'Pending',
  //     'date': '2023-10-25'
  //   },
  // ];

  const TransactionsTable({super.key});

  @override
  Widget build(BuildContext context) {
    final service = EscrowTransactionsService();
    return Card(
      elevation: 1,
      child: StreamBuilder<List<DeliveryRequest>>(
        stream: service.getEscrowPaidRequests(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Center(child: Text('Error loading data'));
          }

          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }

          final requests = snapshot.data!;

          if (requests.isEmpty) {
            return const Center(child: Text('No escrow transactions'));
          }

          return SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: DataTable(
              columns: const [
                DataColumn(label: Text('Request ID')),
                DataColumn(label: Text('Customer')),
                DataColumn(label: Text('Delivery Agent')),
                DataColumn(label: Text('Amount')),
                DataColumn(label: Text('Payment Status')),
                DataColumn(label: Text('Date')),
               // DataColumn(label: Text('Actions')),
              ],
              rows: requests.map(_buildRow).toList(),
            ),
          );
        },
      ),
    );                           
  }

  DataRow _buildRow(DeliveryRequest req) {
    return DataRow(
      cells: [
        DataCell(Text(req.deliveryRequestId,style: const TextStyle(color: Colors.black),)),
        DataCell(Text(req.customerName,style: const TextStyle(color: Colors.black),)),
        DataCell(Text(req.deliveryAgentId,style: const TextStyle(color: Colors.black),)),
        DataCell(Text("₹${req.agreedDeliveryCharge.toStringAsFixed(2)}",style: const TextStyle(color: Colors.black),)),
        DataCell(_statusChip(req.paymentStatus)),
        DataCell(Text(
          "${req.createdAt.day}/${req.createdAt.month}/${req.createdAt.year}",
          style: const TextStyle(color: Colors.black),
        )),
        //const DataCell(Icon(Icons.more_vert)),
      ],
    );
  }

  Widget _statusChip(String status) {
    Color color;

    switch (status) {
      case 'Escrow Amount Paid':
        color = Colors.orange;
        break;
      case 'Escrow Amount Released':
        color = Colors.green;
        break;
      default:
        color = Colors.grey;
    }

    return Chip(
      label: Text(status,style: const TextStyle(color: Colors.black),),
      backgroundColor: color.withOpacity(0.15),
      labelStyle: TextStyle(color: color),
    );
  }
}
     