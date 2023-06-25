import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../core/extensions/context_extensions.dart';
import '../../../../utils/constants/lang/locale_keys.g.dart';
import '../../../../utils/decorations/empty_space.dart';
import '../../../../utils/enum/auth_type.dart';
import '../../../widgets/buttons/selectable_container.dart';
import '../../../widgets/images/app_text_logo_image_view.dart';
import '../../../widgets/scaffolds/safe_page_view.dart';
import '../../../widgets/texts/app_text.dart';

part '../widgets/auth_type_selector.dart';

@RoutePage()
class LoginPage extends StatefulWidget {
  const LoginPage({super.key, required this.authType});

  final AuthType authType;

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late final _authType;
  @override
  void initState() {
    super.initState();
    _selectAuthType(widget.authType);
  }

  @override
  Widget build(BuildContext context) {
    return SafePageView(
        body: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const Align(alignment: Alignment.centerLeft, child: AppTextLogoImageView()),
        EmptySpace.bigHeight(),
        AppText.headlineMediumSemiBold(
          'Hoşgeldin,',
          context: context,
          color: context.colorScheme.secondary,
        ),
        AppText.titleLargeRegular(
          'Geri döndüğünü görmek güzel!',
          context: context,
          color: context.colorScheme.secondary,
        ),
        EmptySpace.mediumHeight(),
        _AuthTypeSelector(authType: _authType, selectAuthType: _selectAuthType)
      ],
    ));
  }

  void _selectAuthType(AuthType authType) {
    setState(() {
      _authType = authType;
    });
  }
}
