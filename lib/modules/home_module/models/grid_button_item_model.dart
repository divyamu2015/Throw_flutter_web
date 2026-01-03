import 'package:flutter/material.dart';

class GridButtonItemModel {
  final String iconImageUrl;
  final String title;
  final VoidCallback onTap;

  const GridButtonItemModel({
    required this.iconImageUrl,
    required this.title,
    required this.onTap,
  });
}
