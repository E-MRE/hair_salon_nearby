import 'package:flutter/material.dart';
import 'package:hair_salon_nearby/presentation/widgets/texts/app_text.dart';
import 'package:hair_salon_nearby/utils/decorations/empty_space.dart';

class AlertContentByOptions extends StatelessWidget {
  const AlertContentByOptions({
    super.key,
    required this.title,
    required this.description,
    this.leftButtonText,
    this.rightButtonText,
    this.leftPressed,
    this.rightPressed,
    this.leftButtonTextColor,
    this.rightButtonTextColor,
  });

  final String title;
  final String description;
  final String? leftButtonText;
  final String? rightButtonText;

  final VoidCallback? leftPressed;
  final VoidCallback? rightPressed;

  final Color? leftButtonTextColor;
  final Color? rightButtonTextColor;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppText.titleLargeSemiBold(title, context: context, align: TextAlign.left),
        EmptySpace.bigHeight(),
        AppText.labelLargeRegular(description, context: context),
        EmptySpace.bigHeight(),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            if (leftButtonText != null && leftButtonText!.isNotEmpty)
              _buildButton(context, leftButtonText, leftPressed, leftButtonTextColor),
            if (rightButtonText != null && rightButtonText!.isNotEmpty)
              _buildButton(
                context,
                rightButtonText,
                rightPressed,
                rightButtonTextColor ?? Theme.of(context).colorScheme.tertiary,
              ),
          ],
        )
      ],
    );
  }

  Widget _buildButton(BuildContext context, String? text, VoidCallback? onPressed, Color? color) {
    return TextButton(onPressed: onPressed, child: AppText.labelLargeMedium(text, context: context, color: color));
  }
}
