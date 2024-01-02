part of '../view/menu_page.dart';

final class _MenuBottomNavigationBar extends StatelessWidget {
  const _MenuBottomNavigationBar({super.key, required this.currentIndex, this.onTap});

  final int currentIndex;
  final void Function(int value)? onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: AppBoxDecoration.menuBottomNavigation(),
      child: StylishBottomBar(
        option: AnimatedBarOptions(iconStyle: IconStyle.animated, barAnimation: BarAnimation.blink),
        backgroundColor: context.colorScheme.background,
        items: _buildItems(context),
        currentIndex: currentIndex,
        hasNotch: true,
        elevation: 0,
        onTap: onTap,
      ),
    );
  }

  List<BottomBarItem> _buildItems(BuildContext context) {
    return MenuSubPage.values.map((element) {
      return BottomBarItem(
        icon: element.toSvg(colorFilter: _getColorFilter(context, element.value)),
        title: AppText.labelMediumSemiBold(element.localize.tr(), context: context, color: context.colorScheme.primary),
      );
    }).toList();
  }

  ColorFilter _getColorFilter(BuildContext context, int selectedIndex) {
    return ColorFilter.mode(
      currentIndex == selectedIndex ? context.colorScheme.primary : context.colorScheme.outline,
      BlendMode.srcIn,
    );
  }
}
