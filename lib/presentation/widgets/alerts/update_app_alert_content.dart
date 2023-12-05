import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:hair_salon_nearby/presentation/widgets/alerts/alert_content_by_options.dart';
import 'package:hair_salon_nearby/utils/constants/lang/locale_keys.g.dart';

class UpdateAppAlertContent extends StatelessWidget {
  const UpdateAppAlertContent.minor({
    Key? key,
    required VoidCallback leftButtonPressed,
    required VoidCallback rightButtonPressed,
  }) : this._(
          key: key,
          title: LocaleKeys.updateApp_title,
          description: LocaleKeys.updateApp_updateRequired,
          rightButtonText: LocaleKeys.updateApp_updateNow,
          leftButtonText: LocaleKeys.updateApp_remindLater,
          rightButtonPressed: rightButtonPressed,
          leftButtonPressed: leftButtonPressed,
        );

  const UpdateAppAlertContent.major({Key? key, required VoidCallback rightButtonPressed})
      : this._(
          key: key,
          title: LocaleKeys.updateApp_title,
          description: LocaleKeys.updateApp_updateRequired,
          rightButtonText: LocaleKeys.updateApp_updateNow,
          rightButtonPressed: rightButtonPressed,
          leftButtonPressed: null,
        );

  const UpdateAppAlertContent._({
    Key? key,
    this.leftButtonText,
    this.rightButtonText,
    required this.title,
    required this.description,
    required this.leftButtonPressed,
    required this.rightButtonPressed,
  }) : super(key: key);

  final String title;
  final String description;
  final String? leftButtonText;
  final String? rightButtonText;
  final VoidCallback? leftButtonPressed;
  final VoidCallback? rightButtonPressed;

  @override
  Widget build(BuildContext context) {
    return AlertContentByOptions(
      title: title.tr(),
      description: description.tr(),
      leftButtonText: leftButtonText?.tr(),
      rightButtonText: rightButtonText?.tr(),
      rightPressed: _onPressedByPop(context, rightButtonPressed),
      leftPressed: _onPressedByPop(context, leftButtonPressed),
    );
  }

  VoidCallback? _onPressedByPop(BuildContext context, VoidCallback? onPressed) {
    if (onPressed == null) return null;

    return () => context.router.pop().then((_) => onPressed());
  }
}
