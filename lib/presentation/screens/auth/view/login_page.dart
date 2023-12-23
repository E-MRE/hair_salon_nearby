import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:hair_salon_nearby/core/utils/helpers/dependency/core_dependencies.dart';
import 'package:hair_salon_nearby/utils/enum/auth_type.dart';
import 'package:provider/provider.dart';

import '../../../../core/extensions/context_extensions.dart';
import '../../../../core/utils/display_messages/snack_bar/display_snack_bar.dart';
import '../../../../core/utils/enums/state_status.dart';
import '../../../../utils/constants/lang/locale_keys.g.dart';
import '../../../../utils/decorations/empty_space.dart';
import '../../../../utils/mixins/validators/auth_validator_mixin.dart';
import '../../../../utils/navigation/auto_router/app_router.dart';
import '../../../widgets/bloc/base_bloc_builder_view.dart';
import '../../../widgets/bloc/base_bloc_provider_view.dart';
import '../../../widgets/buttons/big_primary_elevated_button.dart';
import '../../../widgets/buttons/big_primary_outlined_button.dart';
import '../../../widgets/images/app_text_logo_image_view.dart';
import '../../../widgets/scaffolds/safe_background_page_view.dart';
import '../../../widgets/text_fields/title_text_form_field.dart';
import '../../../widgets/texts/app_text.dart';
import '../cubit/login_cubit.dart';
import '../cubit/login_state.dart';

part '../widgets/login_forget_button.dart';
part '../widgets/login_form_area.dart';
part '../widgets/login_sign_in_button.dart';
part '../widgets/login_without_sign_in_button.dart';
part '../widgets/not_have_account_line.dart';
part 'login_title_area.dart';

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
        child: BaseBlocProviderView<LoginCubit, LoginState>(
          create: (_) => CoreDependencies.getDependency<LoginCubit>(),
          listener: _buildListener,
          defaultBuilder: (builderContext, state) => _buildPage(builderContext, state, context.isKeyBoardOpen),
        ),
      ),
    );
  }

  Column _buildPage(BuildContext context, LoginState state, bool isKeyBoardOpen) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const Align(alignment: Alignment.centerLeft, child: AppTextLogoImageView()),
        _LoginTitleArea(isVisible: !isKeyBoardOpen),
        EmptySpace.bigHeight(),
        _LoginFormArea(
          formKey: _formKey,
          emailController: _emailController,
          passwordController: _passwordController,
        ),
        EmptySpace.mediumHeight(),
        const _LoginForgetButton(),
        EmptySpace.extraBigHeight(),
        _LoginSignInButton(
          checkInputsValid: () => _formKey.currentState?.validate() ?? false,
          signIn: () async => await context.read<LoginCubit>().login(_emailController.text, _passwordController.text),
        ),
        EmptySpace.bigHeight(),
        const _LoginWithoutSignInButton(),
        EmptySpace.extraBigHeight(),
        _NotHaveAccountLine(state.isLoading),
      ],
    );
  }

  void _buildListener(BuildContext context, LoginState state) {
    if (state.status == StateStatus.error) {
      DisplaySnackBar(context).errorMessage(state.errorMessage);
    } else if (state.isSuccess) {
      widget.onAuthResult == null ? context.router.replace(const MenuRoute()) : widget.onAuthResult?.call(true);
    }
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
