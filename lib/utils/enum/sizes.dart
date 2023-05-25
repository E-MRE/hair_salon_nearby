import 'package:base_flutter_project/core/extensions/screen_util_extensions.dart';

///Standart genişlik, yükseklik vermek için kullanılır.
/// * none = 0
/// * ultraSmall = 2
/// * extraSmall = 4
/// * verySmall = 6
/// * prettySmall = 8
/// * smaller = 10
/// * small = 12
/// * smallerThanMedium = 14
/// * medium = 16
/// * extraSmallerThanBig = 18
/// * verySmallerThanBig = 20
/// * smallerThanBig = 22
/// * big = 24
/// * bigger = 26
/// * prettyBig = 28
/// * veryBig = 32
/// * extraBig = 36
/// * ultraBig = 42
/// * smallerThanLarge = 46
/// * large = 48
/// * prettyLarge = 54
/// * veryLarge = 60
/// * extraLarge = 64
/// * ultraLarge = 68
/// * verySmallerThanJumbo = 72
/// * prettySmallerThanJumbo = 74
/// * smallerThanJumbo = 78
/// * jumbo = 80
/// * prettyJumbo = 84
/// * veryJumbo = 88
/// * extraJumbo = 90
/// * ultraJumbo = 94
/// * huge = 96
/// * prettyHuge = 100
/// * veryHuge = 102
/// * extraHuge = 106
/// * ultraHuge = 108
/// * extraExtraPrettyBig = 112
/// * extraExtraVeryBig = 118
/// * extraExtraExtraBig = 120
/// * extraExtraUltraBig = 124
/// * extraExtraPrettyLarge = 128
/// * extraExtraVeryLarge = 132
/// * extraExtraExtraLarge = 136
/// * extraExtraUltraLarge = 140
/// * extraExtraPrettyJumbo = 144
/// * extraExtraVeryJumbo = 148
/// * extraExtraExtraJumbo = 152
/// * extraExtraUltraJumbo = 156
/// * extraPrettyExtraPrettyBig = 158
/// * extraPrettyExtraVeryBig = 160
/// * extraPrettyExtraExtraBig = 164
/// * extraPrettyExtraUltraBig = 168
/// * extraPrettyExtraPrettyLarge = 172
/// * extraPrettyExtraVeryLarge = 180
/// * extraPrettyExtraExtraLarge = 188
/// * extraPrettyExtraUltraLarge = 192
/// * extraPrettyExtraPrettyJumbo = 196
/// * extraPrettyExtraVeryJumbo = 200
/// * extraPrettyExtraExtraJumbo = 208
/// * extraPrettyExtraUltraJumbo = 216
/// * extraVeryExtraPrettyBig = 220
/// * extraVeryExtraVeryBig = 224
/// * extraVeryExtraExtraBig = 232
/// * extraVeryExtraUltraBig = 236
/// * extraVeryExtraPrettyLarge = 240
/// * extraVeryExtraVeryLarge = 244
/// * extraVeryExtraExtraLarge = 248
/// * extraVeryExtraUltraLarge = 256
/// * extraVeryExtraPrettyJumbo = 258
/// * extraVeryExtraVeryJumbo = 260
/// * extraVeryExtraExtraJumbo = 264
/// * extraVeryExtraUltraJumbo = 268
/// * extraUltraExtraPrettyBig = 272
/// * extraUltraExtraVeryBig = 280
/// * extraUltraExtraExtraBig = 288
/// * extraUltraExtraUltraBig = 296
/// * extraUltraExtraPrettyLarge = 300
/// * extraUltraExtraVeryLarge = 304
/// * extraUltraExtraExtraLarge = 308
/// * extraUltraExtraUltraLarge = 312
/// * extraUltraExtraPrettyJumbo = 320
/// * extraUltraExtraVeryJumbo = 340
/// * extraUltraExtraExtraJumbo = 360
/// * extraUltraExtraUltraJumbo = 380
enum Sizes {
  ///value = 0
  none,

  ///value = 2
  ultraSmall,

