part of 'register_page.dart';

class _RegisterUserFormView extends StatelessWidget with AuthValidatorMixin {
  const _RegisterUserFormView({
    required this.formKey,
    required this.emailController,
    required this.nameSurnameController,
    required this.passwordController,
    required this.onCitySelected,
    required this.onCountySelected,
    required this.onGenderSelected,
  });

  final GlobalKey<FormState> formKey;
  final TextEditingController nameSurnameController;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final void Function(CityModel city) onCitySelected;
  final void Function(CountyModel? county) onCountySelected;
  final void Function(Gender gender) onGenderSelected;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      autovalidateMode: AutovalidateMode.disabled,
      child: ColumnByDivider(
        mainAxisSize: MainAxisSize.min,
        divider: EmptySpace.bigHeight(),
        children: [
          TitleTextFormField(
            title: LocaleKeys.registerForm_nameSurnameTitle.tr(),
            hintText: LocaleKeys.registerForm_nameSurnameHint.tr(),
            validator: (value) => validateFullName(value),
            controller: nameSurnameController,
            textInputAction: TextInputAction.next,
          ),
          TitleTextFormField(
            title: LocaleKeys.commonForm_emailTitle.tr(),
            hintText: LocaleKeys.commonForm_emailHint.tr(),
            validator: (value) => validateEmail(value),
            textInputAction: TextInputAction.next,
            controller: emailController,
          ),
          TitleTextFormField(
            title: LocaleKeys.commonForm_passwordTitle.tr(),
            hintText: LocaleKeys.commonForm_passwordHint.tr(),
            validator: (value) => validatePassword(value),
            textInputAction: TextInputAction.done,
            controller: passwordController,
            isObscureText: true,
          ),
          GenderDropdownByTitle(onGenderSelected: onGenderSelected),
          _CityAndCountyDropdownRow(onCitySelected: onCitySelected, onCountySelected: onCountySelected),
          EmptySpace.mediumHeight(),
        ],
      ),
    );
  }
}
