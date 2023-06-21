import 'package:flutter/material.dart';
import 'package:hair_salon_nearby/utils/constants/assets_constants.dart';

enum HairSalonType {
  women,
  men,
  beautyCentre;
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
}
