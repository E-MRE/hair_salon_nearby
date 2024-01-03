part of '../view/menu_page.dart';

final class _PopularVenuesSectionView extends StatelessWidget {
  const _PopularVenuesSectionView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseBlocDataSelectorView<MenuCubit, MenuState, List<VenueModel>?>(
      selectorCallback: (state) => state.isDataNull ? null : state.data!.items,
      builder: (context, data) {
        if (data == null) {
          return const SizedBox.shrink();
        }

        return _SectionTitleAndListView(
          title: LocaleKeys.menuPage_mostPopularAround.tr(),
          itemBuilder: (_, venue, __) => _PopularVenueCard(venue: venue),
          venues: data,
        );
      },
    );
  }
}
