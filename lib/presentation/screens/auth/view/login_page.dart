import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../core/extensions/context_extensions.dart';
import '../../../../core/utils/helpers/dependency/core_dependencies.dart';
import '../../../../utils/constants/lang/locale_keys.g.dart';
import '../../../../utils/decorations/empty_space.dart';
import '../../../../utils/navigation/auto_router/app_router.dart';
import '../../../widgets/buttons/big_primary_elevated_button.dart';
import '../../../widgets/buttons/big_primary_outlined_button.dart';
import '../../../widgets/images/app_text_logo_image_view.dart';
import '../../../widgets/scaffolds/safe_background_page_view.dart';
import '../../../widgets/text_fields/title_text_form_field.dart';
import '../../../widgets/texts/app_text.dart';

part '../widgets/login_form_area.dart';
part '../widgets/not_have_account_line.dart';

@RoutePage()
class LoginPage extends StatefulWidget {
  const LoginPage({super.key, this.onAuthResult});

  final void Function(bool isSuccess)? onAuthResult;

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return SafeBackgroundPageView(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Align(alignment: Alignment.centerLeft, child: AppTextLogoImageView()),
            _buildTitleAndSubTitle(context),
            EmptySpace.bigHeight(),
            const _LoginFormArea(),
            EmptySpace.mediumHeight(),
            _buildForgetPassword(context),
            EmptySpace.extraBigHeight(),
            _buildSignInButton(context),
            EmptySpace.bigHeight(),
            _buildWithoutSignInButton(context),
            EmptySpace.extraBigHeight(),
            const _NotHaveAccountLine(),
          ],
        ),
      ),
    );
  }

  Widget _buildTitleAndSubTitle(BuildContext context) {
    if (context.isKeyBoardOpen) return const SizedBox.shrink();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.min,
      children: [
        EmptySpace.bigHeight(),
        _buildTitle(context),
        _buildSubTitle(context),
        EmptySpace.bigHeight(),
      ],
    );
  }

  AppText _buildTitle(BuildContext context) {
    return AppText.headlineMediumSemiBold(
      LocaleKeys.login_welcome.tr(),
      context: context,
      color: context.colorScheme.secondary,
    );
  }

  AppText _buildSubTitle(BuildContext context) {
    return AppText.titleLargeRegular(
      LocaleKeys.login_niceToSeeYou.tr(),
      context: context,
      color: context.colorScheme.secondary,
    );
  }

  Align _buildForgetPassword(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: TextButton(
        style: const ButtonStyle(padding: MaterialStatePropertyAll(EdgeInsets.zero)),
        onPressed: () {},
        child: AppText.bodySmallRegular(
          LocaleKeys.login_forgotPassword.tr(),
          context: context,
          color: context.colorScheme.primary,
        ),
      ),
    );
  }

  BigPrimaryElevatedButton _buildSignInButton(BuildContext context) {
    return BigPrimaryElevatedButton(
      onPressed: _login,
      text: LocaleKeys.login_signIn.tr(),
      icon: Icon(Icons.arrow_forward_rounded, color: context.colorScheme.onPrimary),
    );
  }

  Widget _buildWithoutSignInButton(BuildContext context) {
    return BigPrimaryOutlinedButton(
      onPressed: _login,
      text: LocaleKeys.login_continueWithoutRegister.tr(),
      icon: Icon(Icons.arrow_forward_rounded, color: context.colorScheme.onPrimary),
    );
  }

  void _login() {
    //TODO: add login operations
    //TODO: after login then call this
    kTokenContext.setTokenExpirationDate(DateTime.now().add(const Duration(hours: 1)).toIso8601String());
    kTokenContext.setRefreshTokenExpirationDate(DateTime.now().add(const Duration(hours: 1)).toIso8601String());
    kTokenContext.token = 'ASDasdasdasDQWeqweqdas';
    kTokenContext.refreshToken = 'ASDasdasdasDQWeqweqdas';

    widget.onAuthResult?.call(true);
    context.router.replace(const MenuRoute());
  }
}
