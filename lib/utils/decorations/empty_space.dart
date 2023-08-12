import 'package:flutter/material.dart';

import '../enum/sizes.dart';

class EmptySpace extends SizedBox {
  ///It is used to create an empty space, whether vertical or horizontal.
  EmptySpace({Key? key, Sizes? height, Sizes? width}) : this._scaledSize(key: key, height: height, width: width);

  ///It is used for creating an empty square space in vertical and horizontal.
  EmptySpace.square({Key? key, required Sizes size}) : super(key: key, height: size.value, width: size.value);

  ///Vertical [4.0] creates an empty space.
  EmptySpace.extraSmallHeight({Key? key}) : this._scaledSize(key: key, height: Sizes.extraSmall);

  ///Vertical [8.0] creates an empty space.
  EmptySpace.prettySmallHeight({Key? key}) : this._scaledSize(key: key, height: Sizes.prettySmall);

  ///Vertical [16.0] forms an empty space.
  EmptySpace.mediumHeight({Key? key}) : this._scaledSize(key: key, height: Sizes.medium);

  ///It creates an free space [24.0] vertically.
  EmptySpace.bigHeight({Key? key}) : this._scaledSize(key: key, height: Sizes.big);

  ///Vertical [32.0] creates an empty space.
  EmptySpace.veryBigHeight({Key? key}) : this._scaledSize(key: key, height: Sizes.veryBig);

  ///Vertical [48.0] creates an empty space.
  EmptySpace.extraBigHeight({Key? key}) : this._scaledSize(key: key, height: Sizes.extraLarge);

  ///Horizontal [4.0] creates an empty space.
  EmptySpace.extraSmallWidth({Key? key}) : this._scaledSize(key: key, width: Sizes.extraSmall);

  ///Horizontal [8.0] creates an empty space.
  EmptySpace.prettySmallWidth({Key? key}) : this._scaledSize(key: key, width: Sizes.prettySmall);

  ///Horizontal [16.0] creates an empty space.
  EmptySpace.mediumWidth({Key? key}) : this._scaledSize(key: key, width: Sizes.medium);

  ///Horizontal [24.0] creates an empty space.
  EmptySpace.bigWidth({Key? key}) : this._scaledSize(key: key, width: Sizes.big);

  ///Horizontal [32.0] creates an empty space.
  EmptySpace.veryBigWidth({Key? key}) : this._scaledSize(key: key, width: Sizes.veryBig);

  EmptySpace._scaledSize({Key? key, Sizes? height, Sizes? width})
      : super(key: key, height: height?.value, width: width?.value);
}
