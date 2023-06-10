import 'package:flutter/material.dart';

import '../../../utils/enum/sizes.dart';
import '../../../utils/gen/fonts.gen.dart';

class AppTextStyle extends TextStyle {
  ///``SemiBold TextStyle from headlineLarge.``
  ///
  /// `Size: 32 Height: 40 SemiBold`
  ///
  /// * FontSize: 32
  /// * FontWeight: SemiBold [w600]
  /// * FontFamily: Poppins
  /// * LineHeight: 40
  AppTextStyle.headlineLargeSemiBold({
    String fontFamily = FontFamily.poppins,
    Sizes height = Sizes.extraMoreBig,
    Sizes fontSize = Sizes.veryBig,
    required TextTheme textTheme,
    TextDecoration? decoration,
    Color? color,
  }) : this.convertParent(
            style: textTheme.headlineLarge?.copyWith(
          height: (height.value / fontSize.value),
          fontSize: fontSize.value,
          fontWeight: FontWeight.w600,
          fontFamily: fontFamily,
          decoration: decoration,
          color: color,
        ));

  ///``SemiBold TextStyle from headlineMedium.``
  ///
  /// `Size: 28 Height: 36 SemiBold`
  ///
  /// * FontSize: 28
  /// * FontWeight: SemiBold [w600]
  /// * FontFamily: Poppins
  /// * LineHeight: 36
  AppTextStyle.headlineMediumSemiBold({
    String fontFamily = FontFamily.poppins,
    Sizes fontSize = Sizes.prettyBig,
    Sizes height = Sizes.extraBig,
    required TextTheme textTheme,
    TextDecoration? decoration,
    Color? color,
  }) : this.convertParent(
            style: textTheme.headlineMedium?.copyWith(
          height: (height.value / fontSize.value),
          fontSize: fontSize.value,
          fontWeight: FontWeight.w600,
          fontFamily: fontFamily,
          decoration: decoration,
          color: color,
        ));

  ///``SemiBold TextStyle from headlineSmall.``
  ///
  /// `Size: 24 Height: 32 SemiBold`
  ///
  /// * FontSize: 24
  /// * FontWeight: SemiBold [w600]
  /// * FontFamily: Poppins
  /// * LineHeight: 32
  AppTextStyle.headlineSmallSemiBold({
    String fontFamily = FontFamily.poppins,
    Sizes height = Sizes.veryBig,
    required TextTheme textTheme,
    Sizes fontSize = Sizes.big,
    TextDecoration? decoration,
    Color? color,
  }) : this.convertParent(
            style: textTheme.headlineSmall?.copyWith(
          height: (height.value / fontSize.value),
          fontSize: fontSize.value,
          fontWeight: FontWeight.w600,
          fontFamily: fontFamily,
          decoration: decoration,
          color: color,
        ));

  ///``SemiBold TextStyle from titleLarge.``
  ///
  /// `Size: 20 Height: 28 SemiBold`
  ///
  /// * FontSize: 20
  /// * FontWeight: SemiBold [w600]
  /// * FontFamily: Poppins
  /// * LineHeight: 28
  AppTextStyle.titleLargeSemiBold({
    String fontFamily = FontFamily.poppins,
    Sizes fontSize = Sizes.verySmallerThanBig,
    Sizes height = Sizes.prettyBig,
    required TextTheme textTheme,
    TextDecoration? decoration,
    Color? color,
  }) : this.convertParent(
            style: textTheme.titleLarge?.copyWith(
          height: (height.value / fontSize.value),
          fontSize: fontSize.value,
          fontWeight: FontWeight.w600,
          fontFamily: fontFamily,
          decoration: decoration,
          color: color,
        ));

  ///``Regular TextStyle from titleLarge.``
  ///
  /// `Size: 20 Height: 28 Regular`
  ///
  /// * FontSize: 20
  /// * FontWeight: Regular [w400]
  /// * FontFamily: Poppins
  /// * LineHeight: 28
  AppTextStyle.titleLargeRegular({
    String fontFamily = FontFamily.poppins,
    Sizes fontSize = Sizes.verySmallerThanBig,
    Sizes height = Sizes.prettyBig,
    required TextTheme textTheme,
    TextDecoration? decoration,
    Color? color,
  }) : this.convertParent(
            style: textTheme.titleLarge?.copyWith(
          height: (height.value / fontSize.value),
          fontSize: fontSize.value,
          fontWeight: FontWeight.w400,
          fontFamily: fontFamily,
          decoration: decoration,
          color: color,
        ));

