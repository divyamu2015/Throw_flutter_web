import 'package:flutter/material.dart';
import 'package:throw_app/modules/dashboard_module/widgets/matric_card.dart';

class DashboardContent extends StatelessWidget {
  const DashboardContent({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
        //  const SectionTitle("Key Metrics"),
          const SizedBox(height: 16),
          GridView.count(
            crossAxisCount: 4,
            shrinkWrap: true,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
            childAspectRatio: 1.6,
            physics: const NeverScrollableScrollPhysics(),
            children: const [
              MetricCard("Total Customers", "1,204", "+2.5%"),
              MetricCard("Total Agents", "256", "+1.8%"),
              MetricCard("Active Deliveries", "88", "-0.5%", negative: true),
              MetricCard("Pending Verifications", "12", "+10%"),
            ],
          ),
          const SizedBox(height: 32),
         // const SectionTitle("Performance Charts"),
         // const SizedBox(height: 16),
          // Row(
          //   children: const [
          //     Expanded(child: ChartPlaceholder("Daily Deliveries")),
          //     SizedBox(width: 16),
          //     Expanded(child: ChartPlaceholder("Revenue Growth")),
          //   ],
          // ),
          // const SizedBox(height: 32),
          // const SectionTitle("Recent Activity"),
          // const SizedBox(height: 16),
          // const ActivityList(),
        ],
      ),
    );
  }
}
