import 'package:flutter/material.dart';

import '../../../core/extensions/context_extensions.dart';
import '../../../core/utils/enums/special_key.dart';
import '../../../utils/enum/text_line_type.dart';
import '../../../utils/gen/fonts.gen.dart';

///* ``[Size: 32 | Height: 40]`` headlineLarge - SemiBold [w600]
///-------------------------------------------------------------
///* ``[Size: 28 | Height: 36]`` headlineMedium - SemiBold [w600]
///-------------------------------------------------------------
///* ``[Size: 24 | Height: 32]`` headlineSmall - SemiBold [w600]
///-------------------------------------------------------------
///* ``[Size: 24 | Height: 28.8]`` headlineSmall2 - SemiBold [w600]
///-------------------------------------------------------------
///* ``[Size: 22 | Height: 28]`` titleLarge - SemiBold [w600]
///-------------------------------------------------------------
///* ``[Size: 22 | Height: 28]`` titleLargeRegular - Regular [w400]
///-------------------------------------------------------------
///* ``[Size: 16 | Height: 24]`` titleMedium - SemiBold [w600]
///-------------------------------------------------------------
///* ``[Size: 16 | Height: 24]`` titleMediumRegular - Regular [w400]
///-------------------------------------------------------------
///* ``[Size: 14 | Height: 20]`` labelLarge - SemiBold [w600]
///-------------------------------------------------------------
///* ``[Size: 14 | Height: 20]`` labelLargeMedium - Medium [w500]
///-------------------------------------------------------------
///* ``[Size: 14 | Height: 20]`` labelLargeRegular - Regular [w400]
///-------------------------------------------------------------
///* ``[Size: 12 | Height: 16]`` labelMedium - SemiBold [w600]
///-------------------------------------------------------------
///* ``[Size: 12 | Height: 16]`` bodySmall - Regular [w400]
///-------------------------------------------------------------
///* ``[Size: 11 | Height: 16]`` labelSmall - Medium [w500]
///-------------------------------------------------------------
///* ``[Size: 11 | Height: 16]`` labelSmallRegular - Regular [w400]
///-------------------------------------------------------------
///* ``[Size: 11 | Height: 16]`` labelSmallMedium - Medium [w500]
///-------------------------------------------------------------
class AppText extends Text {
  const AppText.onlyData(super.data);

