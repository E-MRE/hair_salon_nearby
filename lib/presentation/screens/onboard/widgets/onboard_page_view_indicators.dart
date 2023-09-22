// ignore_for_file: unused_element

part of '../index.dart';

class _OnboardPageViewIndicators extends StatelessWidget {
  const _OnboardPageViewIndicators({
    super.key,
    this.heightFactor = 94,
    this.alignment = Alignment.bottomCenter,
    required this.controller,
  });

  final LiquidController controller;
  final double heightFactor;
  final Alignment alignment;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OnboardCubit, OnboardState>(
      builder: (context, state) {
        return Align(
          heightFactor: heightFactor,
          alignment: alignment,
          child: AnimatedSmoothIndicator(
            activeIndex: state.pageIndex,
            count: state.pages.length,
            effect: _buildEffect(context),
            onDotClicked: (index) {
              context.read<OnboardCubit>().changeIndex(index);
              controller.jumpToPage(page: index);
            },
          ),
        );
      },
    );
  }

  WormEffect _buildEffect(BuildContext context) {
    return WormEffect(
      dotHeight: Sizes.prettySmall.value,
      dotWidth: Sizes.prettySmall.value,
      radius: Sizes.prettySmall.value,
      type: WormType.thin,
      activeDotColor: context.colorScheme.onPrimary,
      dotColor: context.colorScheme.onPrimary.withOpacity(.2),
    );
  }
}
