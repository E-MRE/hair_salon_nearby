part of '../view/menu_page.dart';

final class _SectionTitleView extends StatelessWidget {
  const _SectionTitleView({super.key, this.onTap, required this.title});

  final VoidCallback? onTap;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        AppText.titleLargeSemiBold(title, context: context),
        const Spacer(),
        InkWell(onTap: () => onTap?.call(), child: _buildRight(context))
      ],
    );
  }

  Row _buildRight(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        AppText.labelLargeSemiBold(LocaleKeys.all.tr(), context: context, color: context.colorScheme.primary),
        EmptySpace.extraSmallWidth(),
        _buildIcon(context)
      ],
    );
  }

  Icon _buildIcon(BuildContext context) {
    return Icon(
      Icons.arrow_forward_rounded,
      color: context.colorScheme.primary,
      size: Sizes.verySmallerThanBig.value,
    );
  }
}
