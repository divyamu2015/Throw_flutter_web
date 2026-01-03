import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:throw_app/core/models/agent_approval.dart';
import 'package:throw_app/modules/delivery_module/delivery_agent_list/view_image_usertoken.dart';

class AgentDetailsDialog extends StatelessWidget {
  final DeliveryAgent agent;

  const AgentDetailsDialog({super.key, required this.agent});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Container(
        width: 420,
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              agent.displayName,
              style: GoogleFonts.inter(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 12),

            _info("Email", agent.email),
            _info(
              "Phone",
              agent.phoneNumber.isEmpty ? "N/A" : agent.phoneNumber,
            ),
            _info("Vehicle", agent.vehicleModel),
            _info("Vehicle Number", agent.vehicleNumber),
            _info("Vehicle Type", agent.vehicleType),

            const SizedBox(height: 16),

           ClipRRect(
  borderRadius: BorderRadius.circular(12),
  child: FutureBuilder<String>(
    future: getLicenseImageUrl(agent.licenseImageUrl),
    builder: (context, snapshot) {
      if (!snapshot.hasData) {
        return const SizedBox(
          height: 160,
          child: Center(child: CircularProgressIndicator()),
        );
      }

      return Image.network(
        snapshot.data!,
        height: 160,
        width: double.infinity,
        fit: BoxFit.cover,
        errorBuilder: (_, __, ___) {
          return Container(
            height: 160,
            color: Colors.grey.shade200,
            child: const Icon(Icons.broken_image),
          );
        },
      );
    },
  ),
),


            const SizedBox(height: 16),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text("Close"),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _info(String title, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6),
      child: Row(
        children: [
          SizedBox(
            width: 120,
            child: Text(
              title,
              style: const TextStyle(
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
            ),
          ),
          Expanded(
            child: Text(value, style: const TextStyle(color: Colors.black)),
          ),
        ],
      ),
    );
  }
}
 