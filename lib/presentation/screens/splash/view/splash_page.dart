import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../../../utils/navigation/auto_router/app_router.dart';

@RoutePage()
class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    _navigate();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }

  void _navigate() async {
    await Future.microtask(() {});
    context.router.push(const OnboardRoute());
  }
}
