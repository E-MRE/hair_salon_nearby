part of '../view/login_page.dart';

class _LoginFormArea extends StatelessWidget {
  const _LoginFormArea();

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TitleTextFormField(
            title: LocaleKeys.login_emailTitle.tr(),
            hintText: LocaleKeys.login_emailHint.tr(),
          ),
          EmptySpace.bigHeight(),
          TitleTextFormField(
            isObscureText: true,
            title: LocaleKeys.login_passwordTitle.tr(),
            hintText: LocaleKeys.login_passwordHint.tr(),
          ),
        ],
      ),
    );
  }
}
