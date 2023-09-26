part of '../view/login_page.dart';

class _LoginFormArea extends StatelessWidget with LoginValidatorMixin {
  const _LoginFormArea({required this.formKey, required this.emailController, required this.passwordController});

  final GlobalKey<FormState> formKey;
  final TextEditingController emailController;
  final TextEditingController passwordController;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TitleTextFormField(
            validator: validateEmail,
            controller: emailController,
            inputType: TextInputType.emailAddress,
            title: LocaleKeys.commonForm_emailTitle.tr(),
            hintText: LocaleKeys.commonForm_emailHint.tr(),
          ),
          EmptySpace.bigHeight(),
          TitleTextFormField(
            hintText: LocaleKeys.commonForm_passwordHint.tr(),
            title: LocaleKeys.commonForm_passwordTitle.tr(),
            controller: passwordController,
            validator: validatePassword,
            isObscureText: true,
          ),
        ],
      ),
    );
  }
}
