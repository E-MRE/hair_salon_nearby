part of '../index.dart';

final class _SectionTitleAndListView extends StatelessWidget {
  const _SectionTitleAndListView({
    super.key,
    required this.title,
    required this.venues,
    required this.itemBuilder,
    this.onTap,
  });

  final String title;
  final VoidCallback? onTap;
  final List<VenueModel> venues;
  final Widget Function(BuildContext context, VenueModel venue, int index) itemBuilder;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        _SectionTitleView(title: title, onTap: onTap),
        EmptySpace.mediumHeight(),
        _HorizontalVenueListView(venues: venues, itemBuilder: itemBuilder),
      ],
    );
  }
}
