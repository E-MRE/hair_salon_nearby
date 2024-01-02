import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:hair_salon_nearby/core/extensions/context_extensions.dart';
import 'package:hair_salon_nearby/core/utils/enums/special_key.dart';
import 'package:hair_salon_nearby/presentation/widgets/containers/rounded_colored_container.dart';
import 'package:hair_salon_nearby/presentation/widgets/texts/app_text.dart';
import 'package:hair_salon_nearby/utils/constants/lang/locale_keys.g.dart';
import 'package:hair_salon_nearby/utils/decorations/app_padding.dart';
import 'package:hair_salon_nearby/utils/decorations/empty_space.dart';
import 'package:hair_salon_nearby/utils/enum/sizes.dart';

class VenueDiscountView extends StatelessWidget {
  const VenueDiscountView({super.key, required this.discount});

  final num discount;

  @override
  Widget build(BuildContext context) {
    return AppPadding.allPrettySmall(
      child: RoundedColoredContainer(
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            AppText.labelLargeSemiBold(
              '${SpecialKey.percent.value}$discount',
              context: context,
              height: Sizes.medium,
              color: context.colorScheme.background,
            ),
            EmptySpace.extraSmallWidth(),
            AppText.labelLargeSemiBold(
              LocaleKeys.discounted.tr(),
              context: context,
              height: Sizes.medium,
              color: context.colorScheme.background,
            ),
          ],
        ),
      ),
    );
  }
}
