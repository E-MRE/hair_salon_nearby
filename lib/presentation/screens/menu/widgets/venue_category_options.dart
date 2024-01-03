part of '../view/menu_page.dart';

final class _VenueCategoryOptions extends StatelessWidget {
  const _VenueCategoryOptions({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Sizes.prettyBig.value,
      child: ListView.separated(
        itemCount: VenueSortOption.values.length,
        scrollDirection: Axis.horizontal,
        separatorBuilder: (context, index) => EmptySpace(width: Sizes.small),
        itemBuilder: (context, index) {
          final item = VenueSortOption.values[index];
          return VenueSortOptionCard(text: item.localize.tr());
        },
      ),
    );
  }
}
