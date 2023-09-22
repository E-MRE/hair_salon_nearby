part of '../index.dart';

class _UserElevatedButton extends StatelessWidget {
  const _UserElevatedButton();

  @override
  Widget build(BuildContext context) {
    return PrimaryElevatedButton(
      opacity: .66,
      text: LocaleKeys.onboarding_userLogin.tr(),
      onPressed: () => context.router.replace(LoginRoute()),
    );
  }
}
