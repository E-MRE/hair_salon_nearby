import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../enum/sizes.dart';

class CustomSvgPicture extends SvgPicture {
  ///``SvgPicture.asset``'ten kalıtım alır. Girilen asset'in rengi `Beyaz` olarak ayarlanır.
  ///
  ///Dilersen `size` girerek boyutunu ayarlayabilirsin.
  ///
  ///`Dikkat`: width ve height eş,t olarak ayarlanacaktır.
  CustomSvgPicture.whiteAssetBySize({Key? key, required String assetName, Sizes? size})
      : super.asset(assetName, key: key, color: Colors.white, height: size?.rawValue(), width: size?.rawValue());

  ///``SvgPicture.network``'ten kalıtım alır. Girilen asset'in rengi `Beyaz` olarak ayarlanır.
  ///
  ///Dilersen `size` girerek boyutunu ayarlayabilirsin.
  ///
  ///`Dikkat`: width ve height eş,t olarak ayarlanacaktır.
  CustomSvgPicture.whiteNetworkBySize({Key? key, required String url, Sizes? size})
      : super.network(url, key: key, color: Colors.white, height: size?.rawValue(), width: size?.rawValue());
}
