import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../constants/assets_constants.dart';
import '../constants/lang/locale_keys.g.dart';
import '../gen/colors.gen.dart';

enum OnboardingOption {
  women(AppColors.primaryWomen),
  men(AppColors.primaryMen),
  beautyCentre(AppColors.primaryBeautyCentre);

  final Color color;
  const OnboardingOption(this.color);
}

extension OnboardingOptionExtension on OnboardingOption {
  Image toBackgroundImage({
    BoxFit fit = BoxFit.fill,
    Color color = Colors.black45,
    BlendMode colorBlendMode = BlendMode.darken,
  }) {
    switch (this) {
      case OnboardingOption.women:
        return AssetsConstants.instance.getPngImages.icWomenHairdresserBackgroundPng.image(
          colorBlendMode: colorBlendMode,
          color: color,
          fit: fit,
        );
      case OnboardingOption.men:
        return AssetsConstants.instance.getPngImages.icMenHairdresserBackground.image(
          colorBlendMode: colorBlendMode,
          color: color,
          fit: fit,
        );

      case OnboardingOption.beautyCentre:
        return AssetsConstants.instance.getPngImages.icBeautyCentreBackground.image(
          colorBlendMode: colorBlendMode,
          color: color,
          fit: fit,
        );
    }
  }

  Image toLogoImage({double? height, double? width, BoxFit fit = BoxFit.fill, double opacity = .66}) {
    switch (this) {
      case OnboardingOption.women:
        return AssetsConstants.instance.getPngImages.icWomenLogoAndName.image(
          opacity: AlwaysStoppedAnimation(opacity),
          height: height,
          width: width,
          fit: fit,
        );
      case OnboardingOption.men:
        return AssetsConstants.instance.getPngImages.icMenLogoAndName.image(
          opacity: AlwaysStoppedAnimation(opacity),
          height: height,
          width: width,
          fit: fit,
        );

      case OnboardingOption.beautyCentre:
        return AssetsConstants.instance.getPngImages.icBeautyCentreLogoAndName.image(
          opacity: AlwaysStoppedAnimation(opacity),
          height: height,
          width: width,
          fit: fit,
        );
    }
  }

  String get getDescription {
    switch (this) {
      case OnboardingOption.women:
        return LocaleKeys.onboarding_womenHairdressersDescription.tr();
      case OnboardingOption.men:
        return LocaleKeys.onboarding_menHairdressersDescription.tr();
      case OnboardingOption.beautyCentre:
        return LocaleKeys.onboarding_beautyCentresDescription.tr();
    }
  }
}
