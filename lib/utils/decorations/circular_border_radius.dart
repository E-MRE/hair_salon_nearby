import 'package:flutter/material.dart';

import '../enum/sizes.dart';

///Dairesel yarıçap vermek için kullanılır.
class CircularBorderRadius extends BorderRadius {
  ///Dairesel yarıçap vermek için kullanılır.
  ///Girilen radius değeri kadar dairesel yarıçap uygular.
  CircularBorderRadius({required Sizes radius}) : super.circular(radius.getRadiusScale());

  ///Dairesel yarıçap vermek için kullanılır.
  ///`Yarıçap = 4.0` olarak ayarlanmıştır.
  CircularBorderRadius.extraSmall() : super.circular(Sizes.extraSmall.getRadiusScale());

  ///Dairesel yarıçap vermek için kullanılır.
  ///`Yarıçap = 8.0` olarak ayarlanmıştır.
  CircularBorderRadius.small() : super.circular(Sizes.small.getRadiusScale());

  ///Dairesel yarıçap vermek için kullanılır.
  ///`Yarıçap = 16.0` olarak ayarlanmıştır.
  CircularBorderRadius.normal() : super.circular(Sizes.medium.getRadiusScale());

  ///Dairesel yarıçap vermek için kullanılır.
  ///`Yarıçap = 24.0` olarak ayarlanmıştır.
  CircularBorderRadius.big() : super.circular(Sizes.big.getRadiusScale());

  ///Dairesel yarıçap vermek için kullanılır.
  ///`Yarıçap = 32.0` olarak ayarlanmıştır.
  CircularBorderRadius.huge() : super.circular(Sizes.veryBig.getRadiusScale());

  ///Dairesel yarıçap vermek için kullanılır.
  ///`Yarıçap = 48.0` olarak ayarlanmıştır.
  CircularBorderRadius.moreHuge() : super.circular(Sizes.extraBig.getRadiusScale());

  ///Dairesel yarıçap vermek için kullanılır.
  ///`Yarıçap = 64.0` olarak ayarlanmıştır.
  CircularBorderRadius.extreme() : super.circular(Sizes.extraLarge.getRadiusScale());

  ///Dairesel yarıçap vermek için kullanılır.
  ///`Yarıçap = 96.0` olarak ayarlanmıştır.
  CircularBorderRadius.ultraBig() : super.circular(Sizes.huge.getRadiusScale());

  //Sadece üst kısma dairesel yarıçap vermek için kullanılır.
  CircularBorderRadius.topCircular(Sizes radius)
      : super.only(
          topLeft: Radius.circular(radius.getRadiusScale()),
          topRight: Radius.circular(radius.getRadiusScale()),
        );

  //Sadece üst kısma dairesel yarıçap vermek için kullanılır.
  ///`Yarıçap = 8.0` olarak ayarlanmıştır.
  CircularBorderRadius.topCircularSmall()
      : super.only(
          topLeft: Radius.circular(Sizes.small.getRadiusScale()),
          topRight: Radius.circular(Sizes.small.getRadiusScale()),
        );

  //Sadece alt kısma dairesel yarıçap vermek için kullanılır.
  ///`Yarıçap = 8.0` olarak ayarlanmıştır.
  CircularBorderRadius.bottomCircularSmall()
      : super.only(
          bottomLeft: Radius.circular(Sizes.small.getRadiusScale()),
          bottomRight: Radius.circular(Sizes.small.getRadiusScale()),
        );
}
