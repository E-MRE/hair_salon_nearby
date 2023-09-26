part of '../view/login_page.dart';

class _LoginSignInButton extends StatelessWidget {
  const _LoginSignInButton({Key? key, required this.checkInputsValid, required this.signIn}) : super(key: key);

  final bool Function() checkInputsValid;
  final Future<void> Function() signIn;

  @override
  Widget build(BuildContext context) {
    return BaseBlocBuilderView<LoginCubit, LoginState>(
      defaultBuilder: (context, state) {
        return BigPrimaryElevatedButton(
          onPressed: () => _login(context, state.status == StateStatus.loading),
          text: LocaleKeys.login_signIn.tr(),
          icon: _buildIconByStatus(context, state.status == StateStatus.loading),
        );
      },
    );
  }

  Widget _buildIconByStatus(BuildContext context, bool isLoading) {
    return isLoading
        ? CircularProgressIndicator(color: context.colorScheme.onPrimary)
        : Icon(Icons.arrow_forward_rounded, color: context.colorScheme.onPrimary);
  }

  Future<void> _login(BuildContext context, bool isLoading) async {
    if (isLoading || !checkInputsValid()) return;

    await signIn();
  }
}
