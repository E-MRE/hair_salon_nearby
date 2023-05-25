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
  Color? tabBarNormalColor;

  @override
  Color? tabBarSelectedColor;

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
      primary: AppColors.primary,
      secondary: AppColors.secondary,
      onPrimary: AppColors.onPrimary,
      onSecondary: AppColors.onSecondary,
      onSurface: AppColors.onSurface,
      error: AppColors.error,
      onError: AppColors.onError,
      background: AppColors.background,
      surface: AppColors.surface,
    );
    brightness = Brightness.light;
  }

  void _initColors() {
    appBarColor = AppColors.primary;
    scaffoldBackgroundColor = AppColors.background;
    tabBarColor = AppColors.onPrimary;
    tabBarNormalColor = AppColors.hint;
    tabBarSelectedColor = AppColors.primary;
    hintColor = AppColors.hint;
    focusColor = AppColors.focus;
    disabledColor = AppColors.disable;
    hoverColor = AppColors.hover;
    shadowColor = AppColors.shadow;
    errorColor = AppColors.error;
    backgroundColor = AppColors.background;
    labelColor = AppColors.text;
  }
}
