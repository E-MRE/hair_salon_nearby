import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:hair_salon_nearby/core/extensions/context_extensions.dart';

import '../../../../utils/constants/lang/locale_keys.g.dart';
import '../../../../utils/decorations/app_padding.dart';
import '../../../../utils/decorations/empty_space.dart';
import '../../../../utils/enum/auth_type.dart';
import '../../../../utils/enum/sizes.dart';
import '../../../widgets/buttons/big_primary_elevated_button.dart';
import '../../../widgets/buttons/selectable_container.dart';
import '../../../widgets/columns/column_by_divider.dart';
import '../../../widgets/dropdowns/gender_dropdown.dart';
import '../../../widgets/scaffolds/safe_page_view.dart';
import '../../../widgets/text_fields/title_text_form_field.dart';
import '../../../widgets/texts/app_text.dart';
import '../utils/auth_page.dart';
import '../utils/auth_type_state_operation.dart';

part '../widgets/register_type_selector.dart';
part 'register_user_form_view.dart';

@RoutePage()
class RegisterPage extends AuthStatefulPage {
  const RegisterPage({super.key, required super.authType});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> with AuthTypeStateOperationMixin {
  @override
  Widget build(BuildContext context) {
    return SafePageView(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.max,
        children: [
          EmptySpace(height: Sizes.small),
          AppText.titleLargeSemiBold(LocaleKeys.register_createAccount.tr(), context: context),
          EmptySpace.prettySmallHeight(),
          AppText.bodySmallRegular(LocaleKeys.register_createAccountDescription.tr(), context: context),
          EmptySpace.bigHeight(),
          _RegisterTypeSelector(authType: authType, selectAuthType: selectAuthType),
          Flexible(
            child: AppPadding.verticalBig(
              child: const SingleChildScrollView(child: _RegisterUserFormView()),
            ),
          ),
          BigPrimaryElevatedButton(
            text: LocaleKeys.register_value.tr(),
            icon: const Icon(Icons.arrow_forward_rounded),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
