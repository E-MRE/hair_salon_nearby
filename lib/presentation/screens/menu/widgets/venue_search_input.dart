part of '../index.dart';

final class _VenueSearchInput extends StatelessWidget {
  const _VenueSearchInput({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        hintText: LocaleKeys.menuPage_searchHint.tr(),
        prefixIconConstraints: BoxConstraints.loose(Size.fromRadius(Sizes.big.value)),
        prefixIcon: AppPadding.horizontalSmall(
          child: AssetsConstants.instance.getSvgImages.icSearch.svg(
            height: Sizes.big.value,
            width: Sizes.big.value,
            colorFilter: ColorFilter.mode(context.colorScheme.outline, BlendMode.srcIn),
          ),
        ),
      ),
    );
  }
}
