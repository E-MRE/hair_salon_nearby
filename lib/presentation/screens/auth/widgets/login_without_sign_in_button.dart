part of '../view/login_page.dart';

class _LoginWithoutSignInButton extends StatelessWidget {
  const _LoginWithoutSignInButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BigPrimaryOutlinedButton(
      onPressed: () {},
      text: LocaleKeys.login_continueWithoutRegister.tr(),
      icon: Icon(Icons.arrow_forward_rounded, color: context.colorScheme.onPrimary),
    );
  }
}
