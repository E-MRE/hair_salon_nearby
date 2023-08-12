import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../enum/sizes.dart';

class CustomSvgPicture extends SvgPicture {
  CustomSvgPicture.whiteAssetBySize({Key? key, required String assetName, Sizes? size})
      : super.asset(
          assetName,
          colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcOver),
          key: key,
          height: size?.value,
          width: size?.value,
        );

  CustomSvgPicture.whiteNetworkBySize({Key? key, required String url, Sizes? size})
      : super.network(
          url,
          colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcOver),
          key: key,
          height: size?.value,
          width: size?.value,
        );
}
