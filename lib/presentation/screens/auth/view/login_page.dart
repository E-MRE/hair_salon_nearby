import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../core/extensions/context_extensions.dart';
import '../../../../core/utils/helpers/dependency/core_dependencies.dart';
import '../../../../utils/constants/lang/locale_keys.g.dart';
import '../../../../utils/decorations/empty_space.dart';
import '../../../../utils/mixins/validators/login_validator_mixin.dart';
import '../../../../utils/navigation/auto_router/app_router.dart';
import '../../../widgets/buttons/big_primary_elevated_button.dart';
import '../../../widgets/buttons/big_primary_outlined_button.dart';
import '../../../widgets/images/app_text_logo_image_view.dart';
import '../../../widgets/scaffolds/safe_background_page_view.dart';
import '../../../widgets/text_fields/title_text_form_field.dart';
import '../../../widgets/texts/app_text.dart';

part '../widgets/login_form_area.dart';
part '../widgets/not_have_account_line.dart';
part 'login_title_area.dart';
part '../widgets/login_forget_button.dart';
part '../widgets/login_sign_in_button.dart';
part '../widgets/login_without_sign_in_button.dart';

@RoutePage()
class LoginPage extends StatefulWidget {
  const LoginPage({super.key, this.onAuthResult});

  final void Function(bool isSuccess)? onAuthResult;

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with _LoginStateMixin {
  @override
  Widget build(BuildContext context) {
    return SafeBackgroundPageView(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Align(alignment: Alignment.centerLeft, child: AppTextLogoImageView()),
            _LoginTitleArea(isVisible: context.isKeyBoardOpen),
            EmptySpace.bigHeight(),
            _LoginFormArea(
              formKey: _formKey,
              emailController: _emailController,
              passwordController: _passwordController,
            ),
            EmptySpace.mediumHeight(),
            const _LoginForgetButton(),
            EmptySpace.extraBigHeight(),
            _LoginSignInButton(onAuthResult: widget.onAuthResult),
            EmptySpace.bigHeight(),
            const _LoginWithoutSignInButton(),
            EmptySpace.extraBigHeight(),
            const _NotHaveAccountLine(),
          ],
        ),
      ),
    );
  }
}

mixin _LoginStateMixin on State<LoginPage> {
  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;
  late GlobalKey<FormState> _formKey;

  @override
  void initState() {
    super.initState();
    _formKey = GlobalKey();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
  }
}
