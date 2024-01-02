import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hair_salon_nearby/core/extensions/context_extensions.dart';
import 'package:hair_salon_nearby/presentation/widgets/containers/rounded_colored_container.dart';
import 'package:hair_salon_nearby/presentation/widgets/texts/app_text.dart';
import 'package:hair_salon_nearby/utils/constants/assets_constants.dart';
import 'package:hair_salon_nearby/utils/decorations/app_padding.dart';
import 'package:hair_salon_nearby/utils/decorations/empty_space.dart';
import 'package:hair_salon_nearby/utils/enum/sizes.dart';

final class VenueStarsView extends StatelessWidget {
  const VenueStarsView({super.key, required this.stars});

  final num stars;

  @override
  Widget build(BuildContext context) {
    return AppPadding.allPrettySmall(
      child: RoundedColoredContainer(
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildImage(context),
            EmptySpace.extraSmallWidth(),
            AppText.labelLargeSemiBold(
              stars.toString(),
              context: context,
              height: Sizes.medium,
              color: context.colorScheme.background,
            ),
          ],
        ),
      ),
    );
  }

  SvgPicture _buildImage(BuildContext context) {
    return AssetsConstants.instance.getSvgImages.icStart.svg(
      height: Sizes.medium.value,
      width: Sizes.medium.value,
      colorFilter: ColorFilter.mode(context.colorScheme.background, BlendMode.srcIn),
    );
  }
}
