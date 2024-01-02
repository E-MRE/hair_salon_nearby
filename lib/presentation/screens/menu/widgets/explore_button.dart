part of '../view/menu_page.dart';

final class _ExploreButton extends StatelessWidget {
  const _ExploreButton({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: context.colorScheme.primary,
      onPressed: () {},
      child: AssetsConstants.instance.getSvgImages.icExplore.svg(
        colorFilter: ColorFilter.mode(context.colorScheme.onPrimary, BlendMode.srcIn),
        height: Sizes.veryBig.value,
        width: Sizes.veryBig.value,
      ),
    );
  }
}
