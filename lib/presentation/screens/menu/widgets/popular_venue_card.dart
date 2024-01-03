part of '../index.dart';

final class _PopularVenueCard extends StatelessWidget {
  const _PopularVenueCard({super.key, required this.venue});

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
      isSaved: false,
    );
  }
}
