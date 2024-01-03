import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:hair_salon_nearby/core/utils/enums/special_key.dart';
import 'package:hair_salon_nearby/core/utils/helpers/dependency/core_dependencies.dart';
import 'package:hair_salon_nearby/models/entity/venue_model.dart';
import 'package:hair_salon_nearby/presentation/screens/menu/cubit/menu_cubit.dart';
import 'package:hair_salon_nearby/presentation/screens/menu/cubit/menu_state.dart';
import 'package:hair_salon_nearby/presentation/widgets/bloc/base_bloc_data_provider_view.dart';
import 'package:hair_salon_nearby/presentation/widgets/bloc/base_bloc_data_selector_view.dart';
import 'package:hair_salon_nearby/presentation/widgets/cards/advertisement_card.dart';
import 'package:hair_salon_nearby/presentation/widgets/cards/venue/venue_card.dart';
import 'package:hair_salon_nearby/presentation/widgets/cards/venue/venue_discount_view.dart';
import 'package:hair_salon_nearby/presentation/widgets/cards/venue/venue_sort_option_card.dart';
import 'package:hair_salon_nearby/utils/constants/app_constants.dart';
import 'package:hair_salon_nearby/utils/constants/lang/locale_keys.g.dart';
import 'package:hair_salon_nearby/utils/enum/menu_page_option.dart';
import 'package:hair_salon_nearby/utils/enum/venue_sort_option.dart';
import 'package:stylish_bottom_bar/model/bar_items.dart';
import 'package:stylish_bottom_bar/stylish_bottom_bar.dart';

import '../../../../core/extensions/context_extensions.dart';
import '../../../../utils/constants/assets_constants.dart';
import '../../../../utils/decorations/app_box_decoration.dart';
import '../../../../utils/decorations/app_padding.dart';
import '../../../../utils/decorations/circular_border_radius.dart';
import '../../../../utils/decorations/empty_space.dart';
import '../../../../utils/enum/sizes.dart';
import '../../../widgets/scaffolds/safe_page_view.dart';
import '../../../widgets/texts/app_text.dart';

part '../widgets/popular_venue_card.dart';
part '../widgets/discounted_venue_card.dart';
part '../widgets/section_title_view.dart';
part '../widgets/explore_button.dart';
part '../widgets/menu_bottom_navigation_bar.dart';
part '../widgets/horizontal_venue_list_view.dart';
part '../widgets/section_title_and_list_view.dart';
part '../widgets/popular_venues_section_view.dart';
part '../widgets/discounted_venues_section_view.dart';
part '../widgets/location_and_filter_row.dart';
part '../widgets/venue_search_input.dart';
part '../widgets/venue_category_options.dart';
part '../widgets/venue_service_options.dart';

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
