import 'package:flutter/material.dart';

import '../enum/sizes.dart';

///Used to give a circular radius.
class CircularBorderRadius extends BorderRadius {
  ///Used to give a circular radius.
  ///It applies a circular radius as much as the entered radius value.
  CircularBorderRadius({required Sizes radius}) : super.circular(radius.value);

  ///Used to give a circular radius.
  ///It's set to `Radius = 4.0`.
  CircularBorderRadius.extraSmall() : super.circular(Sizes.extraSmall.value);

  ///Used to give a circular radius.
  ///It's set to `Radius = 8.0`.
  CircularBorderRadius.small() : super.circular(Sizes.prettySmall.value);

  ///Used to give a circular radius.
  ///It's set to `Radius = 16.0`.
  CircularBorderRadius.normal() : super.circular(Sizes.medium.value);

  ///Used to give a circular radius.
  ///It's set to `Radius = 24.0`.
  CircularBorderRadius.big() : super.circular(Sizes.big.value);

  ///Used to give a circular radius.
  ///It's set to `Radius = 32.0`.
  CircularBorderRadius.huge() : super.circular(Sizes.veryBig.value);

  ///Used to give a circular radius.
  ///It's set to `Radius = 48.0`.
  CircularBorderRadius.moreHuge() : super.circular(Sizes.large.value);

  ///Used to give a circular radius.
  ///It's set to `Radius = 64.0`.
  CircularBorderRadius.extreme() : super.circular(Sizes.extraLarge.value);

  ///Used to give a circular radius.
  ///It's set to `Radius = 96.0`.
  CircularBorderRadius.ultraBig() : super.circular(Sizes.huge.value);

  //Used to give a circular radius only top side.
  CircularBorderRadius.topCircular(Sizes radius)
      : super.only(
          topLeft: Radius.circular(radius.value),
          topRight: Radius.circular(radius.value),
        );

  //Used to give a circular radius only top side.
  ///It's set to `Radius = 8.0`.
  CircularBorderRadius.topCircularSmall()
      : super.only(
          topLeft: Radius.circular(Sizes.prettySmall.value),
          topRight: Radius.circular(Sizes.prettySmall.value),
        );

  // Used to give a circular radius only bottom side.
  ///It's set to `Radius = 8.0`.
  CircularBorderRadius.bottomCircularSmall()
      : super.only(
          bottomLeft: Radius.circular(Sizes.prettySmall.value),
          bottomRight: Radius.circular(Sizes.prettySmall.value),
        );
}
