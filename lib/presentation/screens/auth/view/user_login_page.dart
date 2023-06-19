import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../../widgets/scaffolds/safe_page_view.dart';

@RoutePage()
class UserLoginPage extends StatefulWidget {
  const UserLoginPage({super.key});

  @override
  State<UserLoginPage> createState() => _UserLoginPageState();
}

class _UserLoginPageState extends State<UserLoginPage> {
  @override
  Widget build(BuildContext context) {
    return SafePageView(body: Container());
  }
}
