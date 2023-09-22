part of '../view/login_page.dart';

class _NotHaveAccountLine extends StatelessWidget {
  const _NotHaveAccountLine();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AppText.bodySmallMedium(
          LocaleKeys.login_notHaveAccount.tr(),
          context: context,
          color: context.colorScheme.onBackground,
        ),
        TextButton(
          onPressed: () => _navigateRegister(context),
          child: AppText.labelLargeSemiBold(
            LocaleKeys.login_register.tr(),
            context: context,
            color: context.colorScheme.primary,
            decoration: TextDecoration.underline,
          ),
        )
      ],
    );
  }

  void _navigateRegister(BuildContext context) {
    context.router.navigate(const RegisterRoute());
  }
}
