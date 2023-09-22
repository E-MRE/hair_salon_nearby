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
            inputType: TextInputType.emailAddress,
            title: LocaleKeys.commonForm_emailTitle.tr(),
            hintText: LocaleKeys.commonForm_emailHint.tr(),
          ),
          EmptySpace.bigHeight(),
          TitleTextFormField(
            isObscureText: true,
            title: LocaleKeys.commonForm_passwordTitle.tr(),
            hintText: LocaleKeys.commonForm_passwordHint.tr(),
          ),
        ],
      ),
    );
  }
}
