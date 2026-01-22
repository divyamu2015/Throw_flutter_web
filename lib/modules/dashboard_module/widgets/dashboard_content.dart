import 'package:flutter/material.dart';
import 'package:throw_app/core/service/custome_service.dart';
import 'package:throw_app/core/service/agent_approval.dart';
import 'package:throw_app/core/service/delivery_request_list.dart';
import 'package:throw_app/modules/dashboard_module/widgets/matric_card.dart';

class DashboardContent extends StatelessWidget {
  const DashboardContent({super.key});

  @override
  Widget build(BuildContext context) {
    final customerService = CustomerService();
    final agentService = DeliveryAgentService();
    final deliveryService = DeliveryRequestService();

    return StreamBuilder<int>(
      stream: customerService.getCustomerCount(),
      builder: (context, customerSnapshot) {
        if (!customerSnapshot.hasData) {
          return const Center(child: CircularProgressIndicator());
        }

        return StreamBuilder<int>(
          stream: agentService.getTotalAgentsCount(),
          builder: (context, agentSnapshot) {
            if (!agentSnapshot.hasData) {
              return const Center(child: CircularProgressIndicator());
            }

            return StreamBuilder<int>(
              stream: deliveryService.getTotalDeliveriesCount(),
              builder: (context, totalSnap) {
                if (!totalSnap.hasData) return const CircularProgressIndicator();

                return StreamBuilder<int>(
                  stream: deliveryService.getActiveDeliveriesCount(),
                  builder: (context, activeSnap) {
                    if (!activeSnap.hasData) return const CircularProgressIndicator();

                    return StreamBuilder<int>(
                      stream: deliveryService.getDropOffDeliveriesCount(),
                      builder: (context, dropSnap) {
                        if (!dropSnap.hasData) return const CircularProgressIndicator();

                        return StreamBuilder<int>(
                          stream: deliveryService.getPendingDeliveriesCount(),
                          builder: (context, pendingSnap) {
                            if (!pendingSnap.hasData) {
                              return const CircularProgressIndicator();
                            }

                            // ✅ Extract values here
                            final totalCustomers = customerSnapshot.data!;
                            final totalAgents = agentSnapshot.data!;
                            final totalDeliveries = totalSnap.data!;
                            final activeDeliveries = activeSnap.data!;
                            final dropOffDeliveries = dropSnap.data!;
                            final pendingDeliveries = pendingSnap.data!;

                            return SingleChildScrollView(
                              padding: const EdgeInsets.all(18),
                              child: GridView.count(
                                crossAxisCount: 4,
                                shrinkWrap: true,
                                crossAxisSpacing: 11,
                                mainAxisSpacing: 11,
                                childAspectRatio: 1.5,
                                physics: const NeverScrollableScrollPhysics(),
                                children: [
                                  MetricCard("Total Customers", totalCustomers.toString()),
                                  MetricCard("Total Agents", totalAgents.toString()),

                                  // ✅ Multi-row card
                                  MetricCard(
                                    "Total Deliveries",
                                    totalDeliveries.toString(),
                                    subValues: {
                                      "On The Way": activeDeliveries.toString(),
                                      "Drop Off": dropOffDeliveries.toString(),
                                    },
                                  ),

                                  MetricCard(
                                    "Pending Deliveries",
                                    pendingDeliveries.toString(),
                                  ),
                                ],
                              ),
                            );
                          },
                        );
                      },
                    );
                  },
                );
              },
            );
          },
        );
      },
    );
  }
}
