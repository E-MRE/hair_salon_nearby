part of '../view/login_page.dart';

class _LoginSignInButton extends StatelessWidget {
  const _LoginSignInButton({Key? key, this.onAuthResult}) : super(key: key);

  final void Function(bool isSuccess)? onAuthResult;

  @override
  Widget build(BuildContext context) {
    return BigPrimaryElevatedButton(
      onPressed: () => _login(context),
      text: LocaleKeys.login_signIn.tr(),
      icon: Icon(Icons.arrow_forward_rounded, color: context.colorScheme.onPrimary),
    );
  }

  void _login(BuildContext context) {
    //TODO: add login operations
    //TODO: after login then call this
    kTokenContext.setTokenExpirationDate(DateTime.now().add(const Duration(hours: 1)).toIso8601String());
    kTokenContext.setRefreshTokenExpirationDate(DateTime.now().add(const Duration(hours: 1)).toIso8601String());
    kTokenContext.token = 'ASDasdasdasDQWeqweqdas';
    kTokenContext.refreshToken = 'ASDasdasdasDQWeqweqdas';

    onAuthResult?.call(true);
    context.router.replace(const MenuRoute());
  }
}
