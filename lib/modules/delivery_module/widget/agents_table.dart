import 'package:flutter/material.dart';

class AgentsTable extends StatelessWidget {
  const AgentsTable({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListView(
        padding: const EdgeInsets.all(16),
        children: const [
          AgentRow(name: "John Doe", rating: 4.9, status: "Online"),
          AgentRow(name: "Jane Smith", rating: 4.7, status: "Offline"),
          AgentRow(name: "Mike Johnson", rating: 4.8, status: "Online"),
          AgentRow(name: "Emily Carter", rating: 4.2, status: "Offline"),
        ],
      ),
    );
  }
}

class AgentRow extends StatelessWidget {
  final String name;
  final double rating;
  final String status;

  const AgentRow({
    super.key,
    required this.name,
    required this.rating,
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const CircleAvatar(),
      title: Text(name),
      subtitle: Text("⭐ $rating"),
      trailing: Text(
        status,
        style: TextStyle(
          color: status == "Online" ? Colors.green : Colors.grey,
        ),
      ),
    );
  }
}
