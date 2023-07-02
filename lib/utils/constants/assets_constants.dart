import '../gen/assets.gen.dart';

/**
 * You can easily manage assets with that class.
 * This class uses power of FlutterGen package.
 * Just call assets getter what you need.
 */
class AssetsConstants {
  static AssetsConstants? _instance;
  static AssetsConstants get instance {
    _instance ??= AssetsConstants._init();
    return _instance!;
  }

  AssetsConstants._init();

  $AssetsFontsGen get getFonts => Assets.fonts;
  $AssetsImagesPngGen get getPngImages => Assets.images.png;
  $AssetsImagesSvgGen get getSvgImages => Assets.images.svg;
  $AssetsTranslationsGen get getTranslations => Assets.translations;
}