  ///value = 4
  extraSmall,

  ///value = 6
  verySmall,

  ///value = 8
  prettySmall,

  ///value = 10
  smaller,

  ///value = 12
  small,

  ///value = 14
  smallerThanMedium,

  ///value = 16
  medium,

  ///value = 18
  extraSmallerThanBig,

  ///value = 20
  verySmallerThanBig,

  ///value = 22
  smallerThanBig,

  ///value = 24
  big,

  ///value = 26
  bigger,

  ///value = 28
  prettyBig,

  ///value = 32
  veryBig,

  ///value = 36
  extraBig,

  ///value = 42
  ultraBig,

  ///value = 46
  smallerThanLarge,

  ///value = 48
  large,

  ///value = 54
  prettyLarge,

  ///value = 60
  veryLarge,

  ///value = 64
  extraLarge,

  ///value = 68
  ultraLarge,

  ///value = 72
  verySmallerThanJumbo,

  ///value = 74
  prettySmallerThanJumbo,

  ///value = 78
  smallerThanJumbo,

  ///value = 80
  jumbo,

  ///value = 84
  prettyJumbo,

  ///value = 88
  veryJumbo,

  ///value = 90
  extraJumbo,

  ///value = 94
  ultraJumbo,

  ///value = 96
  huge,

  ///value = 100
  prettyHuge,

  ///value = 102
  veryHuge,

  ///value = 106
  extraHuge,

  ///value = 108
  ultraHuge,

  ///value = 112
  extraExtraPrettyBig,

  ///value = 118
  extraExtraVeryBig,

  ///value = 120
  extraExtraExtraBig,

  ///value = 124
  extraExtraUltraBig,

  ///value = 128
  extraExtraPrettyLarge,

  ///value = 132
  extraExtraVeryLarge,

  ///value = 136
  extraExtraExtraLarge,

  ///value = 140
  extraExtraUltraLarge,

  ///value = 144
  extraExtraPrettyJumbo,

  ///value = 148
  extraExtraVeryJumbo,

  ///value = 152
  extraExtraExtraJumbo,

  ///value = 156
  extraExtraUltraJumbo,

  ///value = 158
  extraPrettyExtraPrettyBig,

  ///value = 160
  extraPrettyExtraVeryBig,

  ///value = 164
  extraPrettyExtraExtraBig,

  ///value = 168
  extraPrettyExtraUltraBig,

  ///value = 172
  extraPrettyExtraPrettyLarge,

  ///value = 180
  extraPrettyExtraVeryLarge,

  ///value = 188
  extraPrettyExtraExtraLarge,

  ///value = 192
  extraPrettyExtraUltraLarge,

  ///value = 196
  extraPrettyExtraPrettyJumbo,

  ///value = 200
  extraPrettyExtraVeryJumbo,

  ///value = 208
  extraPrettyExtraExtraJumbo,

  ///value = 216
  extraPrettyExtraUltraJumbo,

  ///value = 220
  extraVeryExtraPrettyBig,

  ///value = 224
  extraVeryExtraVeryBig,

  ///value = 232
  extraVeryExtraExtraBig,

  ///value = 236
  extraVeryExtraUltraBig,

  ///value = 240
  extraVeryExtraPrettyLarge,

  ///value = 244
  extraVeryExtraVeryLarge,

  ///value = 248
  extraVeryExtraExtraLarge,

  ///value = 256
  extraVeryExtraUltraLarge,

  ///value = 258
  extraVeryExtraPrettyJumbo,

  ///value = 260
  extraVeryExtraVeryJumbo,

  ///value = 264
  extraVeryExtraExtraJumbo,

  ///value = 268
  extraVeryExtraUltraJumbo,

  ///value = 272
  extraUltraExtraPrettyBig,

  ///value = 280
  extraUltraExtraVeryBig,

  ///value = 288
  extraUltraExtraExtraBig,

  ///value = 296
  extraUltraExtraUltraBig,

  ///value = 300
  extraUltraExtraPrettyLarge,

