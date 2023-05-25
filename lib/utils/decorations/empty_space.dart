import 'package:flutter/material.dart';

import '../enum/sizes.dart';

class EmptySpace extends SizedBox {
  ///It is used to create an empty space, whether vertical or horizontal.
  EmptySpace({Key? key, Sizes? height, Sizes? width, bool isScaledValue = false})
      : this._scaledSize(key: key, height: height, width: width, isScaledValue: isScaledValue);

  ///It is used for creating an empty square space in vertical and horizontal.
  EmptySpace.square({Key? key, required Sizes size, bool isScaledValue = false})
      : super(
          key: key,
          height: isScaledValue ? size.getRadiusScale() : size.value,
          width: isScaledValue ? size.getRadiusScale() : size.value,
        );

  ///Vertical [4.0] creates an empty space.
  EmptySpace.extraSmallHeight({Key? key, bool isScaledValue = false})
      : this._scaledSize(key: key, height: Sizes.extraSmall, isScaledValue: isScaledValue);

  ///Vertical [8.0] creates an empty space.
  EmptySpace.smallHeight({Key? key, bool isScaledValue = false})
      : this._scaledSize(key: key, height: Sizes.prettySmall, isScaledValue: isScaledValue);

  ///Vertical [16.0] forms an empty space.
  EmptySpace.normalHeight({Key? key, bool isScaledValue = false})
      : this._scaledSize(key: key, height: Sizes.medium, isScaledValue: isScaledValue);

  ///It creates an free space [24.0] vertically.
  EmptySpace.semiBigHeight({Key? key, bool isScaledValue = false})
      : this._scaledSize(key: key, height: Sizes.big, isScaledValue: isScaledValue);

  ///Vertical [32.0] creates an empty space.
  EmptySpace.bigHeight({Key? key, bool isScaledValue = false})
      : this._scaledSize(key: key, height: Sizes.veryBig, isScaledValue: isScaledValue);

  ///Horizontal [4.0] creates an empty space.
  EmptySpace.extraSmallWidth({Key? key, bool isScaledValue = false})
      : this._scaledSize(key: key, width: Sizes.extraSmall, isScaledValue: isScaledValue);

  ///Horizontal [8.0] creates an empty space.
  EmptySpace.smallWidth({Key? key, bool isScaledValue = false})
      : this._scaledSize(key: key, width: Sizes.prettyBig, isScaledValue: isScaledValue);

  ///Horizontal [16.0] creates an empty space.
  EmptySpace.normalWidth({Key? key, bool isScaledValue = false})
      : this._scaledSize(key: key, width: Sizes.medium, isScaledValue: isScaledValue);

  ///Horizontal [32.0] creates an empty space.
  EmptySpace.bigWidth({Key? key, bool isScaledValue = false})
      : this._scaledSize(key: key, width: Sizes.veryBig, isScaledValue: isScaledValue);

  EmptySpace._scaledSize({Key? key, Sizes? height, Sizes? width, bool isScaledValue = false})
      : super(
          key: key,
          height: isScaledValue ? height?.getHeightScale() : height?.value,
          width: isScaledValue ? width?.getWidthScale() : width?.value,
        );
}
