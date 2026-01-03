import 'package:flutter/material.dart';

class TopNavBar extends StatelessWidget {
  const TopNavBar({super.key});

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
        children: [
          const Text(
            "Dashboard Overview",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,
            color: Color.fromARGB(255, 105, 105, 105)),
          ),
          // const Spacer(),
          // SizedBox(
          //   width: 220,
          //   child: TextField(
          //     decoration: InputDecoration(
          //       prefixIcon: const Icon(Icons.search),
          //       hintText: "Search...",
          //       isDense: true,
          //       border:
          //           OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
          //     ),
          //   ),
          // ),
          // const SizedBox(width: 16),
          // IconButton(
          //   icon: const Icon(Icons.notifications),
          //   onPressed: () {},
          // ),
          // const CircleAvatar(radius: 18),
        ],
      ),
    );
  }
}
