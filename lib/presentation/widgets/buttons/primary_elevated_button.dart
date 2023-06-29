import 'package:flutter/material.dart';

import '../../../core/extensions/context_extensions.dart';
import '../../../utils/decorations/empty_space.dart';
import '../../../utils/enum/sizes.dart';
import '../../../utils/mixins/light_color_generator_by_salon_mixin.dart';
import '../texts/app_text.dart';

class PrimaryElevatedButton extends StatelessWidget with LightColorGeneratorBySalonMixin {
  const PrimaryElevatedButton({
    super.key,
    this.text,
    this.child,
    this.onPressed,
    this.padding,
    this.opacity = 1,
    this.icon,
    this.radius = Sizes.small,
    this.height = Sizes.prettyLarge,
    this.spaceBetweenTextAndIcon = Sizes.small,
  });

  final EdgeInsets? padding;
  final String? text;
  final Widget? child;
  final Widget? icon;
  final VoidCallback? onPressed;
  final double opacity;
  final Sizes radius;
  final Sizes height;
  final Sizes spaceBetweenTextAndIcon;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: _buildStyle(context),
      child: child ?? (icon == null ? _buildText(context) : _buildTextAndIcon(context)),
    );
  }

  ButtonStyle _buildStyle(BuildContext context) {
    final disableColor = context.colorScheme.surfaceVariant;
    return ElevatedButton.styleFrom(
      padding: padding,
      foregroundColor: onPressed == null ? disableColor : context.colorScheme.onPrimary.withOpacity(opacity),
      backgroundColor: onPressed == null ? disableColor : context.colorScheme.primary.withOpacity(opacity),
      disabledBackgroundColor: disableColor.withOpacity(opacity),
      disabledForegroundColor: context.colorScheme.onPrimary.withOpacity(opacity),
      fixedSize: Size.fromHeight(height.value),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(radius.value)),
    );
  }

  AppText _buildText(BuildContext context) {
    return AppText.labelLargeSemiBold(
      text,
      context: context,
      color: context.colorScheme.onPrimary.withOpacity(opacity),
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
