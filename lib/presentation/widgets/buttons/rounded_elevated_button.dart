import 'package:flutter/material.dart';
import 'package:hair_salon_nearby/utils/enum/hair_salon_type.dart';

import '../../../core/extensions/context_extensions.dart';
import '../../../utils/enum/sizes.dart';
import '../../../utils/mixins/light_color_generator_by_salon_mixin.dart';
import '../texts/app_text.dart';

class RoundedElevatedButton extends StatelessWidget with LightColorGeneratorBySalonMixin {
  const RoundedElevatedButton({
    super.key,
    this.text,
    this.child,
    this.onPressed,
    this.padding,
    this.opacity = .66,
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
    return ElevatedButton.styleFrom(
      padding: padding,
      foregroundColor: context.colorScheme.onPrimary.withOpacity(opacity),
      backgroundColor: getPrimaryColor(context, salonType),
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
