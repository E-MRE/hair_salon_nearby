import 'package:flutter/material.dart';
import 'package:hair_salon_nearby/core/extensions/context_extensions.dart';
import 'package:hair_salon_nearby/utils/decorations/app_box_decoration.dart';
import 'package:hair_salon_nearby/utils/decorations/app_edge_insets.dart';
import 'package:hair_salon_nearby/utils/enum/sizes.dart';

class RoundedColoredContainer extends StatelessWidget {
  const RoundedColoredContainer({
    super.key,
    required this.child,
    this.height = Sizes.prettyBig,
    this.round = Sizes.smaller,
    this.borderColor = Colors.transparent,
    this.padding,
    this.color,
    this.opacity = .3,
  });

  final Sizes height;
  final Sizes round;
  final EdgeInsets? padding;
  final Color? color;
  final Color borderColor;
  final double opacity;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height.value,
      padding: padding ?? AppEdgeInsets.symmetric(horizontal: Sizes.prettySmall, vertical: Sizes.verySmall),
      decoration: _buildDecoration(context),
      child: child,
    );
  }

  AppBoxDecoration _buildDecoration(BuildContext context) {
    return AppBoxDecoration.circularContainer(
      borderColor: borderColor,
      backgroundColor: (color ?? context.colorScheme.secondary).withOpacity(opacity),
      size: round,
    );
  }
}
