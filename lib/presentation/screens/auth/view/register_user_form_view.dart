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
          _buildTitleDropdown(context)
        ],
      ),
    );
  }

  Column _buildTitleDropdown(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppText.bodySmallRegular(
          LocaleKeys.gender_value.tr(),
          context: context,
          color: context.colorScheme.onBackground,
        ),
        EmptySpace.extraSmallHeight(),
        const GenderDropdown(),
      ],
    );
  }
}
