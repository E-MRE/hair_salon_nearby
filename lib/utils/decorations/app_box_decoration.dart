import 'package:flutter/material.dart';

import '../enum/sizes.dart';
import 'circular_border_radius.dart';

class AppBoxDecoration extends BoxDecoration {
  AppBoxDecoration.circularContainer({
    required Color borderColor,
    Color? backgroundColor,
    Sizes size = Sizes.medium,
    double borderWidth = 1,
    List<BoxShadow>? shadow,
  }) : super(
          color: backgroundColor ?? Colors.transparent,
          borderRadius: CircularBorderRadius(radius: size),
          border: Border.all(color: borderColor, width: borderWidth),
          boxShadow: shadow,
        );
}
