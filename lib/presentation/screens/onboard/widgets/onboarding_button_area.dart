part of '../index.dart';

class _OnboardingButtonArea extends StatelessWidget {
  const _OnboardingButtonArea({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseBlocBuilderView<OnboardCubit, OnboardState>(
      initialChildBuilder: (context, state) {
        if (state.isLastPage) {
          return const _OnboardElevatedButton();
        }

        return _buttonRow(context);
      },
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
