part of '../index.dart';

class _OnboardSkipOutlinedButton extends StatelessWidget {
  const _OnboardSkipOutlinedButton({required this.onPressed});

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return OnPrimaryOutlinedButton(
      opacity: .66,
      text: LocaleKeys.onboarding_skip.tr(),
      onPressed: onPressed,
    );
  }
}
