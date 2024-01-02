part of 'venue_card.dart';

final class _VenueInfoRow extends StatelessWidget {
  const _VenueInfoRow({super.key, required this.distance, required this.info});

  final num distance;
  final String info;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        AppText.bodySmallRegular(info, context: context, color: context.colorScheme.outline),
        EmptySpace.prettySmallWidth(),
        AppText.bodySmallRegular(SpecialKey.centeredDot.value, context: context, color: context.colorScheme.outline),
        EmptySpace.prettySmallWidth(),
        AppText.bodySmallRegular('$distance Km', context: context, color: context.colorScheme.outline),
      ],
    );
  }
}
