import 'package:flutter/material.dart';
import 'package:hair_salon_nearby/core/extensions/context_extensions.dart';
import 'package:hair_salon_nearby/utils/constants/assets_constants.dart';
import 'package:hair_salon_nearby/utils/decorations/app_box_decoration.dart';
import 'package:hair_salon_nearby/utils/decorations/app_edge_insets.dart';
import 'package:hair_salon_nearby/utils/enum/sizes.dart';

final class PlayVideo extends StatelessWidget {
  const PlayVideo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: AppEdgeInsets.all(Sizes.smallerThanMedium),
      decoration: _buildDecoration(context),
      child: AssetsConstants.instance.getSvgImages.icPlayVideo.svg(
        height: Sizes.verySmallerThanBig.value,
        width: Sizes.verySmallerThanBig.value,
        colorFilter: ColorFilter.mode(context.colorScheme.background, BlendMode.srcIn),
      ),
    );
  }

  AppBoxDecoration _buildDecoration(BuildContext context) {
    return AppBoxDecoration.circularContainer(
      borderColor: Colors.transparent,
      backgroundColor: context.colorScheme.secondary.withOpacity(.3),
      size: Sizes.verySmallerThanJumbo,
    );
  }
}
