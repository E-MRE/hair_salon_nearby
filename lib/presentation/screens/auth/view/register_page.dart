import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hair_salon_nearby/core/extensions/context_extensions.dart';
import 'package:hair_salon_nearby/core/utils/helpers/dependency/core_dependencies.dart';
import 'package:hair_salon_nearby/presentation/screens/auth/cubit/city_cubit.dart';
import 'package:hair_salon_nearby/presentation/screens/auth/cubit/city_state.dart';
import 'package:hair_salon_nearby/presentation/widgets/bloc/base_bloc_data_provider_view.dart';

import '../../../../utils/constants/lang/locale_keys.g.dart';
import '../../../../utils/decorations/app_padding.dart';
import '../../../../utils/decorations/empty_space.dart';
import '../../../../utils/enum/sizes.dart';
import '../../../../utils/enum/text_line_type.dart';
import '../../../../utils/navigation/auto_router/app_router.dart';
import '../../../widgets/buttons/big_primary_elevated_button.dart';
import '../../../widgets/columns/column_by_divider.dart';
import '../../../widgets/dropdowns/city_dropdown_by_title.dart';
import '../../../widgets/dropdowns/county_dropdown_by_title.dart';
import '../../../widgets/dropdowns/gender_dropdown_by_title.dart';
import '../../../widgets/scaffolds/safe_background_page_view.dart';
import '../../../widgets/text_fields/title_text_form_field.dart';
import '../../../widgets/texts/app_text.dart';

part 'register_business_form_view.dart';
part 'register_user_form_view.dart';
part '../widgets/city_and_county_dropdown_row.dart';

@RoutePage()
class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    return SafeBackgroundPageView(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.max,
        children: [
          EmptySpace(height: Sizes.small),
          AppText.titleLargeSemiBold(LocaleKeys.register_createAccount.tr(), context: context),
          EmptySpace.prettySmallHeight(),
          AppText.bodySmallRegular(LocaleKeys.register_createAccountDescription.tr(), context: context),
          EmptySpace.bigHeight(),
          Flexible(
            child: AppPadding.verticalBig(
              child: const SingleChildScrollView(child: _RegisterUserFormView()),
            ),
          ),
          BigPrimaryElevatedButton(
            text: LocaleKeys.register_value.tr(),
            icon: const Icon(Icons.arrow_forward_rounded),
            onPressed: _register,
          ),
        ],
      ),
    );
  }

  void _register() {
    //TODO: add register operations
    context.router.replace(const MenuRoute());
  }
}
