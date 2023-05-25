import 'package:flutter/material.dart';

import '../enum/sizes.dart';

class EmptySpace extends SizedBox {
  ///İster dikey, ister yatayda boş alan oluşturmal için kullanılır.
  EmptySpace({Key? key, Sizes? height, Sizes? width, bool isScaledValue = true})
      : this._scaledSize(key: key, height: height, width: width, isScaledValue: isScaledValue);

  ///Dikey ve yatayda boş bir kare alan oluşturmal için kullanılır.
  EmptySpace.square({Key? key, required Sizes size, bool isScaledValue = true})
      : super(
          key: key,
          height: isScaledValue ? size.getRadiusScale() : size.rawValue(),
          width: isScaledValue ? size.getRadiusScale() : size.rawValue(),
        );

  ///Dikey olarak [4.0] boş alan oluşturur.
  EmptySpace.extraSmallHeight({Key? key, bool isScaledValue = true})
      : this._scaledSize(key: key, height: Sizes.extraSmall, isScaledValue: isScaledValue);

  ///Dikey olarak [8.0] boş alan oluşturur.
  EmptySpace.smallHeight({Key? key, bool isScaledValue = true})
      : this._scaledSize(key: key, height: Sizes.prettySmall, isScaledValue: isScaledValue);

  ///Dikey olarak [16.0] boş alan oluşturur.
  EmptySpace.normalHeight({Key? key, bool isScaledValue = true})
      : this._scaledSize(key: key, height: Sizes.medium, isScaledValue: isScaledValue);

  ///Dikey olarak [24.0] boş alan oluşturur.
  EmptySpace.semiBigHeight({Key? key, bool isScaledValue = true})
      : this._scaledSize(key: key, height: Sizes.big, isScaledValue: isScaledValue);

  ///Dikey olarak [32.0] boş alan oluşturur.
  EmptySpace.bigHeight({Key? key, bool isScaledValue = true})
      : this._scaledSize(key: key, height: Sizes.veryBig, isScaledValue: isScaledValue);

  ///Yatay olarak [4.0] boş alan oluşturur.
  EmptySpace.extraSmallWidth({Key? key, bool isScaledValue = true})
      : this._scaledSize(key: key, width: Sizes.extraSmall, isScaledValue: isScaledValue);

  ///Yatay olarak [8.0] boş alan oluşturur.
  EmptySpace.smallWidth({Key? key, bool isScaledValue = true})
      : this._scaledSize(key: key, width: Sizes.prettyBig, isScaledValue: isScaledValue);

  ///Yatay olarak [16.0] boş alan oluşturur.
  EmptySpace.normalWidth({Key? key, bool isScaledValue = true})
      : this._scaledSize(key: key, width: Sizes.medium, isScaledValue: isScaledValue);

  ///Yatay olarak [32.0] boş alan oluşturur.
  EmptySpace.bigWidth({Key? key, bool isScaledValue = true})
      : this._scaledSize(key: key, width: Sizes.veryBig, isScaledValue: isScaledValue);

  EmptySpace._scaledSize({Key? key, Sizes? height, Sizes? width, bool isScaledValue = true})
      : super(
          key: key,
          height: isScaledValue ? height?.getHeightScale() : height?.rawValue(),
          width: isScaledValue ? width?.getWidthScale() : width?.rawValue(),
        );
}
