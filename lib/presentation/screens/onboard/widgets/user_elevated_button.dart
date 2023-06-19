part of '../view/onboard_page.dart';

class _UserElevatedButton extends StatelessWidget {
  const _UserElevatedButton();

  @override
  Widget build(BuildContext context) {
    return RoundedElevatedButton(text: LocaleKeys.onboarding_userLogin.tr());
  }
}
