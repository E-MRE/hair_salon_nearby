part of '../index.dart';

final class _DiscountedVenuesSectionView extends StatelessWidget {
  const _DiscountedVenuesSectionView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseBlocDataSelectorView<MenuCubit, MenuState, List<VenueModel>?>(
      selectorCallback: (state) => state.isDataNull ? null : state.data!.items,
      builder: (context, data) {
        if (data == null) {
          return const SizedBox.shrink();
        }

        return _SectionTitleAndListView(
          title: LocaleKeys.menuPage_bestDiscountOffers.tr(),
          itemBuilder: (_, venue, __) => _DiscountedVenueCard(venue: venue),
          venues: data,
        );
      },
    );
  }
}
