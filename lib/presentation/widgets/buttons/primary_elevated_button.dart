import 'package:flutter/material.dart';

import '../../../core/extensions/context_extensions.dart';
import '../../../utils/enum/hair_salon_type.dart';
import '../../../utils/enum/sizes.dart';
import '../../../utils/mixins/light_color_generator_by_salon_mixin.dart';
import '../../../utils/extensions/build_context_extensions.dart';
import '../texts/app_text.dart';

class PrimaryElevatedButton extends StatelessWidget with LightColorGeneratorBySalonMixin {
  const PrimaryElevatedButton({
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
    return ElevatedButton(onPressed: onPressed, style: _buildStyle(context), child: child ?? _buildText(context));
  }

  ButtonStyle _buildStyle(BuildContext context) {
    final colorScheme = context.watchThemeService.theme.colorTheme.colorScheme;
    final disableColor = colorScheme?.surfaceVariant;
    return ElevatedButton.styleFrom(
      padding: padding,
      foregroundColor: onPressed == null ? disableColor : colorScheme?.onPrimary.withOpacity(opacity),
      backgroundColor: onPressed == null ? disableColor : colorScheme?.primary.withOpacity(opacity),
      disabledBackgroundColor: disableColor?.withOpacity(opacity),
      disabledForegroundColor: colorScheme?.onPrimary.withOpacity(opacity),
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
}
