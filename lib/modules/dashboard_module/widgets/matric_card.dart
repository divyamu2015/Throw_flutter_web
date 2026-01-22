import 'package:flutter/material.dart';

class MetricCard extends StatelessWidget {
  final String title;
  final String mainValue;

  // Optional extra rows
  final Map<String, String>? subValues;

  const MetricCard(
    this.title,
    this.mainValue, {
    this.subValues,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    //double h = MediaQuery.of(context).size.height;

    return SizedBox(
      height: 160, // little taller to fit rows
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
            // Title
            Text(
              title,
              style: const TextStyle(
                color: Color.fromARGB(255, 90, 90, 90),
                fontSize: 17,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 10),

            // Main big value
            Text(
              mainValue,
              style: const TextStyle(
                fontSize: 30,
                color: Colors.green,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 5),

            // Extra rows (if provided)
            if (subValues != null)
              ...subValues!.entries.map(
                (e) => Padding(
                  padding: const EdgeInsets.only(top: 4),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        e.key,
                        style: const TextStyle(
                          fontSize: 13,
                          color: Color.fromARGB(255, 40, 59, 94),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        e.value,
                        style: const TextStyle(
                          fontSize: 13,
                          color: Color.fromARGB(255, 40, 59, 94),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
