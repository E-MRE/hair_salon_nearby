import 'package:flutter/material.dart';

class SafeScaffold extends StatelessWidget {
  const SafeScaffold({super.key, required this.body});

  final Widget body;

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(body: body));
  }
}
