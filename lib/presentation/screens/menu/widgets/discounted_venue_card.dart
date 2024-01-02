part of '../view/menu_page.dart';

final class _DiscountedVenueCard extends StatelessWidget {
  const _DiscountedVenueCard({super.key, required this.venue});

  final VenueModel venue;

  @override
  Widget build(BuildContext context) {
    return VenueCard(
      name: venue.name ?? SpecialKey.dash.value,
      image: venue.image ?? SpecialKey.empty.value,
      info: venue.info ?? SpecialKey.dash.value,
      motto: venue.motto ?? SpecialKey.dash.value,
      distance: venue.distance ?? AppConstants.kZero.toDouble(),
      stars: venue.star ?? AppConstants.kZero.toDouble(),
      customTopLeft: const VenueDiscountView(discount: AppConstants.kZero),
      isSaved: false,
    );
  }
}
