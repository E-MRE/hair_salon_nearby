part of '../index.dart';

class _HairSalonOutlinedButton extends StatelessWidget {
  const _HairSalonOutlinedButton();

  @override
  Widget build(BuildContext context) {
    return OnPrimaryOutlinedButton(
      opacity: .66,
      text: LocaleKeys.onboarding_hairdresserLogin.tr(),
      onPressed: () => context.router.replace(LoginRoute()),
    );
  }
}
