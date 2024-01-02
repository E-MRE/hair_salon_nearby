import 'package:flutter/material.dart';
import 'package:hair_salon_nearby/core/extensions/context_extensions.dart';
import 'package:hair_salon_nearby/utils/enum/sizes.dart';

import '../../../core/utils/enums/special_key.dart';
import '../../../utils/enum/text_line_type.dart';
import 'app_text_style.dart';

///* ``[Size: 32 | Height: 40]`` headlineLargeSemiBold - SemiBold [w600]
///-------------------------------------------------------------
///* ``[Size: 28 | Height: 36]`` headlineMediumSemiBold - SemiBold [w600]
///-------------------------------------------------------------
///* ``[Size: 24 | Height: 32]`` headlineSmallSemiBold - SemiBold [w600]
///-------------------------------------------------------------
///* ``[Size: 20 | Height: 28]`` titleLargeSemiBold - SemiBold [w600]
///-------------------------------------------------------------
///* ``[Size: 20 | Height: 28]`` titleLargeRegular - Regular [w400]
///-------------------------------------------------------------
///* ``[Size: 16 | Height: 24]`` titleMediumSemiBold - SemiBold [w600]
///-------------------------------------------------------------
///* ``[Size: 16 | Height: 24]`` titleMediumRegular - Regular [w400]
///-------------------------------------------------------------
///* ``[Size: 14 | Height: 20]`` labelLargeSemiBold - SemiBold [w600]
///-------------------------------------------------------------
///* ``[Size: 14 | Height: 20]`` labelLargeMedium - Medium [w500]
///-------------------------------------------------------------
///* ``[Size: 14 | Height: 20]`` labelLargeRegular - Regular [w400]
///-------------------------------------------------------------
///* ``[Size: 12 | Height: 16]`` labelMediumSemiBold - SemiBold [w600]
///-------------------------------------------------------------
///* ``[Size: 12 | Height: 16]`` bodySmallRegular - Regular [w400]
///-------------------------------------------------------------
///* ``[Size: 12 | Height: 16]`` bodySmallMedium - Medium [w500]
///-------------------------------------------------------------
class AppText extends Text {
  const AppText.onlyData(super.data, {super.key});

  const AppText.customizable(
    super.data, {
    super.key,
    super.textAlign,
    super.maxLines,
    super.overflow,
    AppTextStyle? style,
  }) : super(style: style);

  ///``SemiBold TextStyle from headlineLarge.``
  ///
  /// `Size: 32 Height: 40 SemiBold`
  ///
  /// * FontSize: 32
  /// * FontWeight: SemiBold [w600]
  /// * FontFamily: Poppins
  /// * LineHeight: 40
  AppText.headlineLargeSemiBold(
    String? data, {
    Key? key,
    Color? color,
    TextLineType? maxLines,
    TextDecoration? decoration,
    required BuildContext context,
    TextAlign align = TextAlign.left,
    TextOverflow? overflow,
  }) : super(
          key: key,
          data ?? '',
          textAlign: align,
          overflow: overflow,
          maxLines: maxLines?.value,
          style: AppTextStyle.headlineLargeSemiBold(
            textTheme: context.textTheme,
            decoration: decoration,
            color: color,
          ),
        );

  ///``SemiBold TextStyle from headlineMedium.``
  ///
  /// `Size: 28 Height: 36 SemiBold`
  ///
  /// * FontSize: 28
  /// * FontWeight: SemiBold [w600]
  /// * FontFamily: Poppins
  /// * LineHeight: 36
  AppText.headlineMediumSemiBold(
    String? data, {
    Key? key,
    Color? color,
    TextLineType? maxLines,
    TextDecoration? decoration,
    required BuildContext context,
    TextAlign align = TextAlign.left,
    TextOverflow? overflow,
  }) : super(
          key: key,
          data ?? '',
          textAlign: align,
          overflow: overflow,
          maxLines: maxLines?.value,
          style: AppTextStyle.headlineMediumSemiBold(
            decoration: decoration,
            textTheme: context.textTheme,
            color: color,
          ),
        );

