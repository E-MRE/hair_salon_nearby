part of '../view/login_page.dart';

class _LoginForgetButton extends StatelessWidget {
  const _LoginForgetButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: TextButton(
        style: const ButtonStyle(padding: MaterialStatePropertyAll(EdgeInsets.zero)),
        onPressed: () {},
        child: AppText.bodySmallRegular(
          LocaleKeys.login_forgotPassword.tr(),
          context: context,
          color: context.colorScheme.primary,
        ),
      ),
    );
  }
}
