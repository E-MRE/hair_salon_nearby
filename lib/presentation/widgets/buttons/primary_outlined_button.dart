import 'package:flutter/material.dart';

import '../../../utils/enum/hair_salon_type.dart';
import '../../../utils/enum/sizes.dart';
import '../../../utils/extensions/build_context_extensions.dart';
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
    this.salonType = HairSalonType.women,
  });

  final EdgeInsets? padding;
  final String? text;
  final Widget? child;
  final VoidCallback? onPressed;
  final HairSalonType salonType;
  final double opacity;
  final Sizes radius;
  final Sizes height;

  @override
  Widget build(BuildContext context) {
    final colorScheme = context.watchThemeService.theme.colorTheme.colorScheme;
    return OutlinedButton(
      onPressed: onPressed,
      style: _buildStyle(context, colorScheme),
      child: child ?? _buildText(context, colorScheme),
    );
  }

  ButtonStyle _buildStyle(BuildContext context, ColorScheme? colorScheme) {
    return OutlinedButton.styleFrom(
      padding: padding,
      side: BorderSide(color: (_getBorderColor(colorScheme) ?? Colors.transparent).withOpacity(opacity)),
      foregroundColor: _getPrimaryColor(colorScheme),
      disabledForegroundColor: colorScheme?.surfaceVariant,
      fixedSize: Size.fromHeight(height.value),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(radius.value)),
    );
  }

  AppText _buildText(BuildContext context, ColorScheme? colorScheme) {
    return AppText.labelLargeSemiBold(text, context: context, color: _getPrimaryColor(colorScheme));
  }

  Color? _getBorderColor(ColorScheme? colorScheme) =>
      onPressed == null ? colorScheme?.surfaceVariant : colorScheme?.outline;

  Color? _getPrimaryColor(ColorScheme? colorScheme) =>
      onPressed == null ? colorScheme?.surfaceVariant : colorScheme?.primary;
}
