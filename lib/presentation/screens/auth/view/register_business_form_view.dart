part of 'register_page.dart';

class _RegisterBusinessFormView extends StatelessWidget {
  const _RegisterBusinessFormView();

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
            title: LocaleKeys.registerForm_businessNameTitle.tr(),
            hintText: LocaleKeys.registerForm_businessNameHint.tr(),
          ),
          TitleTextFormField(
            title: LocaleKeys.commonForm_emailTitle.tr(),
            hintText: LocaleKeys.commonForm_emailHint.tr(),
          ),
          TitleTextFormField(
            title: LocaleKeys.commonForm_passwordTitle.tr(),
            hintText: LocaleKeys.commonForm_passwordHint.tr(),
          ),
          TitleTextFormField(
            minLines: TextLineType.normal.value,
            title: LocaleKeys.registerForm_address.tr(),
            hintText: LocaleKeys.registerForm_addressHint.tr(),
          ),
        ],
      ),
    );
  }
}
