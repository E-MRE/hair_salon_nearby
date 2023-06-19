import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../../widgets/scaffolds/safe_page_view.dart';

@RoutePage()
class BusinessLoginPage extends StatefulWidget {
  const BusinessLoginPage({super.key});

  @override
  State<BusinessLoginPage> createState() => _BusinessLoginPageState();
}

class _BusinessLoginPageState extends State<BusinessLoginPage> {
  @override
  Widget build(BuildContext context) {
    return SafePageView(body: Container());
  }
}
