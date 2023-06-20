import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hair_salon_nearby/core/extensions/context_extensions.dart';
import 'package:hair_salon_nearby/presentation/widgets/buttons/rounded_elevated_button.dart';
import 'package:hair_salon_nearby/presentation/widgets/buttons/rounded_outlined_button.dart';
import 'package:hair_salon_nearby/presentation/widgets/images/app_text_logo_image_view.dart';
import 'package:hair_salon_nearby/utils/decorations/app_edge_insets.dart';
import 'package:hair_salon_nearby/utils/decorations/empty_space.dart';
import 'package:hair_salon_nearby/utils/enum/sizes.dart';

import '../../../widgets/scaffolds/safe_page_view.dart';
import '../../../widgets/texts/app_text.dart';

@RoutePage()
class UserLoginPage extends StatefulWidget {
  const UserLoginPage({super.key});

  @override
  State<UserLoginPage> createState() => _UserLoginPageState();
}

class _UserLoginPageState extends State<UserLoginPage> {
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
              child: RoundedOutlinedButton(
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
              child: RoundedElevatedButton(
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
