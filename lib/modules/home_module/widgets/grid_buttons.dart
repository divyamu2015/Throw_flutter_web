// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:throw_app/modules/home_module/models/grid_button_item_model.dart';
import 'package:throw_app/modules/home_module/widgets/grid_button_item.dart';

class GridButtons extends StatelessWidget {
  const GridButtons({super.key, required this.gridItems});

  final List<GridButtonItemModel> gridItems;

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final isVerySmallScreen = mediaQuery.size.width < 400;

    // Responsive grid layout
    final crossAxisCount = isVerySmallScreen ? 1 : 2;
    final childAspectRatio = isVerySmallScreen ? 1.8 : 1.0;
    final spacing = isVerySmallScreen ? 12.0 : 16.0;

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        crossAxisSpacing: spacing,
        mainAxisSpacing: spacing,
        childAspectRatio: childAspectRatio,
      ),
      itemCount: gridItems.length,
      itemBuilder: (context, index) {
        final item = gridItems[index];
        return GridButtonItem(
          iconImageUrl: item.iconImageUrl,
          title: item.title,
          onTap: item.onTap,
        );
      },
    );
  }
}
