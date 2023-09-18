import 'package:flutter/material.dart';

enum SlideBeginType { topCenter, topRight, topLeft, bottomCenter, bottomRight, bottomLeft, left, right }

extension SlideBeginTypeExtension on SlideBeginType {
  Tween<Offset> toTween() {
    return switch (this) {
      SlideBeginType.topCenter => Tween<Offset>(begin: const Offset(0, -1), end: Offset.zero),
      SlideBeginType.topRight => Tween<Offset>(begin: const Offset(1, -1), end: Offset.zero),
      SlideBeginType.topLeft => Tween<Offset>(begin: const Offset(-1, -1), end: Offset.zero),
      SlideBeginType.bottomCenter => Tween<Offset>(begin: const Offset(0, 1), end: Offset.zero),
      SlideBeginType.bottomRight => Tween<Offset>(begin: const Offset(1, 1), end: Offset.zero),
      SlideBeginType.bottomLeft => Tween<Offset>(begin: const Offset(-1, 1), end: Offset.zero),
      SlideBeginType.left => Tween<Offset>(begin: const Offset(-1, 0), end: Offset.zero),
      SlideBeginType.right => Tween<Offset>(begin: const Offset(1, 0), end: Offset.zero),
    };
  }
}
