part of '../index.dart';

class _OnboardElevatedButton extends StatelessWidget {
  const _OnboardElevatedButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseBlocBuilderView<OnboardCubit, OnboardState>(
      initialChildBuilder: (context, state) {
        return PrimaryElevatedButton(
            opacity: .66, text: _getText(state.isLastPage), onPressed: () => _onPressed(context, state.isLastPage));
      },
    );
  }

  String _getText(bool isLastPage) {
    return (isLastPage ? LocaleKeys.onboarding_discoverApp : LocaleKeys.onboarding_next).tr();
  }

  void _onPressed(BuildContext context, bool isLastPage) {
    if (isLastPage) {
      context.read<OnboardCubit>().completeOnboarding();
    } else {
      context.read<OnboardCubit>().showNextPage();
    }
  }
}
