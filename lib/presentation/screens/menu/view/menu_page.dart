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
import 'package:hair_salon_nearby/utils/constants/app_constants.dart';
import 'package:hair_salon_nearby/utils/constants/lang/locale_keys.g.dart';
import 'package:hair_salon_nearby/utils/enum/menu_page_option.dart';
import 'package:stylish_bottom_bar/model/bar_items.dart';
import 'package:stylish_bottom_bar/stylish_bottom_bar.dart';

import '../../../../core/extensions/context_extensions.dart';
import '../../../../utils/constants/assets_constants.dart';
import '../../../../utils/decorations/app_box_decoration.dart';
import '../../../../utils/decorations/app_edge_insets.dart';
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

@RoutePage()
class MenuPage extends StatefulWidget {
  const MenuPage({super.key});

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  final _mockCategories = ['Cinsiyet', 'Fiyat', 'İndirimli', 'Diğer Fiyat'];
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
        successChildBuilder: (context, state) => _body(context, state),
        listener: (context, state) {
          debugPrint(state.status.name);
        },
      ),
    );
  }

  SingleChildScrollView _body(BuildContext context, MenuState state) {
    return SingleChildScrollView(
      child: Column(
        children: [
          AppText.headlineSmallSemiBold(
            'Kişisel bakım için en iyi kuaförleri bul',
            context: context,
            color: context.colorScheme.primary,
          ),
          EmptySpace.bigHeight(),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AssetsConstants.instance.getSvgImages.icMapping.svg(
                height: Sizes.small.value,
                width: Sizes.small.value,
                color: context.colorScheme.onSurfaceVariant,
              ),
              EmptySpace.prettySmallWidth(),
              AppText.titleMediumSemiBold('Zeytinburnu', context: context),
              EmptySpace.extraSmallWidth(),
              Icon(
                Icons.keyboard_arrow_down_sharp,
                color: context.colorScheme.onSurfaceVariant,
                size: Sizes.medium.value,
              ),
              const Spacer(),
              AssetsConstants.instance.getSvgImages.icFilterSettings.svg(
                height: Sizes.big.value,
                width: Sizes.big.value,
                color: context.colorScheme.primary,
              ),
            ],
          ),
          EmptySpace.mediumHeight(),
          TextField(
            decoration: InputDecoration(
              hintText: 'Kuaför adı yada hizmet türü...',
              prefixIconConstraints: BoxConstraints.loose(Size.fromRadius(Sizes.big.value)),
              prefixIcon: AppPadding.horizontalSmall(
                child: AssetsConstants.instance.getSvgImages.icSearch.svg(
                  height: Sizes.big.value,
                  width: Sizes.big.value,
                  color: context.colorScheme.outline,
                ),
              ),
            ),
          ),
          EmptySpace.mediumHeight(),
          SizedBox(
            height: Sizes.prettyBig.value,
            child: ListView.separated(
              itemCount: _mockCategories.length,
              scrollDirection: Axis.horizontal,
              separatorBuilder: (context, index) => EmptySpace(width: Sizes.small),
              itemBuilder: (context, index) {
                return Container(
                  padding: AppEdgeInsets.symmetric(horizontal: Sizes.prettySmall, vertical: Sizes.extraSmall),
                  decoration: AppBoxDecoration.circularContainer(
                    size: Sizes.prettySmall,
                    borderColor: Colors.transparent,
                    backgroundColor: context.colorScheme.secondary.withOpacity(.3),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      AppText.labelLargeMedium(
                        _mockCategories[index],
                        context: context,
                        color: context.colorScheme.background,
                      ),
                      EmptySpace.extraSmallWidth(),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Icon(
                          Icons.keyboard_arrow_down_sharp,
                          color: context.colorScheme.background,
                          size: Sizes.medium.value,
                        ),
                      )
                    ],
                  ),
                );
              },
            ),
          ),
          EmptySpace.bigHeight(),
          const _PopularVenuesSectionView(),
          EmptySpace.bigHeight(),
          _SectionTitleView(title: LocaleKeys.menuPage_serviceOptions.tr()),
          EmptySpace.mediumHeight(),
          SizedBox(
            height: Sizes.extraExtraPrettyJumbo.value,
            child: ListView.separated(
              itemCount: _mockServices.length,
              scrollDirection: Axis.horizontal,
              separatorBuilder: (context, index) => EmptySpace.bigWidth(),
              itemBuilder: (context, index) {
                return SizedBox(
                  width: Sizes.ultraJumbo.value,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      ClipRRect(
                        borderRadius: CircularBorderRadius(radius: Sizes.ultraJumbo),
                        child: CachedNetworkImage(
                          imageUrl: '',
                          height: Sizes.ultraJumbo.value,
                          width: Sizes.ultraJumbo.value,
                          filterQuality: FilterQuality.medium,
                          fit: BoxFit.fill,
                        ),
                      ),
                      EmptySpace.prettySmallHeight(),
                      AppPadding.horizontalPrettySmall(
                        child: AppText.labelMediumSemiBold(
                          _mockServices[index],
                          context: context,
                          align: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          EmptySpace.bigHeight(),
          const _DiscountedVenuesSectionView(),
          EmptySpace.bigHeight(),
          const AdvertisementCard(),
          EmptySpace.bigHeight(),
        ],
      ),
    );
  }
}
