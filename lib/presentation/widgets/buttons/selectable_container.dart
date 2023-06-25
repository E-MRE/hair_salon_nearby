import 'package:flutter/material.dart';

import '../../../core/extensions/context_extensions.dart';
import '../../../utils/decorations/app_box_decoration.dart';
import '../../../utils/enum/sizes.dart';
import '../texts/app_text.dart';

class SelectableContainer extends StatelessWidget {
  const SelectableContainer({super.key, required this.isSelected, required this.text, this.onTap});

  final bool isSelected;
  final String text;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        height: Sizes.extraBig.value,
        decoration: _buildDecoration(context),
        child: _buildText(context),
      ),
    );
  }

  AppText _buildText(BuildContext context) {
    return AppText.labelMediumSemiBold(
      text,
      context: context,
      align: TextAlign.center,
      color: isSelected ? context.colorScheme.onPrimary : context.colorScheme.primary,
    );
  }

  AppBoxDecoration _buildDecoration(BuildContext context) {
    return AppBoxDecoration.circularContainer(
      borderColor: isSelected ? context.colorScheme.primary : context.colorScheme.outline,
      backgroundColor: isSelected ? context.colorScheme.primary : context.colorScheme.background,
      size: Sizes.small,
    );
  }
}
