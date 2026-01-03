import 'package:flutter/material.dart';

class MetricCard extends StatelessWidget {
  final String title, value, change;
  final bool negative;

  const MetricCard(this.title, this.value, this.change,
      {this.negative = false, super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 110,
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: Colors.black12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: const TextStyle(color: Colors.grey)),
            const SizedBox(height: 8),
            Text(value,
                style:
                    const TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
            const SizedBox(height: 4),
            Text(
              change,
              style: TextStyle(
                color: negative ? Colors.red : Colors.green,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
