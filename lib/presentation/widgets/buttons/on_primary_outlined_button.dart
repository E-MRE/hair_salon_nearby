import 'package:flutter/material.dart';

import '../../../core/extensions/context_extensions.dart';
import '../../../utils/enum/sizes.dart';
import '../texts/app_text.dart';

class OnPrimaryOutlinedButton extends StatelessWidget {
  const OnPrimaryOutlinedButton({
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
    return OutlinedButton(onPressed: onPressed, child: _buildText(context), style: _buildStyle(context));
  }

  AppText _buildText(BuildContext context) {
    return AppText.labelLargeSemiBold(text, context: context, color: _getColor(context));
  }

  Color _getColor(BuildContext context) =>
      onPressed == null ? context.colorScheme.surfaceVariant : context.colorScheme.onPrimary.withOpacity(opacity);

  ButtonStyle _buildStyle(BuildContext context) {
    return OutlinedButton.styleFrom(
      side: BorderSide(color: _getColor(context)),
      foregroundColor: _getColor(context),
      disabledForegroundColor: _getColor(context),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(radius.value)),
    );
  }
}
