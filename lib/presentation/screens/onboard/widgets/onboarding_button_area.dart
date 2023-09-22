part of '../index.dart';

class _OnboardingButtonArea extends StatelessWidget {
  const _OnboardingButtonArea({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseBlocBuilderView<OnboardCubit, OnboardState>(
      initialChildBuilder: (context, state) {
        return AnimatedCrossFade(
          firstCurve: Curves.easeOutQuart,
          secondCurve: Curves.easeInQuart,
          firstChild: _buttonRow(context),
          secondChild: _buildDiscoverButton(),
          crossFadeState: state.isLastPage ? CrossFadeState.showSecond : CrossFadeState.showFirst,
          duration: DurationTypes.halfSeconds.rawValue(),
        );
      },
    );
  }

  Container _buildDiscoverButton() {
    return Container(
      height: Sizes.prettyLarge.value,
      child: const Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [Expanded(child: _OnboardElevatedButton())],
      ),
    );
  }

  Row _buttonRow(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: _OnboardSkipOutlinedButton(onPressed: () => context.read<OnboardCubit>().completeOnboarding()),
        ),
        EmptySpace.mediumWidth(),
        const Expanded(child: _OnboardElevatedButton()),
      ],
    );
  }
}
