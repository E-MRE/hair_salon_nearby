import 'package:flutter/material.dart';

import '../../presentation/theme/abstract/base_color_theme.dart';
import '../../presentation/theme/abstract/base_theme.dart';
import '../../presentation/theme/concrete/color/beauty_centre_color_theme_light.dart';
import '../../presentation/theme/concrete/color/men_color_theme_light.dart';
import '../../presentation/theme/concrete/color/women_color_theme_light.dart';
import '../../presentation/theme/concrete/custom_theme/beauty_centre_app_theme.dart';
import '../../presentation/theme/concrete/custom_theme/men_app_theme.dart';
import '../../presentation/theme/concrete/custom_theme/women_app_theme.dart';
import '../constants/assets_constants.dart';
import '../gen/colors.gen.dart';

enum HairSalonType {
  women(AppColors.primaryWomen),
  men(AppColors.primaryMen),
  beautyCentre(AppColors.primaryBeautyCentre);

  final Color color;
  const HairSalonType(this.color);
}

extension HairSalonTypeExtension on HairSalonType {
  Image toLogo({double? height, double? width}) {
    return switch (this) {
      HairSalonType.men => AssetsConstants.instance.getPngImages.icMenLogoAndName.image(
          height: height,
          width: width,
        ),
      HairSalonType.women => AssetsConstants.instance.getPngImages.icPrimaryWomenLogoAndName.image(
          height: height,
          width: width,
        ),
      HairSalonType.beautyCentre => AssetsConstants.instance.getPngImages.icPrimaryBeautyCentreLogoAndName.image(
          height: height,
          width: width,
        ),
    };
  }

  BaseColorTheme get getColorTheme {
    return switch (this) {
      HairSalonType.men => MenColorThemeLight(),
      HairSalonType.women => WomenColorThemeLight(),
      HairSalonType.beautyCentre => BeautyCentreColorThemeLight(),
    };
  }

  BaseTheme get getTheme {
    return switch (this) {
      HairSalonType.men => MenAppTheme(),
      HairSalonType.women => WomenAppTheme(),
      HairSalonType.beautyCentre => BeautyCentreAppTheme(),
    };
  }
}