  ///``SemiBold TextStyle from titleMedium.``
  ///
  /// `Size: 16 Height: 24 SemiBold`
  ///
  /// * FontSize: 16
  /// * FontWeight: SemiBold [w600]
  /// * FontFamily: Poppins
  /// * LineHeight: 24
  AppTextStyle.titleMediumSemiBold({
    String fontFamily = FontFamily.poppins,
    Sizes fontSize = Sizes.medium,
    required TextTheme textTheme,
    TextDecoration? decoration,
    Sizes height = Sizes.big,
    Color? color,
  }) : this.convertParent(
            style: textTheme.titleMedium?.copyWith(
          height: (height.value / fontSize.value),
          fontSize: fontSize.value,
          fontWeight: FontWeight.w600,
          fontFamily: fontFamily,
          decoration: decoration,
          color: color,
        ));

  ///``Regular TextStyle from titleMedium.``
  ///
  /// `Size: 16 Height: 24 Regular`
  ///
  /// * FontSize: 16
  /// * FontWeight: Regular [w400]
  /// * FontFamily: Poppins
  /// * LineHeight: 24
  AppTextStyle.titleMediumRegular({
    String fontFamily = FontFamily.poppins,
    Sizes fontSize = Sizes.medium,
    required TextTheme textTheme,
    TextDecoration? decoration,
    Sizes height = Sizes.big,
    Color? color,
  }) : this.convertParent(
            style: textTheme.titleMedium?.copyWith(
          height: (height.value / fontSize.value),
          fontSize: fontSize.value,
          fontWeight: FontWeight.w400,
          fontFamily: fontFamily,
          decoration: decoration,
          color: color,
        ));

  ///``SemiBold TextStyle from labelLarge.``
  ///
  /// `Size: 14 Height: 20 SemiBold`
  ///
  /// * FontSize: 14
  /// * FontWeight: SemiBold [w600]
  /// * FontFamily: Poppins
  /// * LineHeight: 20
  AppTextStyle.labelLargeSemiBold({
    String fontFamily = FontFamily.poppins,
    Sizes fontSize = Sizes.smallerThanMedium,
    Sizes height = Sizes.verySmallerThanBig,
    required TextTheme textTheme,
    TextDecoration? decoration,
    Color? color,
  }) : this.convertParent(
            style: textTheme.labelLarge?.copyWith(
          height: (height.value / fontSize.value),
          fontSize: fontSize.value,
          fontWeight: FontWeight.w600,
          fontFamily: fontFamily,
          decoration: decoration,
          color: color,
        ));

  ///``Medium TextStyle from labelLarge.``
  ///
  /// `Size: 14 Height: 20 Medium`
  ///
  /// * FontSize: 14
  /// * FontWeight: Medium [w500]
  /// * FontFamily: Poppins
  /// * LineHeight: 20
  AppTextStyle.labelLargeMedium({
    String fontFamily = FontFamily.poppins,
    Sizes fontSize = Sizes.smallerThanMedium,
    Sizes height = Sizes.verySmallerThanBig,
    required TextTheme textTheme,
    TextDecoration? decoration,
    Color? color,
  }) : this.convertParent(
            style: textTheme.labelLarge?.copyWith(
          height: (height.value / fontSize.value),
          fontSize: fontSize.value,
          fontWeight: FontWeight.w500,
          fontFamily: fontFamily,
          decoration: decoration,
          color: color,
        ));

  ///``Regular TextStyle from labelLarge.``
  ///
  /// `Size: 14 Height: 20 Regular`
  ///
  /// * FontSize: 14
  /// * FontWeight: Regular [w400]
  /// * FontFamily: Poppins
  /// * LineHeight: 20
  AppTextStyle.labelLargeRegular({
    String fontFamily = FontFamily.poppins,
    Sizes fontSize = Sizes.smallerThanMedium,
    Sizes height = Sizes.verySmallerThanBig,
    required TextTheme textTheme,
    TextDecoration? decoration,
    Color? color,
  }) : this.convertParent(
            style: textTheme.labelLarge?.copyWith(
          height: (height.value / fontSize.value),
          fontSize: fontSize.value,
          fontWeight: FontWeight.w400,
          fontFamily: fontFamily,
          decoration: decoration,
          color: color,
        ));