  ///value = 304
  extraUltraExtraVeryLarge,

  ///value = 308
  extraUltraExtraExtraLarge,

  ///value = 312
  extraUltraExtraUltraLarge,

  ///value = 320
  extraUltraExtraPrettyJumbo,

  ///value = 340
  extraUltraExtraVeryJumbo,

  ///value = 360
  extraUltraExtraExtraJumbo,

  ///value = 380
  extraUltraExtraUltraJumbo,
}

extension SizesExtension on Sizes {
  ///It returns double value after scaled with radius
  double getRadiusScale() {
    return this.rawValue().radiusScale;
  }

  ///It returns double value after scaled with screen & design height
  double getHeightScale() {
    return this.rawValue().radiusScale;
  }

  ///It returns double value after scaled with screen & design width
  double getWidthScale() {
    return this.rawValue().radiusScale;
  }

  ///It returns double value of [Sizes]
  double rawValue() {
    switch (this) {
      ///value =  0
      case Sizes.none:
        return 0;

      ///value =  2
      case Sizes.ultraSmall:
        return 2;

      ///value =  4
      case Sizes.extraSmall:
        return 4;

      ///value =  6
      case Sizes.verySmall:
        return 6;

      ///value =  8
      case Sizes.prettySmall:
        return 8;

      ///value =  10
      case Sizes.smaller:
        return 10;

      ///value =  12
      case Sizes.small:
        return 12;

      ///value =  14
      case Sizes.smallerThanMedium:
        return 14;

      ///value =  16
      case Sizes.medium:
        return 16;

      ///value =  18
      case Sizes.extraSmallerThanBig:
        return 18;

      ///value =  20
      case Sizes.verySmallerThanBig:
        return 20;

      ///value =  22
      case Sizes.smallerThanBig:
        return 22;

      ///value =  24
      case Sizes.big:
        return 24;

      ///value =  26
      case Sizes.bigger:
        return 26;

      ///value =  28
      case Sizes.prettyBig:
        return 28;

      ///value =  32
      case Sizes.veryBig:
        return 32;

      ///value =  36
      case Sizes.extraBig:
        return 36;

      ///value =  42
      case Sizes.ultraBig:
        return 42;

      ///value =  46
      case Sizes.smallerThanLarge:
        return 46;

      ///value =  48
      case Sizes.large:
        return 48;

      ///value =  54
      case Sizes.prettyLarge:
        return 54;

      ///value =  60
      case Sizes.veryLarge:
        return 60;

      ///value =  64
      case Sizes.extraLarge:
        return 64;

      ///value =  68
      case Sizes.ultraLarge:
        return 68;

      ///value =  72
      case Sizes.verySmallerThanJumbo:
        return 72;

      ///value =  74
      case Sizes.prettySmallerThanJumbo:
        return 74;

      ///value =  78
      case Sizes.smallerThanJumbo:
        return 78;

      ///value =  80
      case Sizes.jumbo:
        return 80;

      ///value =  84
      case Sizes.prettyJumbo:
        return 84;

      ///value =  88
      case Sizes.veryJumbo:
        return 88;

      ///value =  90
      case Sizes.extraJumbo:
        return 90;

      ///value =  94
      case Sizes.ultraJumbo:
        return 94;

      ///value =  96
      case Sizes.huge:
        return 96;

      ///value =  100
      case Sizes.prettyHuge:
        return 100;

      ///value =  102
      case Sizes.veryHuge:
        return 102;

      ///value =  106
      case Sizes.extraHuge:
        return 106;

      ///value =  108
      case Sizes.ultraHuge:
        return 108;

      ///value =  112
      case Sizes.extraExtraPrettyBig:
        return 112;

      ///value =  118
      case Sizes.extraExtraVeryBig:
        return 118;

      ///value =  120
      case Sizes.extraExtraExtraBig:
        return 120;

      ///value =  124
      case Sizes.extraExtraUltraBig:
        return 124;

      ///value =  128
      case Sizes.extraExtraPrettyLarge:
        return 128;

      ///value =  132
      case Sizes.extraExtraVeryLarge:
        return 132;

      ///value =  136
      case Sizes.extraExtraExtraLarge:
        return 136;

      ///value =  140
      case Sizes.extraExtraUltraLarge:
        return 140;

      ///value =  144
      case Sizes.extraExtraPrettyJumbo:
        return 144;

      ///value =  148
      case Sizes.extraExtraVeryJumbo:
        return 148;

      ///value =  152
      case Sizes.extraExtraExtraJumbo:
        return 152;

      ///value =  156
      case Sizes.extraExtraUltraJumbo:
        return 156;

      ///value =  158
      case Sizes.extraPrettyExtraPrettyBig:
        return 158;

      ///value =  160
      case Sizes.extraPrettyExtraVeryBig:
        return 160;

      ///value =  164
      case Sizes.extraPrettyExtraExtraBig:
        return 164;

      ///value =  168
      case Sizes.extraPrettyExtraUltraBig:
        return 168;

      ///value =  172
      case Sizes.extraPrettyExtraPrettyLarge:
        return 172;

      ///value =  180
      case Sizes.extraPrettyExtraVeryLarge:
        return 180;

      ///value =  188
      case Sizes.extraPrettyExtraExtraLarge:
        return 188;

      ///value =  192
      case Sizes.extraPrettyExtraUltraLarge:
        return 192;

      ///value =  196
      case Sizes.extraPrettyExtraPrettyJumbo:
        return 196;

      ///value =  200
      case Sizes.extraPrettyExtraVeryJumbo:
        return 200;

      ///value =  208
      case Sizes.extraPrettyExtraExtraJumbo:
        return 208;

      ///value =  216
      case Sizes.extraPrettyExtraUltraJumbo:
        return 216;

      ///value =  220
      case Sizes.extraVeryExtraPrettyBig:
        return 220;

      ///value =  224
      case Sizes.extraVeryExtraVeryBig:
        return 224;

      ///value =  232
      case Sizes.extraVeryExtraExtraBig:
        return 232;

      ///value =  236
      case Sizes.extraVeryExtraUltraBig:
        return 236;

      ///value =  240
      case Sizes.extraVeryExtraPrettyLarge:
        return 240;

      ///value =  244
      case Sizes.extraVeryExtraVeryLarge:
        return 244;

      ///value =  248
      case Sizes.extraVeryExtraExtraLarge:
        return 248;

      ///value =  256
      case Sizes.extraVeryExtraUltraLarge:
        return 256;

      ///value =  258
      case Sizes.extraVeryExtraPrettyJumbo:
        return 258;

      ///value =  260
      case Sizes.extraVeryExtraVeryJumbo:
        return 260;

      ///value =  264
      case Sizes.extraVeryExtraExtraJumbo:
        return 264;

      ///value =  268
      case Sizes.extraVeryExtraUltraJumbo:
        return 268;

      ///value =  272
      case Sizes.extraUltraExtraPrettyBig:
        return 272;

      ///value =  280
      case Sizes.extraUltraExtraVeryBig:
        return 280;

      ///value =  288
      case Sizes.extraUltraExtraExtraBig:
        return 288;

      ///value =  296
      case Sizes.extraUltraExtraUltraBig:
        return 296;

      ///value =  300
      case Sizes.extraUltraExtraPrettyLarge:
        return 300;

      ///value =  304
      case Sizes.extraUltraExtraVeryLarge:
        return 304;

      ///value =  308
      case Sizes.extraUltraExtraExtraLarge:
        return 308;

      ///value =  312
      case Sizes.extraUltraExtraUltraLarge:
        return 312;

      ///value =  320
      case Sizes.extraUltraExtraPrettyJumbo:
        return 320;

      ///value =  340
      case Sizes.extraUltraExtraVeryJumbo:
        return 340;

      ///value =  360
      case Sizes.extraUltraExtraExtraJumbo:
        return 360;

      ///value =  380
      case Sizes.extraUltraExtraUltraJumbo:
        return 380;
    }
  }
}
