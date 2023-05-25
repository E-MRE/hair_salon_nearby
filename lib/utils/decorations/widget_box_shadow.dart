import 'package:flutter/cupertino.dart';

class WidgetBoxShadow extends BoxShadow {
  ///Card için kullanılan shadow ayarları.
  const WidgetBoxShadow.card({
    Color color = const Color.fromRGBO(8, 4, 50, 0.05),
    Offset offset = const Offset(0, 15),
  }) : super(
          color: color,
          spreadRadius: 0,
          blurRadius: 10,
          offset: offset,
        );

  ///Bottom sheet için kullanılan shadow ayarları.
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