  ///``SemiBold TextStyle from headlineSmall.``
  ///
  /// `Size: 24 Height: 32 SemiBold`
  ///
  /// * FontSize: 24
  /// * FontWeight: SemiBold [w600]
  /// * FontFamily: Poppins
  /// * LineHeight: 32
  AppText.headlineSmallSemiBold(
    String? data, {
    Key? key,
    Color? color,
    TextLineType? maxLines,
    TextDecoration? decoration,
    required BuildContext context,
    TextAlign align = TextAlign.left,
    TextOverflow? overflow,
  }) : super(
          key: key,
          data ?? '',
          textAlign: align,
          overflow: overflow,
          maxLines: maxLines?.value,
          style: AppTextStyle.headlineSmallSemiBold(
            decoration: decoration,
            textTheme: context.textTheme,
            color: color,
          ),
        );

  ///``SemiBold TextStyle from titleLarge.``
  ///
  /// `Size: 20 Height: 28 SemiBold`
  ///
  /// * FontSize: 20
  /// * FontWeight: SemiBold [w600]
  /// * FontFamily: Poppins
  /// * LineHeight: 28
  AppText.titleLargeSemiBold(
    String? data, {
    Key? key,
    Color? color,
    TextLineType? maxLines,
    TextDecoration? decoration,
    required BuildContext context,
    TextAlign align = TextAlign.left,
    TextOverflow? overflow,
  }) : super(
          key: key,
          data ?? '',
          textAlign: align,
          overflow: overflow,
          maxLines: maxLines?.value,
          style: AppTextStyle.titleLargeSemiBold(
            textTheme: context.textTheme,
            decoration: decoration,
            color: color,
          ),
        );

  ///``Regular TextStyle from titleLarge.``
  ///
  /// `Size: 20 Height: 28 Regular`
  ///
  /// * FontSize: 20
  /// * FontWeight: Regular [w400]
  /// * FontFamily: Poppins
  /// * LineHeight: 28
  AppText.titleLargeRegular(
    String? data, {
    Key? key,
    Color? color,
    TextLineType? maxLines,
    TextDecoration? decoration,
    required BuildContext context,
    TextAlign align = TextAlign.left,
    TextOverflow? overflow,
  }) : super(
          key: key,
          data ?? '',
          textAlign: align,
          overflow: overflow,
          maxLines: maxLines?.value,
          style: AppTextStyle.titleLargeRegular(
            decoration: decoration,
            textTheme: context.textTheme,
            color: color,
          ),
        );

  ///``SemiBold TextStyle from titleMedium.``
  ///
  /// `Size: 16 Height: 24 SemiBold`
  ///
  /// * FontSize: 16
  /// * FontWeight: SemiBold [w600]
  /// * FontFamily: Poppins
  /// * LineHeight: 24
  AppText.titleMediumSemiBold(
    String? data, {
    Key? key,
    Color? color,
    TextLineType? maxLines,
    TextDecoration? decoration,
    required BuildContext context,
    TextAlign align = TextAlign.left,
    TextOverflow? overflow,
  }) : super(
          key: key,
          data ?? '',
          textAlign: align,
          overflow: overflow,
          maxLines: maxLines?.value,
          style: AppTextStyle.titleMediumSemiBold(
            decoration: decoration,
            textTheme: context.textTheme,
            color: color,
          ),
        );

