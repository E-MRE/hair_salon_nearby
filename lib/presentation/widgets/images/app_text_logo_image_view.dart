import 'package:flutter/material.dart';

import '../../../utils/enum/hair_salon_type.dart';
import '../../../utils/enum/sizes.dart';
import '../../../utils/extensions/build_context_extensions.dart';

class AppTextLogoImageView extends StatelessWidget {
  const AppTextLogoImageView({super.key, this.height = Sizes.large});

  final Sizes height;

  @override
  Widget build(BuildContext context) {
    final salonType = context.watchThemeService.theme.salonType;
    return salonType.toLogo(height: height.value);
  }
}
