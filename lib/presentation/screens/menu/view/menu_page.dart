import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';
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

@RoutePage()
class MenuPage extends StatefulWidget {
  const MenuPage({super.key});

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  final _mockCategories = ['Cinsiyet', 'Fiyat', 'İndirimli', 'Diğer Fiyat'];
  final _mockServices = ['Erkek\nSaç Kesim', 'Erkek\nSakal Kesim', 'Erkek\nCilt Bakım'];
  final _mockServicePhotos = [
    'https://i.ibb.co/6gvcjM2/Avatar.png',
    'https://i.ibb.co/9VCswLK/Avatar.png',
    'https://i.ibb.co/ChyX7Bg/Avatar.png',
  ];

  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SafePageView(
      floatingActionButton: FloatingActionButton(
        backgroundColor: context.colorScheme.primary,
        onPressed: () {},
        child: AssetsConstants.instance.getSvgImages.icExplore.svg(
          color: context.colorScheme.onPrimary,
          height: Sizes.veryBig.value,
          width: Sizes.veryBig.value,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: Color.fromRGBO(108, 108, 108, 0.1),
              blurRadius: 8,
              offset: Offset(0, -1),
            ),
          ],
        ),
        child: StylishBottomBar(
          hasNotch: true,
          backgroundColor: context.colorScheme.background,
          elevation: 0,
          currentIndex: _selectedIndex,
          onTap: (value) {
            setState(() {
              _selectedIndex = value;
            });
          },
          option: AnimatedBarOptions(iconStyle: IconStyle.animated, barAnimation: BarAnimation.blink),
          items: [
            BottomBarItem(
              icon: AssetsConstants.instance.getSvgImages.icHome.svg(
                color: _selectedIndex == 0 ? context.colorScheme.primary : context.colorScheme.outline,
              ),
              title: AppText.labelMediumSemiBold('Home', context: context, color: context.colorScheme.primary),
            ),
            BottomBarItem(
              icon: AssetsConstants.instance.getSvgImages.icProfile.svg(
                color: _selectedIndex == 1 ? context.colorScheme.primary : context.colorScheme.outline,
              ),
              title: AppText.labelMediumSemiBold('Profile', context: context, color: context.colorScheme.primary),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
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
            Row(
              children: [
                AppText.titleLargeSemiBold('Çevrende En Popüler 🔥', context: context),
                const Spacer(),
                InkWell(
                  onTap: () {},
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      AppText.labelLargeSemiBold('Tümü', context: context, color: context.colorScheme.primary),
                      EmptySpace.extraSmallWidth(),
                      Icon(
                        Icons.arrow_forward_rounded,
                        color: context.colorScheme.primary,
                        size: Sizes.verySmallerThanBig.value,
                      )
                    ],
                  ),
                )
              ],
            ),
            EmptySpace.mediumHeight(),
            SizedBox(
              height: Sizes.extraVeryExtraUltraLarge.value,
              child: ListView.separated(
                itemCount: 4,
                scrollDirection: Axis.horizontal,
                separatorBuilder: (context, index) => EmptySpace.mediumWidth(),
                itemBuilder: (context, index) {
                  return SizedBox(
                    width: Sizes.extraUltraExtraVeryBig.value,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        ClipRRect(
                          borderRadius: CircularBorderRadius.normal(),
                          child: SizedBox(
                            height: Sizes.extraPrettyExtraVeryLarge.value,
                            child: Stack(
                              fit: StackFit.expand,
                              children: [
                                CachedNetworkImage(
                                  imageUrl: 'https://i.ibb.co/QFYrBjr/video.png',
                                  height: Sizes.extraPrettyExtraVeryLarge.value,
                                  width: Sizes.extraUltraExtraVeryBig.value,
                                  filterQuality: FilterQuality.medium,
                                  fit: BoxFit.fitHeight,
                                ),
                                Align(
                                  alignment: Alignment.topLeft,
                                  child: AppPadding.allPrettySmall(
                                    child: Container(
                                      height: Sizes.prettyBig.value,
                                      padding: AppEdgeInsets.symmetric(
                                          horizontal: Sizes.prettySmall, vertical: Sizes.verySmall),
                                      decoration: AppBoxDecoration.circularContainer(
                                        borderColor: Colors.transparent,
                                        backgroundColor: context.colorScheme.secondary.withOpacity(.3),
                                        size: Sizes.smaller,
                                      ),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          AssetsConstants.instance.getSvgImages.icStart.svg(
                                            height: Sizes.medium.value,
                                            width: Sizes.medium.value,
                                            color: context.colorScheme.background,
                                          ),
                                          EmptySpace.extraSmallWidth(),
                                          AppText.labelLargeSemiBold(
                                            '4.5',
                                            context: context,
                                            color: context.colorScheme.background,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.topRight,
                                  child: AppPadding.allPrettySmall(
                                    child: LikeButton(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      likeBuilder: (isLiked) {
                                        return Container(
                                          padding: AppEdgeInsets.all(Sizes.extraSmall),
                                          decoration: AppBoxDecoration.circularContainer(
                                            borderColor: Colors.transparent,
                                            backgroundColor: isLiked
                                                ? context.colorScheme.secondary
                                                : context.colorScheme.background,
                                            size: Sizes.verySmallerThanJumbo,
                                          ),
                                          child: AssetsConstants.instance.getSvgImages.icBookmark.svg(
                                            height: Sizes.smallerThanBig.value,
                                            width: Sizes.smallerThanBig.value,
                                            color: isLiked
                                                ? context.colorScheme.background
                                                : context.colorScheme.secondary,
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.center,
                                  child: Container(
                                    padding: AppEdgeInsets.all(Sizes.smallerThanMedium),
                                    decoration: AppBoxDecoration.circularContainer(
                                      borderColor: Colors.transparent,
                                      backgroundColor: context.colorScheme.secondary.withOpacity(.3),
                                      size: Sizes.verySmallerThanJumbo,
                                    ),
                                    child: AssetsConstants.instance.getSvgImages.icPlayVideo.svg(
                                      height: Sizes.verySmallerThanBig.value,
                                      width: Sizes.verySmallerThanBig.value,
                                      color: context.colorScheme.background,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        EmptySpace.prettySmallHeight(),
                        AppText.bodySmallMedium(
                          'ERKEK & KADIN',
                          context: context,
                          color: context.colorScheme.outline,
                        ),
                        EmptySpace.extraSmallHeight(),
                        AppText.titleMediumSemiBold(
                          'Enes İleri Kuaför Salonu',
                          context: context,
                          color: context.colorScheme.secondary,
                        ),
                        EmptySpace.extraSmallHeight(),
                        Row(
                          children: [
                            AppText.bodySmallRegular(
                              'Saç Sakal Cilt Bakım',
                              context: context,
                              color: context.colorScheme.outline,
                            ),
                            EmptySpace.prettySmallWidth(),
                            AppText.bodySmallRegular(
                              '·',
                              context: context,
                              color: context.colorScheme.outline,
                            ),
                            EmptySpace.prettySmallWidth(),
                            AppText.bodySmallRegular(
                              '2.5 Km',
                              context: context,
                              color: context.colorScheme.outline,
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            EmptySpace.bigHeight(),
            Row(
              children: [
                AppText.titleLargeSemiBold('Hizmet Seçenekleri', context: context),
                const Spacer(),
                InkWell(
                  onTap: () {},
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      AppText.labelLargeSemiBold('Tümü', context: context, color: context.colorScheme.primary),
                      EmptySpace.extraSmallWidth(),
                      Icon(
                        Icons.arrow_forward_rounded,
                        color: context.colorScheme.primary,
                        size: Sizes.verySmallerThanBig.value,
                      )
                    ],
                  ),
                )
              ],
            ),
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
                            imageUrl: _mockServicePhotos[index],
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
            Row(
              children: [
                AppText.titleLargeSemiBold('En İyi İndirimli Teklifler', context: context),
                const Spacer(),
                InkWell(
                  onTap: () {},
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      AppText.labelLargeSemiBold('Tümü', context: context, color: context.colorScheme.primary),
                      EmptySpace.extraSmallWidth(),
                      Icon(
                        Icons.arrow_forward_rounded,
                        color: context.colorScheme.primary,
                        size: Sizes.verySmallerThanBig.value,
                      )
                    ],
                  ),
                )
              ],
            ),
            EmptySpace.mediumHeight(),
            SizedBox(
              height: Sizes.extraVeryExtraUltraLarge.value,
              child: ListView.separated(
                itemCount: 4,
                scrollDirection: Axis.horizontal,
                separatorBuilder: (context, index) => EmptySpace.mediumWidth(),
                itemBuilder: (context, index) {
                  return SizedBox(
                    width: Sizes.extraUltraExtraVeryBig.value,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        ClipRRect(
                          borderRadius: CircularBorderRadius.normal(),
                          child: SizedBox(
                            height: Sizes.extraPrettyExtraVeryLarge.value,
                            child: Stack(
                              fit: StackFit.expand,
                              children: [
                                CachedNetworkImage(
                                  imageUrl: 'https://i.ibb.co/QFYrBjr/video.png',
                                  height: Sizes.extraPrettyExtraVeryLarge.value,
                                  width: Sizes.extraUltraExtraVeryBig.value,
                                  filterQuality: FilterQuality.medium,
                                  fit: BoxFit.fitHeight,
                                ),
                                Align(
                                  alignment: Alignment.topLeft,
                                  child: AppPadding.allPrettySmall(
                                    child: Container(
                                      padding: AppEdgeInsets.symmetric(
                                          horizontal: Sizes.prettySmall, vertical: Sizes.verySmall),
                                      decoration: AppBoxDecoration.circularContainer(
                                        borderColor: Colors.transparent,
                                        backgroundColor: context.colorScheme.secondary.withOpacity(.3),
                                        size: Sizes.smaller,
                                      ),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          AppText.labelLargeSemiBold(
                                            '%',
                                            context: context,
                                            color: context.colorScheme.background,
                                          ),
                                          EmptySpace.extraSmallWidth(),
                                          AppText.labelLargeSemiBold(
                                            'İndirimli',
                                            context: context,
                                            color: context.colorScheme.background,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.center,
                                  child: Container(
                                    padding: AppEdgeInsets.all(Sizes.smallerThanMedium),
                                    decoration: AppBoxDecoration.circularContainer(
                                      borderColor: Colors.transparent,
                                      backgroundColor: context.colorScheme.secondary.withOpacity(.3),
                                      size: Sizes.verySmallerThanJumbo,
                                    ),
                                    child: AssetsConstants.instance.getSvgImages.icPlayVideo.svg(
                                      height: Sizes.verySmallerThanBig.value,
                                      width: Sizes.verySmallerThanBig.value,
                                      color: context.colorScheme.background,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        EmptySpace.prettySmallHeight(),
                        AppText.bodySmallMedium(
                          'ERKEK & KADIN',
                          context: context,
                          color: context.colorScheme.outline,
                        ),
                        EmptySpace.extraSmallHeight(),
                        AppText.titleMediumSemiBold(
                          'Fatih Mandıralı Masaj Salonu',
                          context: context,
                          color: context.colorScheme.secondary,
                        ),
                        EmptySpace.extraSmallHeight(),
                        Row(
                          children: [
                            AppText.bodySmallRegular(
                              'Spa, Masaj, Cilt Bakımı',
                              context: context,
                              color: context.colorScheme.outline,
                            ),
                            EmptySpace.prettySmallWidth(),
                            AppText.bodySmallRegular(
                              '·',
                              context: context,
                              color: context.colorScheme.outline,
                            ),
                            EmptySpace.prettySmallWidth(),
                            AppText.bodySmallRegular(
                              '2.5 Km',
                              context: context,
                              color: context.colorScheme.outline,
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            EmptySpace.bigHeight(),
            SizedBox(
              height: Sizes.extraExtraUltraBig.value,
              child: ClipRRect(
                borderRadius: CircularBorderRadius(radius: Sizes.smaller),
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    AssetsConstants.instance.getPngImages.icAdvertisementArea.image(fit: BoxFit.fill),
                    AppPadding.allMedium(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          AppText.titleLargeSemiBold(
                            'Reklam Alanı',
                            context: context,
                            color: context.colorScheme.background,
                          ),
                          EmptySpace.extraSmallHeight(),
                          AppText.labelLargeRegular(
                            'İşletmenin reklamını yapmak ister misin?\nKuaför Yanımda ile işletmenin reklamını yap ve yeni kitlelere ulaş!',
                            context: context,
                            color: context.colorScheme.background,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            EmptySpace.bigHeight(),
          ],
        ),
      ),
    );
  }
}
