part of 'venue_card.dart';

final class _VenueTop extends StatelessWidget {
  const _VenueTop({
    super.key,
    required this.image,
    required this.stars,
    required this.isSaved,
    this.customTopLeft,
    this.customTopRight,
  });

  final num stars;
  final String image;
  final bool isSaved;

  final Widget? customTopLeft;
  final Widget? customTopRight;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: CircularBorderRadius.normal(),
      child: SizedBox(
        height: Sizes.extraPrettyExtraVeryLarge.value,
        child: Stack(
          fit: StackFit.expand,
          children: [
            _buildVenueImage(),
            Align(alignment: Alignment.topLeft, child: customTopLeft ?? VenueStarsView(stars: stars)),
            Align(alignment: Alignment.topRight, child: customTopRight ?? _VenueLikeButton(isSaved: isSaved)),
            const Align(alignment: Alignment.center, child: PlayVideo())
          ],
        ),
      ),
    );
  }

  CachedNetworkImage _buildVenueImage() {
    return CachedNetworkImage(
      imageUrl: image,
      height: Sizes.extraPrettyExtraVeryLarge.value,
      width: Sizes.extraUltraExtraVeryBig.value,
      filterQuality: FilterQuality.medium,
      fit: BoxFit.fitHeight,
    );
  }
}
