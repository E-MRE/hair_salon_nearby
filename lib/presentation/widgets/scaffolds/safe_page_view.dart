import 'package:flutter/material.dart';

import '../../../utils/decorations/app_padding.dart';
import 'safe_scaffold.dart';

class SafePageView extends StatelessWidget {
  const SafePageView({super.key, required this.body});

  final Widget body;

  @override
  Widget build(BuildContext context) {
    return SafeScaffold(body: AppPadding.allBig(child: body));
  }
}
