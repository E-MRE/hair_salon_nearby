import 'package:flutter/material.dart';

import '../../../utils/constants/assets_constants.dart';
import '../../../utils/decorations/app_padding.dart';

class SafeBackgroundPageView extends StatelessWidget {
  const SafeBackgroundPageView({super.key, required this.body});

  final Widget body;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          AssetsConstants.instance.getPngImages.icSplashBackground.image(),
          SafeArea(child: AppPadding.allBig(child: body)),
        ],
      ),
    );
  }
}
