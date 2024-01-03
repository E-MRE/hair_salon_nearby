part of '../index.dart';

@RoutePage()
class MenuPage extends StatefulWidget {
  const MenuPage({super.key});

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  final _mockServices = ['Erkek\nSaç Kesim', 'Erkek\nSakal Kesim', 'Erkek\nCilt Bakım'];

  int _selectedIndex = 0;

  void _setSelectedPage(int value) {
    setState(() {
      _selectedIndex = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafePageView(
      floatingActionButton: const _ExploreButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: _MenuBottomNavigationBar(currentIndex: _selectedIndex, onTap: _setSelectedPage),
      body: BaseBlocDataProviderView<MenuCubit, MenuState>(
        create: (_) => CoreDependencies.getDependency<MenuCubit>()..getVenues(),
        successChildBuilder: (context, state) => _buildBody(),
      ),
    );
  }

  SingleChildScrollView _buildBody() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _buildTitle(),
          EmptySpace.bigHeight(),
          const _LocationAndFilterRow(),
          EmptySpace.mediumHeight(),
          const _VenueSearchInput(),
          EmptySpace.mediumHeight(),
          const _VenueCategoryOptions(),
          EmptySpace.bigHeight(),
          const _PopularVenuesSectionView(),
          EmptySpace.bigHeight(),
          _SectionTitleView(title: LocaleKeys.menuPage_serviceOptions.tr()),
          EmptySpace.mediumHeight(),
          _VenueServiceOptions(services: _mockServices),
          EmptySpace.bigHeight(),
          const _DiscountedVenuesSectionView(),
          EmptySpace.bigHeight(),
          const AdvertisementCard(),
          EmptySpace.bigHeight(),
        ],
      ),
    );
  }

  AppText _buildTitle() {
    return AppText.headlineSmallSemiBold(
      LocaleKeys.menuPage_title.tr(),
      context: context,
      color: context.colorScheme.primary,
    );
  }
}