  ///``SemiBold TextStyle from labelMedium.``
  ///
  /// `Size: 12 Height: 16 SemiBold`
  ///
  /// * FontSize: 12
  /// * FontWeight: SemiBold [w600]
  /// * FontFamily: Poppins
  /// * LineHeight: 16
  AppTextStyle.labelMediumSemiBold({
    String fontFamily = FontFamily.poppins,
    Sizes fontSize = Sizes.small,
    Sizes height = Sizes.medium,
    required TextTheme textTheme,
    TextDecoration? decoration,
    Color? color,
  }) : this.convertParent(
            style: textTheme.labelMedium?.copyWith(
          height: (height.value / fontSize.value),
          fontSize: fontSize.value,
          fontWeight: FontWeight.w600,
          fontFamily: fontFamily,
          decoration: decoration,
          color: color,
        ));

  ///``Regular TextStyle from bodySmall.``
  ///
  /// `Size: 12 Height: 16 Regular`
  ///
  /// * FontSize: 12
  /// * FontWeight: Regular [w400]
  /// * FontFamily: Poppins
  /// * LineHeight: 16
  AppTextStyle.bodySmallRegular({
    String fontFamily = FontFamily.poppins,
    Sizes fontSize = Sizes.small,
    Sizes height = Sizes.medium,
    required TextTheme textTheme,
    TextDecoration? decoration,
    Color? color,
  }) : this.convertParent(
            style: textTheme.bodySmall?.copyWith(
          height: (height.value / fontSize.value),
          fontSize: fontSize.value,
          fontWeight: FontWeight.w400,
          fontFamily: fontFamily,
          decoration: decoration,
          color: color,
        ));

  ///``Medium TextStyle from bodySmall.``
  ///
  /// `Size: 12 Height: 16 Medium`
  ///
  /// * FontSize: 12
  /// * FontWeight: Medium [w500]
  /// * FontFamily: Poppins
  /// * LineHeight: 16
  AppTextStyle.bodySmallMedium({
    String fontFamily = FontFamily.poppins,
    Sizes fontSize = Sizes.small,
    Sizes height = Sizes.medium,
    required TextTheme textTheme,
    TextDecoration? decoration,
    Color? color,
  }) : this.convertParent(
            style: textTheme.bodySmall?.copyWith(
          height: (height.value / fontSize.value),
          fontSize: fontSize.value,
          fontWeight: FontWeight.w500,
          fontFamily: fontFamily,
          decoration: decoration,
          color: color,
        ));

  const AppTextStyle({
    super.inherit = true,
    super.color,
    super.backgroundColor,
    super.fontSize,
    super.fontWeight,
    super.fontStyle,
    super.letterSpacing,
    super.wordSpacing,
    super.textBaseline,
    super.height,
    super.leadingDistribution,
    super.locale,
    super.foreground,
    super.background,
    super.shadows,
    super.fontFeatures,
    super.fontVariations,
    super.decoration,
    super.decorationColor,
    super.decorationStyle,
    super.decorationThickness,
    super.debugLabel,
    super.fontFamily,
    super.fontFamilyFallback,
    super.package,
    super.overflow,
  });

  AppTextStyle.convertParent({required TextStyle? style, String? package})
      : super(
          inherit: style?.inherit ?? true,
          color: style?.color,
          backgroundColor: style?.backgroundColor,
          fontSize: style?.fontSize,
          fontWeight: style?.fontWeight,
          fontStyle: style?.fontStyle,
          letterSpacing: style?.letterSpacing,
          wordSpacing: style?.wordSpacing,
          textBaseline: style?.textBaseline,
          height: style?.height,
          leadingDistribution: style?.leadingDistribution,
          locale: style?.locale,
          foreground: style?.foreground,
          background: style?.background,
          shadows: style?.shadows,
          fontFeatures: style?.fontFeatures,
          fontVariations: style?.fontVariations,
          decoration: style?.decoration,
          decorationColor: style?.decorationColor,
          decorationStyle: style?.decorationStyle,
          decorationThickness: style?.decorationThickness,
          debugLabel: style?.debugLabel,
          fontFamily: style?.fontFamily,
          fontFamilyFallback: style?.fontFamilyFallback,
          package: package,
          overflow: style?.overflow,
        );
}
