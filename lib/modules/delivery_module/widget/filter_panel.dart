import 'package:flutter/material.dart';

class FilterPanel extends StatelessWidget {
  const FilterPanel({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 260,
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                "Filter by Status",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
              ),
              SizedBox(height: 12),
              // ignore: deprecated_member_use
              RadioListTile(value: 0, groupValue: 0, onChanged: null, title: Text("All")),
              // ignore: deprecated_member_use
              RadioListTile(value: 1, groupValue: 0, onChanged: null, title: Text("Verified")),
              // ignore: deprecated_member_use
              RadioListTile(value: 2, groupValue: 0, onChanged: null, title: Text("Pending")),
             // ignore: deprecated_member_use
              RadioListTile(value: 3, groupValue: 0, onChanged: null, title: Text("Suspended")),
            ],
          ),
        ),
      ),
    );
  }
}
