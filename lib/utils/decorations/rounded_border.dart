import 'package:flutter/material.dart';

class RoundedBorder extends RoundedRectangleBorder {
  RoundedBorder.circular({
    double radius = 100,
    double width = 1.0,
    BorderStyle style = BorderStyle.solid,
    Color color = const Color(0xFF000000),
  }) : super(
            borderRadius: BorderRadius.circular(radius),
            side: BorderSide(
              color: color,
              style: style,
              width: width,
            ));
}