  ///``Regular TextStyle from titleMedium.``
  ///
  /// `Size: 16 Height: 24 Regular`
  ///
  /// * FontSize: 16
  /// * FontWeight: Regular [w400]
  /// * FontFamily: Poppins
  /// * LineHeight: 24
  AppText.titleMediumRegular(
    String? data, {
    Key? key,
    Color? color,
    TextLineType? maxLines,
    TextDecoration? decoration,
    required BuildContext context,
    TextAlign align = TextAlign.left,
    TextOverflow? overflow,
  }) : super(
          key: key,
          data ?? '',
          textAlign: align,
          overflow: overflow,
          maxLines: maxLines?.value,
          style: AppTextStyle.titleMediumRegular(
            decoration: decoration,
            textTheme: context.textTheme,
            color: color,
          ),
        );

  ///``SemiBold TextStyle from labelLarge.``
  ///
  /// `Size: 14 Height: 20 SemiBold`
  ///
  /// * FontSize: 14
  /// * FontWeight: SemiBold [w600]
  /// * FontFamily: Poppins
  /// * LineHeight: 20
  AppText.labelLargeSemiBold(
    String? data, {
    Key? key,
    Color? color,
    Sizes? height,
    TextLineType? maxLines,
    TextDecoration? decoration,
    required BuildContext context,
    TextAlign align = TextAlign.left,
    TextOverflow? overflow,
  }) : super(
          key: key,
          data ?? '',
          textAlign: align,
          overflow: overflow,
          maxLines: maxLines?.value,
          style: AppTextStyle.labelLargeSemiBold(
            decoration: decoration,
            height: height ?? Sizes.verySmallerThanBig,
            textTheme: context.textTheme,
            color: color,
          ),
        );

  ///``Medium TextStyle from labelLarge.``
  ///
  /// `Size: 14 Height: 20 Medium`
  ///
  /// * FontSize: 14
  /// * FontWeight: Medium [w500]
  /// * FontFamily: Poppins
  /// * LineHeight: 20
  AppText.labelLargeMedium(
    String? data, {
    Key? key,
    Color? color,
    TextLineType? maxLines,
    TextDecoration? decoration,
    required BuildContext context,
    TextAlign align = TextAlign.left,
    TextOverflow? overflow,
  }) : super(
          key: key,
          data ?? '',
          textAlign: align,
          overflow: overflow,
          maxLines: maxLines?.value,
          style: AppTextStyle.labelLargeMedium(
            decoration: decoration,
            textTheme: context.textTheme,
            color: color,
          ),
        );

  ///``Regular TextStyle from labelLarge.``
  ///
  /// `Size: 14 Height: 20 Regular`
  ///
  /// * FontSize: 14
  /// * FontWeight: Regular [w400]
  /// * FontFamily: Poppins
  /// * LineHeight: 20
  AppText.labelLargeRegular(
    String? data, {
    Key? key,
    Color? color,
    double height = 20,
    double fontSize = 14,
    TextLineType? maxLines,
    TextDecoration? decoration,
    required BuildContext context,
    TextAlign align = TextAlign.left,
    FontWeight fontWeight = FontWeight.w400,
    TextOverflow? overflow,
  }) : super(
          key: key,
          data ?? '',
          textAlign: align,
          overflow: overflow,
          maxLines: maxLines?.value,
          style: AppTextStyle.labelLargeRegular(
            decoration: decoration,
            textTheme: context.textTheme,
            color: color,
          ),
        );

  ///``SemiBold TextStyle from labelMedium.``
  ///
  /// `Size: 12 Height: 16 SemiBold`
  ///
  /// * FontSize: 12
  /// * FontWeight: SemiBold [w600]
  /// * FontFamily: Poppins
  /// * LineHeight: 16
  AppText.labelMediumSemiBold(
    String? data, {
    Key? key,
    Color? color,
    TextLineType? maxLines,
    TextDecoration? decoration,
    required BuildContext context,
    TextAlign align = TextAlign.left,
    TextOverflow? overflow,
  }) : super(
          key: key,
          data ?? '',
          textAlign: align,
          overflow: overflow,
          maxLines: maxLines?.value,
          style: AppTextStyle.labelMediumSemiBold(
            decoration: decoration,
            textTheme: context.textTheme,
            color: color,
          ),
        );

