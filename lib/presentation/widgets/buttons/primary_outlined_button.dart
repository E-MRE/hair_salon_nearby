import 'package:flutter/material.dart';
import 'package:hair_salon_nearby/core/extensions/context_extensions.dart';

import '../../../utils/enum/sizes.dart';
import '../../../utils/mixins/light_color_generator_by_salon_mixin.dart';
import '../texts/app_text.dart';

class PrimaryOutlinedButton extends StatelessWidget with LightColorGeneratorBySalonMixin {
  const PrimaryOutlinedButton({
    super.key,
    this.text,
    this.child,
    this.onPressed,
    this.padding,
    this.opacity = 1,
    this.radius = Sizes.small,
    this.height = Sizes.prettyLarge,
  });

  final EdgeInsets? padding;
  final String? text;
  final Widget? child;
  final VoidCallback? onPressed;
  final double opacity;
  final Sizes radius;
  final Sizes height;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPressed,
      style: _buildStyle(context),
      child: child ?? _buildText(context),
    );
  }

  ButtonStyle _buildStyle(BuildContext context) {
    return OutlinedButton.styleFrom(
      padding: padding,
      side: BorderSide(color: (_getBorderColor(context) ?? Colors.transparent).withOpacity(opacity)),
      foregroundColor: _getPrimaryColor(context),
      disabledForegroundColor: context.colorScheme.surfaceVariant,
      fixedSize: Size.fromHeight(height.value),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(radius.value)),
    );
  }

  AppText _buildText(BuildContext context) {
    return AppText.labelLargeSemiBold(text, context: context, color: _getPrimaryColor(context));
  }

  Color? _getBorderColor(BuildContext context) =>
      onPressed == null ? context.colorScheme.surfaceVariant : context.colorScheme.outline;

  Color? _getPrimaryColor(BuildContext context) =>
      onPressed == null ? context.colorScheme.surfaceVariant : context.colorScheme.primary;
}
