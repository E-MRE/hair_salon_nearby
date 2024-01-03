part of '../view/menu_page.dart';

final class _HorizontalVenueListView extends StatelessWidget {
  const _HorizontalVenueListView({super.key, required this.venues, required this.itemBuilder});

  final List<VenueModel> venues;
  final Widget Function(BuildContext context, VenueModel venue, int index) itemBuilder;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Sizes.extraVeryExtraUltraLarge.value,
      child: ListView.separated(
        itemCount: venues.length,
        scrollDirection: Axis.horizontal,
        separatorBuilder: (context, index) => EmptySpace.mediumWidth(),
        itemBuilder: (context, index) => itemBuilder(context, venues[index], index),
      ),
    );
  }
}
