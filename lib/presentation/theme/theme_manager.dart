import 'package:flutter/material.dart';
import 'package:hair_salon_nearby/utils/decorations/app_edge_insets.dart';
import 'package:hair_salon_nearby/utils/decorations/rounded_border.dart';

import '../../utils/enum/sizes.dart';
import '../../utils/gen/colors.gen.dart';
import '../../utils/gen/fonts.gen.dart';
import 'abstract/base_theme.dart';
import 'abstract/theme_service.dart';

class ThemeManager extends ThemeService {
  ThemeManager({required BaseTheme theme}) : super(theme: theme);

  @override
  ThemeData get createTheme {
    return ThemeData(
      fontFamily: FontFamily.poppins,
      textTheme: theme.textTheme.data,
      primaryColor: theme.colorTheme.colorScheme?.primary,
      focusColor: theme.colorTheme.focusColor,
      disabledColor: theme.colorTheme.disabledColor,
      hintColor: theme.colorTheme.hintColor,
      hoverColor: theme.colorTheme.hoverColor,
      shadowColor: theme.colorTheme.shadowColor,
      scaffoldBackgroundColor: theme.colorTheme.scaffoldBackgroundColor,
      colorScheme: theme.colorTheme.colorScheme,
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          fixedSize: MaterialStatePropertyAll(Size.fromHeight(Sizes.medium.value)),
          backgroundColor: MaterialStatePropertyAll(theme.colorTheme.colorScheme?.primary ?? AppColors.primary),
          foregroundColor: MaterialStatePropertyAll(theme.colorTheme.colorScheme?.onPrimary ?? AppColors.onPrimary),
          iconColor: MaterialStatePropertyAll(theme.colorTheme.colorScheme?.onPrimary ?? AppColors.onPrimary),
          padding: MaterialStatePropertyAll(AppEdgeInsets.allMedium()),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: ButtonStyle(
          side: MaterialStatePropertyAll(
            BorderSide(color: theme.colorTheme.colorScheme?.outline ?? AppColors.outline),
          ),
          shape: MaterialStatePropertyAll(RoundedBorder.circular(radius: Sizes.medium.value)),
          fixedSize: MaterialStatePropertyAll(Size.fromHeight(Sizes.medium.value)),
          foregroundColor: MaterialStatePropertyAll(theme.colorTheme.colorScheme?.primary ?? AppColors.primary),
          iconColor: MaterialStatePropertyAll(theme.colorTheme.colorScheme?.primary ?? AppColors.primary),
          padding: MaterialStatePropertyAll(AppEdgeInsets.allMedium()),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        focusColor: theme.colorTheme.focusColor,
        contentPadding: AppEdgeInsets.symmetric(horizontal: Sizes.medium, vertical: Sizes.extraSmallerThanBig),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: theme.colorTheme.colorScheme?.primary ?? AppColors.primary),
          gapPadding: Sizes.small.value,
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: theme.colorTheme.colorScheme?.error ?? AppColors.error),
          gapPadding: Sizes.small.value,
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: theme.colorTheme.colorScheme?.outline ?? AppColors.outline),
          gapPadding: Sizes.small.value,
        ),
        disabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: theme.colorTheme.colorScheme?.shadow ?? AppColors.shadow),
          gapPadding: Sizes.small.value,
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: theme.colorTheme.colorScheme?.tertiaryContainer ?? AppColors.primaryBeautyCentre,
          ),
          gapPadding: Sizes.small.value,
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide(color: theme.colorTheme.colorScheme?.outline ?? AppColors.outline),
          gapPadding: Sizes.small.value,
        ),
      ),
    );
  }
}
