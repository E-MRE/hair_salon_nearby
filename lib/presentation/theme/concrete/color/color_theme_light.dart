import 'package:flutter/material.dart';

import '../../../../utils/gen/colors.gen.dart';
import '../../abstract/base_color_theme.dart';

class ColorThemeLight implements BaseColorTheme {
  @override
  Color? appBarColor;

  @override
  Brightness? brightness;

  @override
  ColorScheme? colorScheme;

  @override
  Color? scaffoldBackgroundColor;

  @override
  Color? tabBarColor;

  @override
  Color? tabbarNormalColor;

  @override
  Color? tabbarSelectedColor;

  @override
  Color? hintColor;

  @override
  Color? focusColor;

  @override
  Color? disabledColor;

  @override
  Color? hoverColor;

  @override
  Color? shadowColor;

  @override
  Color? errorColor;

  @override
  Color? backgroundColor;

  @override
  Color? labelColor;

  ColorThemeLight() {
    _initColors();
    colorScheme = const ColorScheme.light().copyWith(
      primary: AppColors.dark,
      onPrimary: AppColors.white,
      onSecondary: AppColors.white,
      onSurface: AppColors.white,
      error: AppColors.tomato,
      onError: AppColors.white,
      background: AppColors.white,
      surface: AppColors.dark,
    );
    brightness = Brightness.light;
  }

  void _initColors() {
    appBarColor = AppColors.dark;
    scaffoldBackgroundColor = AppColors.white;
    tabBarColor = AppColors.purpleGrey;
    tabbarNormalColor = AppColors.dullPurple;
    tabbarSelectedColor = AppColors.tomato;
    hintColor = AppColors.dustLavender;
    focusColor = AppColors.dullPurple;
    disabledColor = AppColors.purpleGrey;
    hoverColor = AppColors.clearBlue;
    shadowColor = AppColors.purpleGrey;
    errorColor = AppColors.tomato;
    backgroundColor = AppColors.white;
    labelColor = AppColors.darkGreyBlue;
  }
}
