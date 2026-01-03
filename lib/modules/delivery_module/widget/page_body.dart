import 'package:flutter/material.dart';
import 'package:throw_app/modules/delivery_module/widget/agents_table.dart';
import 'package:throw_app/modules/delivery_module/widget/filter_panel.dart';

class PageBody extends StatelessWidget {
  const PageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [   
          const Expanded(child: AgentsTable()),
          const SizedBox(width: 24),
          const FilterPanel(),
        ],
      ),
    );
  }
}
