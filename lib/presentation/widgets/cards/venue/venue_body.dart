part of 'venue_card.dart';

final class _VenueBody extends StatelessWidget {
  const _VenueBody({super.key, required this.distance, required this.info, required this.motto, required this.name});

  final num distance;
  final String name;
  final String motto;
  final String info;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        //Venue Motto
        AppText.bodySmallMedium(motto.toUpperCase(), context: context, color: context.colorScheme.outline),
        EmptySpace.extraSmallHeight(),
        //Venue Name
        AppText.titleMediumSemiBold(name, context: context, color: context.colorScheme.secondary),
        EmptySpace.extraSmallHeight(),
        _VenueInfoRow(distance: distance, info: info),
      ],
    );
  }
}
