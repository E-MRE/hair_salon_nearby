import 'package:flutter/material.dart';

import '../../../core/extensions/context_extensions.dart';
import '../../../utils/enum/sizes.dart';
import '../texts/app_text.dart';

class RoundedElevatedButton extends StatelessWidget {
  const RoundedElevatedButton({
    super.key,
    required this.text,
    this.onPressed,
    this.opacity = .66,
    this.radius = Sizes.small,
  });

  final String text;
  final VoidCallback? onPressed;
  final double opacity;
  final Sizes radius;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed: onPressed, style: _buildStyle(context), child: _buildText(context));
  }

  ButtonStyle _buildStyle(BuildContext context) {
    return ElevatedButton.styleFrom(
      foregroundColor: context.colorScheme.onPrimary.withOpacity(opacity),
      backgroundColor: _getPrimaryColor(context),
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

  Color _getPrimaryColor(BuildContext context) =>
      onPressed == null ? context.colorScheme.surfaceVariant : context.colorScheme.primary.withOpacity(opacity);
}
