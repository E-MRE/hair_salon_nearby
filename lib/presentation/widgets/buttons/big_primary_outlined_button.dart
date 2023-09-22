import 'package:flutter/material.dart';
import 'package:hair_salon_nearby/core/extensions/context_extensions.dart';

import '../../../utils/decorations/empty_space.dart';
import '../../../utils/enum/sizes.dart';
import '../texts/app_text.dart';
import 'primary_outlined_button.dart';

class BigPrimaryOutlinedButton extends StatelessWidget {
  const BigPrimaryOutlinedButton({
    super.key,
    this.text,
    this.onPressed,
    this.padding,
    this.opacity = 1,
    this.icon,
    this.radius = Sizes.small,
    this.height = Sizes.extraLarge,
    this.spaceBetweenTextAndIcon = Sizes.small,
  });

  final EdgeInsets? padding;
  final String? text;
  final Widget? icon;
  final VoidCallback? onPressed;
  final double opacity;
  final Sizes radius;
  final Sizes height;
  final Sizes spaceBetweenTextAndIcon;

  @override
  Widget build(BuildContext context) {
    return PrimaryOutlinedButton(
      radius: radius,
      height: height,
      padding: padding,
      opacity: opacity,
      onPressed: onPressed,
      customColor: context.colorScheme.primary,
      spaceBetweenTextAndIcon: spaceBetweenTextAndIcon,
      child: icon == null ? _buildText(context) : _buildTextAndIcon(context),
    );
  }

  Widget _buildText(BuildContext context) {
    return AppText.titleMediumSemiBold(
      text,
      context: context,
      color: context.colorScheme.primary.withOpacity(opacity),
    );
  }

  Widget _buildTextAndIcon(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildText(context),
        EmptySpace(width: spaceBetweenTextAndIcon),
        icon ?? const SizedBox.shrink(),
      ],
    );
  }
}
