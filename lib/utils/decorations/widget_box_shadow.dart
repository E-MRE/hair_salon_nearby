import 'package:flutter/material.dart';

class WidgetBoxShadow extends BoxShadow {
  const WidgetBoxShadow.card({
    Color color = const Color.fromRGBO(8, 4, 50, 0.05),
    Offset offset = const Offset(0, 15),
  }) : super(
          color: color,
          spreadRadius: 0,
          blurRadius: 10,
          offset: offset,
        );

  const WidgetBoxShadow.bottomSheet({
    Color color = const Color.fromRGBO(8, 4, 50, 0.08),
    Offset offset = const Offset(0, -8),
  }) : super(
          color: color,
          spreadRadius: 0,
          blurRadius: 10,
          offset: offset,
        );
}
