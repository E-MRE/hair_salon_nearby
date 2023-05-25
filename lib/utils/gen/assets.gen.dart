/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';

class $AssetsEnvsGen {
  const $AssetsEnvsGen();

  /// File path: assets/envs/product_environment.env
  String get productEnvironment => 'assets/envs/product_environment.env';

  /// File path: assets/envs/test_environment.env
  String get testEnvironment => 'assets/envs/test_environment.env';

  /// List of all assets
  List<String> get values => [productEnvironment, testEnvironment];
}

class $AssetsFontsGen {
  const $AssetsFontsGen();

  /// File path: assets/fonts/Poppins-Black.ttf
  String get poppinsBlack => 'assets/fonts/Poppins-Black.ttf';

  /// File path: assets/fonts/Poppins-BlackItalic.ttf
  String get poppinsBlackItalic => 'assets/fonts/Poppins-BlackItalic.ttf';

  /// File path: assets/fonts/Poppins-Bold.ttf
  String get poppinsBold => 'assets/fonts/Poppins-Bold.ttf';

  /// File path: assets/fonts/Poppins-BoldItalic.ttf
  String get poppinsBoldItalic => 'assets/fonts/Poppins-BoldItalic.ttf';

  /// File path: assets/fonts/Poppins-ExtraBold.ttf
  String get poppinsExtraBold => 'assets/fonts/Poppins-ExtraBold.ttf';

  /// File path: assets/fonts/Poppins-ExtraBoldItalic.ttf
  String get poppinsExtraBoldItalic => 'assets/fonts/Poppins-ExtraBoldItalic.ttf';

  /// File path: assets/fonts/Poppins-ExtraLight.ttf
  String get poppinsExtraLight => 'assets/fonts/Poppins-ExtraLight.ttf';

  /// File path: assets/fonts/Poppins-ExtraLightItalic.ttf
  String get poppinsExtraLightItalic => 'assets/fonts/Poppins-ExtraLightItalic.ttf';

  /// File path: assets/fonts/Poppins-Italic.ttf
  String get poppinsItalic => 'assets/fonts/Poppins-Italic.ttf';

  /// File path: assets/fonts/Poppins-Light.ttf
  String get poppinsLight => 'assets/fonts/Poppins-Light.ttf';

  /// File path: assets/fonts/Poppins-LightItalic.ttf
  String get poppinsLightItalic => 'assets/fonts/Poppins-LightItalic.ttf';

  /// File path: assets/fonts/Poppins-Medium.ttf
  String get poppinsMedium => 'assets/fonts/Poppins-Medium.ttf';

  /// File path: assets/fonts/Poppins-MediumItalic.ttf
  String get poppinsMediumItalic => 'assets/fonts/Poppins-MediumItalic.ttf';

  /// File path: assets/fonts/Poppins-Regular.ttf
  String get poppinsRegular => 'assets/fonts/Poppins-Regular.ttf';

  /// File path: assets/fonts/Poppins-SemiBold.ttf
  String get poppinsSemiBold => 'assets/fonts/Poppins-SemiBold.ttf';

  /// File path: assets/fonts/Poppins-SemiBoldItalic.ttf
  String get poppinsSemiBoldItalic => 'assets/fonts/Poppins-SemiBoldItalic.ttf';

  /// File path: assets/fonts/Poppins-Thin.ttf
  String get poppinsThin => 'assets/fonts/Poppins-Thin.ttf';

  /// File path: assets/fonts/Poppins-ThinItalic.ttf
  String get poppinsThinItalic => 'assets/fonts/Poppins-ThinItalic.ttf';

  /// List of all assets
  List<String> get values => [
        poppinsBlack,
        poppinsBlackItalic,
        poppinsBold,
        poppinsBoldItalic,
        poppinsExtraBold,
        poppinsExtraBoldItalic,
        poppinsExtraLight,
        poppinsExtraLightItalic,
        poppinsItalic,
        poppinsLight,
        poppinsLightItalic,
        poppinsMedium,
        poppinsMediumItalic,
        poppinsRegular,
        poppinsSemiBold,
        poppinsSemiBoldItalic,
        poppinsThin,
        poppinsThinItalic
      ];
}

class $AssetsImagesGen {
  const $AssetsImagesGen();

  $AssetsImagesPngGen get png => const $AssetsImagesPngGen();
}

class $AssetsTranslationsGen {
  const $AssetsTranslationsGen();

  /// File path: assets/translations/en-En.json
  String get enEn => 'assets/translations/en-En.json';

  /// File path: assets/translations/tr-TR.json
  String get trTR => 'assets/translations/tr-TR.json';

  /// List of all assets
  List<String> get values => [enEn, trTR];
}

class $AssetsImagesPngGen {
  const $AssetsImagesPngGen();

  /// File path: assets/images/png/ic_logo.png
  AssetGenImage get icLogo => const AssetGenImage('assets/images/png/ic_logo.png');

  /// File path: assets/images/png/splash.png
  AssetGenImage get splash => const AssetGenImage('assets/images/png/splash.png');

  /// List of all assets
  List<AssetGenImage> get values => [icLogo, splash];
}

class Assets {
  Assets._();

  static const $AssetsEnvsGen envs = $AssetsEnvsGen();
  static const $AssetsFontsGen fonts = $AssetsFontsGen();
  static const $AssetsImagesGen images = $AssetsImagesGen();
  static const $AssetsTranslationsGen translations = $AssetsTranslationsGen();
}

class AssetGenImage {
  const AssetGenImage(this._assetName);

  final String _assetName;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = false,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.low,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider({
    AssetBundle? bundle,
    String? package,
  }) {
    return AssetImage(
      _assetName,
      bundle: bundle,
      package: package,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
