import 'package:flutter/material.dart';
import 'package:hair_salon_nearby/utils/decorations/circular_border_radius.dart';

import '../../utils/decorations/app_edge_insets.dart';
import '../../utils/decorations/rounded_border.dart';
import '../../utils/enum/sizes.dart';
import '../../utils/gen/colors.gen.dart';
import '../../utils/gen/fonts.gen.dart';
import '../widgets/texts/app_text_style.dart';
import 'abstract/theme_service.dart';

class ThemeManager extends ThemeService {
  ThemeManager({required super.theme});

  @override
  ThemeData get createTheme {
    return ThemeData(
      useMaterial3: false,
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
          alignment: Alignment.center,
          padding: MaterialStatePropertyAll(AppEdgeInsets.allMedium()),
          fixedSize: MaterialStatePropertyAll(Size.fromHeight(Sizes.prettyLarge.value)),
          iconColor: MaterialStatePropertyAll(theme.colorTheme.colorScheme?.onPrimary ?? AppColors.onPrimary),
          textStyle: MaterialStatePropertyAll(AppTextStyle.labelLargeSemiBold(textTheme: theme.textTheme.data)),
          backgroundColor: MaterialStatePropertyAll(theme.colorTheme.colorScheme?.primary ?? AppColors.primary),
          foregroundColor: MaterialStatePropertyAll(theme.colorTheme.colorScheme?.onPrimary ?? AppColors.onPrimary),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: ButtonStyle(
          alignment: Alignment.center,
          side: MaterialStatePropertyAll(
            BorderSide(color: theme.colorTheme.colorScheme?.outline ?? AppColors.outline),
          ),
          shape: MaterialStatePropertyAll(RoundedBorder.circular(radius: Sizes.medium.value)),
          fixedSize: MaterialStatePropertyAll(Size.fromHeight(Sizes.prettyLarge.value)),
          foregroundColor: MaterialStatePropertyAll(theme.colorTheme.colorScheme?.primary ?? AppColors.primary),
          iconColor: MaterialStatePropertyAll(theme.colorTheme.colorScheme?.primary ?? AppColors.primary),
          textStyle: MaterialStatePropertyAll(AppTextStyle.labelLargeSemiBold(textTheme: theme.textTheme.data)),
          padding: MaterialStatePropertyAll(AppEdgeInsets.allMedium()),
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: ButtonStyle(
          foregroundColor: MaterialStatePropertyAll(theme.colorTheme.colorScheme?.primary ?? AppColors.primary),
          textStyle: MaterialStatePropertyAll(AppTextStyle.labelLargeSemiBold(textTheme: theme.textTheme.data)
              .copyWith(color: theme.colorTheme.colorScheme?.primary, decoration: TextDecoration.underline)),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        focusColor: theme.colorTheme.focusColor,
        hintStyle: AppTextStyle.labelLargeRegular(textTheme: theme.textTheme.data)
            .copyWith(color: theme.colorTheme.colorScheme?.shadow),
        contentPadding: AppEdgeInsets.symmetric(horizontal: Sizes.medium, vertical: Sizes.extraSmallerThanBig),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: theme.colorTheme.colorScheme?.primary ?? AppColors.primary),
          borderRadius: CircularBorderRadius.small(),
          gapPadding: Sizes.small.value,
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: theme.colorTheme.colorScheme?.error ?? AppColors.error),
          borderRadius: CircularBorderRadius.small(),
          gapPadding: Sizes.small.value,
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: theme.colorTheme.colorScheme?.outline ?? AppColors.outline),
          borderRadius: CircularBorderRadius.small(),
          gapPadding: Sizes.small.value,
        ),
        disabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: theme.colorTheme.colorScheme?.shadow ?? AppColors.shadow),
          borderRadius: CircularBorderRadius.small(),
          gapPadding: Sizes.small.value,
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: theme.colorTheme.colorScheme?.tertiaryContainer ?? AppColors.primaryBeautyCentre,
          ),
          borderRadius: CircularBorderRadius.small(),
          gapPadding: Sizes.small.value,
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide(color: theme.colorTheme.colorScheme?.outline ?? AppColors.outline),
          borderRadius: CircularBorderRadius.small(),
          gapPadding: Sizes.small.value,
        ),
      ),
    );
  }
}