  ///``Regular TextStyle from bodySmall.``
  ///
  /// `Size: 12 Height: 16 Regular`
  ///
  /// * FontSize: 12
  /// * FontWeight: Regular [w400]
  /// * FontFamily: Poppins
  /// * LineHeight: 16
  AppText.bodySmallRegular(
    String? data, {
    Key? key,
    Color? color,
    TextLineType? maxLines,
    TextDecoration? decoration,
    required BuildContext context,
    TextAlign align = TextAlign.left,
    TextOverflow? overflow,
  }) : super(
          key: key,
          data ?? '',
          textAlign: align,
          overflow: overflow,
          maxLines: maxLines?.value,
          style: AppTextStyle.bodySmallRegular(
            decoration: decoration,
            textTheme: context.textTheme,
            color: color,
          ),
        );

  ///``Medium TextStyle from bodySmall.``
  ///
  /// `Size: 12 Height: 16 Medium`
  ///
  /// * FontSize: 12
  /// * FontWeight: Medium [w500]
  /// * FontFamily: Poppins
  /// * LineHeight: 16
  AppText.bodySmallMedium(
    String? data, {
    Key? key,
    Color? color,
    TextLineType? maxLines,
    TextDecoration? decoration,
    required BuildContext context,
    TextAlign align = TextAlign.left,
    TextOverflow? overflow,
  }) : super(
          key: key,
          data ?? '',
          textAlign: align,
          overflow: overflow,
          maxLines: maxLines?.value,
          style: AppTextStyle.bodySmallMedium(
            decoration: decoration,
            textTheme: context.textTheme,
            color: color,
          ),
        );

  const AppText(
    super.data, {
    super.key,
    super.style,
    super.strutStyle,
    super.textAlign,
    super.textDirection,
    super.locale,
    super.softWrap,
    super.overflow,
    super.textScaleFactor,
    super.maxLines,
    super.semanticsLabel,
    super.textWidthBasis,
    super.textHeightBehavior,
    super.selectionColor,
  }) : super();
}

extension AppTextExtension on AppText {
  AppText copyWith({
    bool? inherit,
    Color? color,
    Color? backgroundColor,
    double? fontSize,
    FontWeight? fontWeight,
    FontStyle? fontStyle,
    double? letterSpacing,
    double? wordSpacing,
    TextBaseline? textBaseline,
    double? height,
    Locale? locale,
    TextDecoration? decoration,
    Color? decorationColor,
    TextDecorationStyle? decorationStyle,
    String? debugLabel,
    String? fontFamily,
    TextOverflow? overflow,
    TextAlign? align,
    TextLineType? maxLines,
  }) {
    return AppText(
      this.data ?? SpecialKey.empty.value,
      key: this.key,
      strutStyle: this.strutStyle,
      textAlign: align ?? this.textAlign,
      textDirection: this.textDirection,
      locale: this.locale,
      softWrap: this.softWrap,
      overflow: this.overflow,
      textScaleFactor: this.textScaleFactor,
      maxLines: maxLines?.value ?? this.maxLines,
      semanticsLabel: this.semanticsLabel,
      textWidthBasis: this.textWidthBasis,
      textHeightBehavior: this.textHeightBehavior,
      selectionColor: this.selectionColor,
      style: this.style?.copyWith(
            inherit: inherit,
            color: color,
            backgroundColor: backgroundColor,
            fontSize: fontSize,
            fontWeight: fontWeight,
            fontStyle: fontStyle,
            letterSpacing: letterSpacing,
            wordSpacing: wordSpacing,
            textBaseline: textBaseline,
            height: height,
            locale: locale,
            decoration: decoration,
            decorationColor: decorationColor,
            decorationStyle: decorationStyle,
            debugLabel: debugLabel,
            fontFamily: fontFamily,
            overflow: overflow,
          ),
    );
  }
}
