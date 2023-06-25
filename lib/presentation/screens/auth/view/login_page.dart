import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../../../core/extensions/context_extensions.dart';
import '../../../../utils/decorations/app_edge_insets.dart';
import '../../../../utils/decorations/empty_space.dart';
import '../../../../utils/enum/auth_type.dart';
import '../../../../utils/enum/sizes.dart';
import '../../../widgets/buttons/primary_elevated_button.dart';
import '../../../widgets/buttons/primary_outlined_button.dart';
import '../../../widgets/images/app_text_logo_image_view.dart';
import '../../../widgets/scaffolds/safe_page_view.dart';
import '../../../widgets/texts/app_text.dart';

@RoutePage()
class LoginPage extends StatefulWidget {
  const LoginPage({super.key, required this.authType});

  final AuthType authType;

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
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
        Row(
          children: [
            Expanded(
              child: PrimaryOutlinedButton(
                onPressed: () {},
                padding: AppEdgeInsets.symmetric(horizontal: Sizes.medium, vertical: Sizes.prettySmall),
                height: Sizes.extraBig,
                child: AppText.labelMediumSemiBold(
                  'Kullanıcı Girişi',
                  context: context,
                  color: context.colorScheme.primary,
                ),
              ),
            ),
            EmptySpace.mediumWidth(),
            Expanded(
              child: PrimaryElevatedButton(
                onPressed: () {},
                padding: AppEdgeInsets.symmetric(horizontal: Sizes.medium, vertical: Sizes.prettySmall),
                height: Sizes.extraBig,
                child: AppText.labelMediumSemiBold(
                  'İşletme Girişi',
                  context: context,
                  color: context.colorScheme.background,
                ),
              ),
            ),
          ],
        )
      ],
    ));
  }
}
