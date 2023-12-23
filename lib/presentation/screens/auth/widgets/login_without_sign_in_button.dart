part of '../view/login_page.dart';

class _LoginWithoutSignInButton extends StatelessWidget {
  const _LoginWithoutSignInButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseBlocBuilderView<LoginCubit, LoginState>(
      defaultBuilder: (context, state) {
        return BigPrimaryOutlinedButton(
          onPressed: state.isLoading ? () {} : () => context.read<LoginCubit>().guestLogin(),
          text: state.isLoading ? null : LocaleKeys.login_continueWithoutRegister.tr(),
          icon: state.isLoading && state.authLoading == AuthType.guest ? const CircularProgressIndicator() : null,
        );
      },
    );
  }
}