  ///``SemiBold TextStyle from headlineLarge.``
  ///
  /// `Size: 32 Height: 40 SemiBold`
  ///
  /// * FontSize: 32
  /// * FontWeight: SemiBold [w600]
  /// * FontFamily: Poppins
  /// * LineHeight: 40
  AppText.headlineLarge(
    String? data, {
    Key? key,
    Color? color,
    double height = 40,
    double fontSize = 32,
    TextLineType? maxLines,
    TextDecoration? decoration,
    required BuildContext context,
    TextAlign align = TextAlign.left,
    FontWeight fontWeight = FontWeight.w600,
    TextOverflow overflow = TextOverflow.ellipsis,
  }) : super(
          key: key,
          data ?? '',
          textAlign: align,
          overflow: overflow,
          maxLines: maxLines?.value,
          style: context.textTheme.headlineLarge?.copyWith(
            fontFamily: FontFamily.poppins,
            fontWeight: fontWeight,
            decoration: decoration,
            fontSize: fontSize,
            height: height,
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
  AppText.headlineMedium(
    String? data, {
    Key? key,
    Color? color,
    double height = 36,
    double fontSize = 28,
    TextLineType? maxLines,
    TextDecoration? decoration,
    required BuildContext context,
    TextAlign align = TextAlign.left,
    FontWeight fontWeight = FontWeight.w600,
    TextOverflow overflow = TextOverflow.ellipsis,
  }) : super(
          key: key,
          data ?? '',
          textAlign: align,
          overflow: overflow,
          maxLines: maxLines?.value,
          style: context.textTheme.headlineMedium?.copyWith(
            fontFamily: FontFamily.poppins,
            fontWeight: fontWeight,
            decoration: decoration,
            fontSize: fontSize,
            height: height,
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
  AppText.headlineSmall(
    String? data, {
    Key? key,
    Color? color,
    double height = 32,
    double fontSize = 24,
    TextLineType? maxLines,
    TextDecoration? decoration,
    required BuildContext context,
    TextAlign align = TextAlign.left,
    FontWeight fontWeight = FontWeight.w600,
    TextOverflow overflow = TextOverflow.ellipsis,
  }) : super(
          key: key,
          data ?? '',
          textAlign: align,
          overflow: overflow,
          maxLines: maxLines?.value,
          style: context.textTheme.headlineSmall?.copyWith(
            fontFamily: FontFamily.poppins,
            fontWeight: fontWeight,
            decoration: decoration,
            fontSize: fontSize,
            height: height,
            color: color,
          ),
        );

  ///``SemiBold TextStyle from headlineSmall.``
  ///
  /// `Size: 24 Height: 28.8 SemiBold`
  ///
  /// * FontSize: 24
  /// * FontWeight: SemiBold [w600]
  /// * FontFamily: Poppins
  /// * LineHeight: 28.8
  AppText.headlineSmall2(
    String? data, {
    Key? key,
    Color? color,
    double height = 28.8,
    double fontSize = 24,
    TextLineType? maxLines,
    TextDecoration? decoration,
    required BuildContext context,
    TextAlign align = TextAlign.left,
    FontWeight fontWeight = FontWeight.w600,
    TextOverflow overflow = TextOverflow.ellipsis,
  }) : super(
          key: key,
          data ?? '',
          textAlign: align,
          overflow: overflow,
          maxLines: maxLines?.value,
          style: context.textTheme.headlineSmall?.copyWith(
            fontFamily: FontFamily.poppins,
            fontWeight: fontWeight,
            decoration: decoration,
            fontSize: fontSize,
            height: height,
            color: color,
          ),
        );

  ///``SemiBold TextStyle from titleLarge.``
  ///
  /// `Size: 22 Height: 28 SemiBold`
  ///
  /// * FontSize: 22
  /// * FontWeight: SemiBold [w600]
  /// * FontFamily: Poppins
  /// * LineHeight: 28
  AppText.titleLarge(
    String? data, {
    Key? key,
    Color? color,
    double height = 28,
    double fontSize = 22,
    TextLineType? maxLines,
    TextDecoration? decoration,
    required BuildContext context,
    TextAlign align = TextAlign.left,
    FontWeight fontWeight = FontWeight.w600,
    TextOverflow overflow = TextOverflow.ellipsis,
  }) : super(
          key: key,
          data ?? '',
          textAlign: align,
          overflow: overflow,
          maxLines: maxLines?.value,
          style: context.textTheme.titleLarge?.copyWith(
            fontFamily: FontFamily.poppins,
            fontWeight: fontWeight,
            decoration: decoration,
            fontSize: fontSize,
            height: height,
            color: color,
          ),
        );

  ///``Regular TextStyle from titleLarge.``
  ///
  /// `Size: 22 Height: 28 Regular`
  ///
  /// * FontSize: 22
  /// * FontWeight: Regular [w400]
  /// * FontFamily: Poppins
  /// * LineHeight: 28
  AppText.titleLargeRegular(
    String? data, {
    Key? key,
    Color? color,
    double height = 28,
    double fontSize = 22,
    TextLineType? maxLines,
    TextDecoration? decoration,
    required BuildContext context,
    TextAlign align = TextAlign.left,
    FontWeight fontWeight = FontWeight.w400,
    TextOverflow overflow = TextOverflow.ellipsis,
  }) : super(
          key: key,
          data ?? '',
          textAlign: align,
          overflow: overflow,
          maxLines: maxLines?.value,
          style: context.textTheme.titleLarge?.copyWith(
            fontFamily: FontFamily.poppins,
            fontWeight: fontWeight,
            decoration: decoration,
            fontSize: fontSize,
            height: height,
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
  AppText.titleMedium(
    String? data, {
    Key? key,
    Color? color,
    double height = 24,
    double fontSize = 16,
    TextLineType? maxLines,
    TextDecoration? decoration,
    required BuildContext context,
    TextAlign align = TextAlign.left,
    FontWeight fontWeight = FontWeight.w600,
    TextOverflow overflow = TextOverflow.ellipsis,
  }) : super(
          key: key,
          data ?? '',
          textAlign: align,
          overflow: overflow,
          maxLines: maxLines?.value,
          style: context.textTheme.titleMedium?.copyWith(
            fontFamily: FontFamily.poppins,
            fontWeight: fontWeight,
            decoration: decoration,
            fontSize: fontSize,
            height: height,
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
    double height = 24,
    double fontSize = 16,
    TextLineType? maxLines,
    TextDecoration? decoration,
    required BuildContext context,
    TextAlign align = TextAlign.left,
    FontWeight fontWeight = FontWeight.w400,
    TextOverflow overflow = TextOverflow.ellipsis,
  }) : super(
          key: key,
          data ?? '',
          textAlign: align,
          overflow: overflow,
          maxLines: maxLines?.value,
          style: context.textTheme.titleMedium?.copyWith(
            fontFamily: FontFamily.poppins,
            fontWeight: fontWeight,
            decoration: decoration,
            fontSize: fontSize,
            height: height,
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
  AppText.labelLarge(
    String? data, {
    Key? key,
    Color? color,
    double height = 20,
    double fontSize = 14,
    TextLineType? maxLines,
    TextDecoration? decoration,
    required BuildContext context,
    TextAlign align = TextAlign.left,
    FontWeight fontWeight = FontWeight.w600,
    TextOverflow overflow = TextOverflow.ellipsis,
  }) : super(
          key: key,
          data ?? '',
          textAlign: align,
          overflow: overflow,
          maxLines: maxLines?.value,
          style: context.textTheme.labelLarge?.copyWith(
            fontFamily: FontFamily.poppins,
            fontWeight: fontWeight,
            decoration: decoration,
            fontSize: fontSize,
            height: height,
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
    double height = 20,
    double fontSize = 14,
    TextLineType? maxLines,
    TextDecoration? decoration,
    required BuildContext context,
    TextAlign align = TextAlign.left,
    FontWeight fontWeight = FontWeight.w500,
    TextOverflow overflow = TextOverflow.ellipsis,
  }) : super(
          key: key,
          data ?? '',
          textAlign: align,
          overflow: overflow,
          maxLines: maxLines?.value,
          style: context.textTheme.labelLarge?.copyWith(
            fontFamily: FontFamily.poppins,
            fontWeight: fontWeight,
            decoration: decoration,
            fontSize: fontSize,
            height: height,
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
    TextOverflow overflow = TextOverflow.ellipsis,
  }) : super(
          key: key,
          data ?? '',
          textAlign: align,
          overflow: overflow,
          maxLines: maxLines?.value,
          style: context.textTheme.labelLarge?.copyWith(
            fontFamily: FontFamily.poppins,
            fontWeight: fontWeight,
            decoration: decoration,
            fontSize: fontSize,
            height: height,
            color: color,
          ),
        );

  ///``SemiBold TextStyle from labelMedium.``
  ///
  /// `Size: 14 Height: 20 SemiBold`
  ///
  /// * FontSize: 12
  /// * FontWeight: SemiBold [w600]
  /// * FontFamily: Poppins
  /// * LineHeight: 16
  AppText.labelMedium(
    String? data, {
    Key? key,
    Color? color,
    double height = 16,
    double fontSize = 12,
    TextLineType? maxLines,
    TextDecoration? decoration,
    required BuildContext context,
    TextAlign align = TextAlign.left,
    FontWeight fontWeight = FontWeight.w600,
    TextOverflow overflow = TextOverflow.ellipsis,
  }) : super(
          key: key,
          data ?? '',
          textAlign: align,
          overflow: overflow,
          maxLines: maxLines?.value,
          style: context.textTheme.labelMedium?.copyWith(
            fontFamily: FontFamily.poppins,
            fontWeight: fontWeight,
            decoration: decoration,
            fontSize: fontSize,
            height: height,
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
  AppText.bodySmall(
    String? data, {
    Key? key,
    Color? color,
    double height = 16,
    double fontSize = 12,
    TextLineType? maxLines,
    TextDecoration? decoration,
    required BuildContext context,
    TextAlign align = TextAlign.left,
    FontWeight fontWeight = FontWeight.w400,
    TextOverflow overflow = TextOverflow.ellipsis,
  }) : super(
          key: key,
          data ?? '',
          textAlign: align,
          overflow: overflow,
          maxLines: maxLines?.value,
          style: context.textTheme.bodySmall?.copyWith(
            fontFamily: FontFamily.poppins,
            fontWeight: fontWeight,
            decoration: decoration,
            fontSize: fontSize,
            height: height,
            color: color,
          ),
        );

  ///``Medium TextStyle from labelSmall.``
  ///
  /// `Size: 11 Height: 16 Medium`
  ///
  /// * FontSize: 11
  /// * FontWeight: Medium [w500]
  /// * FontFamily: Poppins
  /// * LineHeight: 16
  AppText.labelSmall(
    String? data, {
    Key? key,
    Color? color,
    double height = 16,
    double fontSize = 11,
    TextLineType? maxLines,
    TextDecoration? decoration,
    required BuildContext context,
    TextAlign align = TextAlign.left,
    FontWeight fontWeight = FontWeight.w500,
    TextOverflow overflow = TextOverflow.ellipsis,
  }) : super(
          key: key,
          data ?? '',
          textAlign: align,
          overflow: overflow,
          maxLines: maxLines?.value,
          style: context.textTheme.labelSmall?.copyWith(
            fontFamily: FontFamily.poppins,
            fontWeight: fontWeight,
            decoration: decoration,
            fontSize: fontSize,
            height: height,
            color: color,
          ),
        );

  ///``Regular TextStyle from labelSmall.``
  ///
  /// `Size: 11 Height: 16 Regular`
  ///
  /// * FontSize: 11
  /// * FontWeight: Regular [w400]
  /// * FontFamily: Poppins
  /// * LineHeight: 16
  AppText.labelSmallRegular(
    String? data, {
    Key? key,
    Color? color,
    double height = 16,
    double fontSize = 11,
    TextLineType? maxLines,
    TextDecoration? decoration,
    required BuildContext context,
    TextAlign align = TextAlign.left,
    FontWeight fontWeight = FontWeight.w400,
    TextOverflow overflow = TextOverflow.ellipsis,
  }) : super(
          key: key,
          data ?? '',
          textAlign: align,
          overflow: overflow,
          maxLines: maxLines?.value,
          style: context.textTheme.labelSmall?.copyWith(
            fontFamily: FontFamily.poppins,
            fontWeight: fontWeight,
            decoration: decoration,
            fontSize: fontSize,
            height: height,
            color: color,
          ),
        );

  ///``Medium TextStyle from labelSmall.``
  ///
  /// `Size: 11 Height: 16 Medium`
  ///
  /// * FontSize: 11
  /// * FontWeight: Medium [w500]
  /// * FontFamily: Poppins
  /// * LineHeight: 16
  AppText.labelSmallMedium(
    String? data, {
    Key? key,
    Color? color,
    double height = 16,
    double fontSize = 11,
    TextLineType? maxLines,
    TextDecoration? decoration,
    required BuildContext context,
    TextAlign align = TextAlign.left,
    FontWeight fontWeight = FontWeight.w500,
    TextOverflow overflow = TextOverflow.ellipsis,
  }) : super(
          key: key,
          data ?? '',
          textAlign: align,
          overflow: overflow,
          maxLines: maxLines?.value,
          style: context.textTheme.labelSmall?.copyWith(
            fontFamily: FontFamily.poppins,
            fontWeight: fontWeight,
            decoration: decoration,
            fontSize: fontSize,
            height: height,
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
