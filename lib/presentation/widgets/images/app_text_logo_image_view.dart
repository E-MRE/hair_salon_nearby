import 'package:flutter/material.dart';
import 'package:hair_salon_nearby/utils/enum/hair_salon_type.dart';

import '../../../utils/enum/sizes.dart';

class AppTextLogoImageView extends StatelessWidget {
  const AppTextLogoImageView({super.key, this.salonType = HairSalonType.women, this.height = Sizes.large});

  final HairSalonType salonType;
  final Sizes height;

  @override
  Widget build(BuildContext context) {
    return salonType.toLogo(height: height.value);
  }
}
