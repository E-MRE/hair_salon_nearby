part of '../view/menu_page.dart';

final class _LocationAndFilterRow extends StatelessWidget {
  const _LocationAndFilterRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AssetsConstants.instance.getSvgImages.icMapping.svg(
          height: Sizes.small.value,
          width: Sizes.small.value,
          colorFilter: ColorFilter.mode(context.colorScheme.onSurfaceVariant, BlendMode.srcIn),
        ),
        EmptySpace.prettySmallWidth(),
        AppText.titleMediumSemiBold(SpecialKey.dash.value, context: context),
        EmptySpace.extraSmallWidth(),
        Icon(
          Icons.keyboard_arrow_down_sharp,
          color: context.colorScheme.onSurfaceVariant,
          size: Sizes.medium.value,
        ),
        const Spacer(),
        AssetsConstants.instance.getSvgImages.icFilterSettings.svg(
          height: Sizes.big.value,
          width: Sizes.big.value,
          colorFilter: ColorFilter.mode(context.colorScheme.primary, BlendMode.srcIn),
        ),
      ],
    );
  }
}
