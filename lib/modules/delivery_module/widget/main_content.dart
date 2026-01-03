import 'package:flutter/material.dart';
import 'package:throw_app/modules/delivery_module/widget/page_body.dart';
import 'package:throw_app/modules/delivery_module/widget/topbar.dart';

class MainContent extends StatelessWidget {
  const MainContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        TopBar(),
        Expanded(child: PageBody()),
      ],
    );
  }
}
