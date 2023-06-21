import 'package:flutter/material.dart';

import '../../../../utils/gen/colors.gen.dart';
import '../../abstract/base_color_theme.dart';

class BeautyCentreColorThemeLight implements BaseColorTheme {
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

  BeautyCentreColorThemeLight() {
    _initColors();
    colorScheme = const ColorScheme.light().copyWith(
      primary: AppColors.primaryBeautyCentre,
      secondary: AppColors.secondary,
      onPrimary: AppColors.onPrimary,
      onSecondary: AppColors.onSecondary,
      onSurface: AppColors.onSurface,
      error: AppColors.error,
      onError: AppColors.onError,
      background: AppColors.background,
      surface: AppColors.surface,
      tertiary: AppColors.success,
      onTertiary: AppColors.background,
      shadow: AppColors.shadow,
      outline: AppColors.outline,
      onBackground: AppColors.text,
      surfaceVariant: AppColors.disable,
      tertiaryContainer: AppColors.primary,
      primaryContainer: AppColors.primaryMen,
      outlineVariant: AppColors.outlineVariant,
    );
    brightness = Brightness.light;
  }

  void _initColors() {
    appBarColor = AppColors.primaryBeautyCentre;
    scaffoldBackgroundColor = AppColors.background;
    tabBarColor = AppColors.onPrimary;
    tabBarNormalColor = AppColors.hint;
    tabBarSelectedColor = AppColors.primaryBeautyCentre;
    hintColor = AppColors.hint;
    focusColor = AppColors.primaryBeautyCentre;
    disabledColor = AppColors.disable;
    hoverColor = AppColors.primaryBeautyCentre;
    shadowColor = AppColors.shadow;
    errorColor = AppColors.error;
    backgroundColor = AppColors.background;
    labelColor = AppColors.text;
  }
}
