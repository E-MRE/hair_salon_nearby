import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hair_salon_nearby/utils/constants/assets_constants.dart';
import 'package:hair_salon_nearby/utils/constants/lang/locale_keys.g.dart';

enum MenuSubPage {
  home(0, LocaleKeys.menuPage_home),
  profile(1, LocaleKeys.menuPage_profile);

  final int value;
  final String localize;
  const MenuSubPage(this.value, this.localize);
}

extension MenuSubPageExtension on MenuSubPage {
  SvgPicture toSvg({ColorFilter? colorFilter}) {
    switch (this) {
      case MenuSubPage.home:
        return AssetsConstants.instance.getSvgImages.icHome.svg(colorFilter: colorFilter);
      case MenuSubPage.profile:
        return AssetsConstants.instance.getSvgImages.icProfile.svg(colorFilter: colorFilter);
    }
  }
}
