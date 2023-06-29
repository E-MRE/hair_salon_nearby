import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../../widgets/scaffolds/safe_page_view.dart';

@RoutePage()
class MenuPage extends StatefulWidget {
  const MenuPage({super.key});

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  @override
  Widget build(BuildContext context) {
    return SafePageView(
      body: Container(),
    );
  }
}
