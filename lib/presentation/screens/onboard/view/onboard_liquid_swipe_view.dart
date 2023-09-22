part of '../index.dart';

class _OnboardLiquidSwipeView extends StatelessWidget {
  // ignore: unused_element
  const _OnboardLiquidSwipeView({required this.controller, this.fullTransitionValue = 600});

  final LiquidController controller;
  final double fullTransitionValue;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OnboardCubit, OnboardState>(
      builder: (context, state) {
        return LiquidSwipe(
          liquidController: controller,
          onPageChangeCallback: (activePageIndex) => context.read<OnboardCubit>().changeIndex(activePageIndex),
          fullTransitionValue: fullTransitionValue,
          pages: state.pages.map((option) => _PageView(option: option)).toList(),
        );
      },
    );
  }
}
