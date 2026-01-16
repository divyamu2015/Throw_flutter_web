import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:throw_app/core/models/view_feedback_model.dart';
import 'package:throw_app/core/service/view_feedback_service.dart';
import 'package:throw_app/modules/dashboard_module/widgets/enum_sidenavbar.dart';
import 'package:throw_app/modules/dashboard_module/widgets/sidenavbar.dart';

class ViewFeedback extends StatelessWidget {
  const ViewFeedback({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F8F8),
      body: Row(
        children: [
          const SideNavBar(selected: SideNavItem.feedback),
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
            "Feedback",
            style: GoogleFonts.inter(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: const Color.fromARGB(255, 99, 99, 99),
            ),
          ),
          // Row(
          //   children: const [
          //     Icon(Icons.notifications_outlined),
          //     SizedBox(width: 16),
          //     Icon(Icons.help_outline),
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
    return SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _header(),
          const SizedBox(height: 24),
          //  _filters(),
          //const SizedBox(height: 24),
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
        "View All Feedback",
        style: GoogleFonts.inter(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
    );
  }

  Widget _table() {
    final feedbackService = ViewFeedbackService();

    return StreamBuilder<List<FeedbackModel>>(
      stream: feedbackService.getAllFeedback(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return const Center(child: Text("Error fetching Agents"));
        }

        if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const Center(child: Text("No Agents found"));
        }

        final agents = snapshot.data!;

        // Remove the SizedBox with fixed height and the extra SingleChildScrollView
        return SingleChildScrollView(
          // This SingleChildScrollView is for horizontal scrolling if needed
          scrollDirection: Axis
              .horizontal, // Changed to horizontal for potential wider tables
          child: DataTable(
            columns: const [
              // DataColumn(label: Text("Image")),
              DataColumn(label: Text("User Name")),
              DataColumn(label: Text("Rating")),
              DataColumn(label: Text("Feedback")),
             // DataColumn(label: Text("Comments")),
              // DataColumn(label: Text("Actions")),
            ],
            rows: agents.map((getfeedback) {
              return DataRow(
                cells: [
                  DataCell(
                    Text(
                      getfeedback.userName,
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                  DataCell(
                    Text(
                      getfeedback.rating.toString(),
                      style: TextStyle(color: Colors.black),
                    ),
                  ),

                  DataCell(
                    Text(
                      getfeedback.comments,
                      style: TextStyle(color: Colors.black),
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
