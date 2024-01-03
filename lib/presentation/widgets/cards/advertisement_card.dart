import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:hair_salon_nearby/core/extensions/context_extensions.dart';
import 'package:hair_salon_nearby/presentation/widgets/texts/app_text.dart';
import 'package:hair_salon_nearby/utils/constants/assets_constants.dart';
import 'package:hair_salon_nearby/utils/constants/lang/locale_keys.g.dart';
import 'package:hair_salon_nearby/utils/decorations/app_padding.dart';
import 'package:hair_salon_nearby/utils/decorations/circular_border_radius.dart';
import 'package:hair_salon_nearby/utils/decorations/empty_space.dart';
import 'package:hair_salon_nearby/utils/enum/sizes.dart';

final class AdvertisementCard extends StatelessWidget {
  const AdvertisementCard({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Sizes.extraExtraUltraBig.value,
      child: ClipRRect(
        borderRadius: CircularBorderRadius(radius: Sizes.smaller),
        child: Stack(
          fit: StackFit.expand,
          children: [
            AssetsConstants.instance.getPngImages.icAdvertisementArea.image(fit: BoxFit.fill),
            AppPadding.allMedium(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  _buildTitle(context),
                  EmptySpace.extraSmallHeight(),
                  _buildDescription(context),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  AppText _buildTitle(BuildContext context) {
    return AppText.titleLargeSemiBold(
      LocaleKeys.advertisementArea_title.tr(),
      color: context.colorScheme.background,
      context: context,
    );
  }

  AppText _buildDescription(BuildContext context) {
    return AppText.labelLargeRegular(
      LocaleKeys.advertisementArea_description.tr(),
      color: context.colorScheme.background,
      context: context,
    );
  }
}
