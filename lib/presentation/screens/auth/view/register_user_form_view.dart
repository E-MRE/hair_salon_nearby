part of 'register_page.dart';

class _RegisterUserFormView extends StatelessWidget {
  const _RegisterUserFormView();

  @override
  Widget build(BuildContext context) {
    return Form(
      child: ColumnByDivider(
        mainAxisSize: MainAxisSize.min,
        divider: EmptySpace.bigHeight(),
        children: [
          TitleTextFormField(
            title: LocaleKeys.registerForm_nameSurnameTitle.tr(),
            hintText: LocaleKeys.registerForm_nameSurnameHint.tr(),
          ),
          TitleTextFormField(
            title: LocaleKeys.commonForm_emailTitle.tr(),
            hintText: LocaleKeys.commonForm_emailHint.tr(),
          ),
          TitleTextFormField(
            title: LocaleKeys.commonForm_passwordTitle.tr(),
            hintText: LocaleKeys.commonForm_passwordHint.tr(),
          ),
          const GenderDropdownByTitle(),
          Row(children: [
            const Expanded(child: CityDropdownByTitle()),
            EmptySpace.mediumWidth(),
            const Expanded(child: CountyDropdownByTitle()),
          ]),
          EmptySpace.mediumHeight(),
        ],
      ),
    );
  }
}
