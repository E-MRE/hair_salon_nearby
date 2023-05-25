import 'package:flutter/material.dart';

import '../../core/extensions/screen_util_extensions.dart';
import '../enum/sizes.dart';

class PagePadding extends Padding {
  ///Girilen child'a tüm alanlardan padding uygular.
  ///Tüm alanlardan [24.0] boşluk bırakır.
  PagePadding({Key? key, Widget? child}) : this._scaledAll(key: key, value: Sizes.big, child: child);

  ///Girilen child'a tüm alanlardan padding uygular.
  ///Tüm alanlardan [8.0] boşluk bırakır.
  PagePadding.extraSmall({Key? key, Widget? child}) : this._scaledAll(key: key, value: Sizes.prettySmall, child: child);

  ///Girilen child'a tüm alanlardan padding uygular.
  ///Tüm alanlardan [16.0] boşluk bırakır.
  PagePadding.small({Key? key, Widget? child}) : this._scaledAll(key: key, value: Sizes.medium, child: child);

  ///Girilen child'a tüm alanlardan padding uygular.
  ///Tüm alanlardan [32.0] boşluk bırakır.
  PagePadding.large({Key? key, Widget? child}) : this._scaledAll(key: key, value: Sizes.veryBig, child: child);

  ///Girilen child'a tüm alanlardan padding uygular.
  ///Boşluk bırakmak için [padding] 'e değer girilmelidir.
  ///Girilen değer [CustomPadding] türünde olmalıdır.
  PagePadding.all({Key? key, Widget? child, required Sizes padding})
      : this._scaledAll(key: key, value: padding, child: child);

  ///Girilen child'a simetrik olarak padding uygular.
  ///[horizontal] ve [vertical] 'e girilen değer değiştirilebilir.
  PagePadding.symmetric({Key? key, Widget? child, required Sizes horizontal, required Sizes vertical})
      : this._scaledSymmetric(key: key, horizontal: horizontal, vertical: vertical, child: child);

  ///Girilen child'a yanlardan [32.0], dikeyden [16.0] boşluk bırakır.
  PagePadding.symmetricNormal({Key? key, Widget? child})
      : this._scaledSymmetric(key: key, horizontal: Sizes.veryBig, vertical: Sizes.medium, child: child);

  ///Girilen child'a yanlardan [24.0], dikeyden [32.0] boşluk bırakır.
  PagePadding.mediumLarge({Key? key, Widget? child})
      : this._scaledSymmetric(key: key, horizontal: Sizes.big, vertical: Sizes.veryBig, child: child);

  ///Girilen child'a dikeyden [16.0] boşluk bırakır.
  PagePadding.verticalSmall({Key? key, Widget? child})
      : this._scaledSymmetric(key: key, vertical: Sizes.medium, child: child);

  ///Girilen child'a dikeyden [24.0] boşluk bırakır.
  PagePadding.verticalNormal({Key? key, Widget? child})
      : this._scaledSymmetric(key: key, vertical: Sizes.big, child: child);

  ///Girilen child'a dikeyden [32.0] boşluk bırakır.
  PagePadding.verticalLarge({Key? key, Widget? child})
      : this._scaledSymmetric(key: key, vertical: Sizes.veryBig, child: child);

  ///Girilen child'a dikeyden boşluk bırakmak için kullanılır.
  PagePadding.vertical({Key? key, Widget? child, required Sizes padding})
      : this._scaledSymmetric(key: key, vertical: padding, child: child);

  ///Girilen child'a yanlardan [24.0] boşluk bırakır.
  PagePadding.horizontalNormal({Key? key, Widget? child})
      : this._scaledSymmetric(key: key, horizontal: Sizes.big, child: child);

  ///Girilen child'a yanlardan [32.0] boşluk bırakır.
  PagePadding.horizontalLarge({Key? key, Widget? child})
      : this._scaledSymmetric(key: key, horizontal: Sizes.veryBig, child: child);

  ///Girilen child'a yanlardan boşluk bırakmak için kullanılır.
  PagePadding.horizontal({Key? key, Widget? child, required Sizes padding})
      : this._scaledSymmetric(key: key, child: child, horizontal: padding);

  ///Girilen child'a seçili alanlardan padding uygular.
  PagePadding.only({
    Key? key,
    Widget? child,
    Sizes left = Sizes.none,
    Sizes right = Sizes.none,
    Sizes top = Sizes.none,
    Sizes bottom = Sizes.none,
  }) : super(
          key: key,
          child: child,
          padding: EdgeInsets.only(
            left: left.rawValue(),
            right: right.rawValue(),
            top: top.rawValue(),
            bottom: bottom.rawValue(),
          ).symmetricScale,
        );

  ///Girilen child'a seçili alanlardan padding uygular.
  ///Değerler double olmalıdır.
  PagePadding.onlyByDouble({
    Key? key,
    Widget? child,
    double left = 0,
    double right = 0,
    double top = 0,
    double bottom = 0,
  }) : super(
          key: key,
          child: child,
          padding: EdgeInsets.only(
            left: left,
            right: right,
            top: top,
            bottom: bottom,
          ).symmetricScale,
        );

  PagePadding._scaledAll({Key? key, required Sizes value, bool isScaledValue = true, Widget? child})
      : super(
          key: key,
          padding: isScaledValue ? EdgeInsets.all(value.rawValue()) : EdgeInsets.all(value.rawValue()).symmetricScale,
          child: child,
        );

  PagePadding._scaledSymmetric({Key? key, Sizes? horizontal, Sizes? vertical, bool isScaledValue = true, Widget? child})
      : super(
          key: key,
          padding: EdgeInsets.symmetric(
            horizontal: (isScaledValue ? horizontal?.getWidthScale() : horizontal?.rawValue()) ?? Sizes.none.rawValue(),
            vertical: (isScaledValue ? vertical?.getWidthScale() : vertical?.rawValue()) ?? Sizes.none.rawValue(),
          ),
          child: child,
        );
}
