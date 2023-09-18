import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

class ScaleTransitionRoute extends CustomRoute {
  ScaleTransitionRoute({
    required super.page,
    required super.path,
    super.durationInMilliseconds,
    FilterQuality quality = FilterQuality.high,
    Alignment alignment = Alignment.bottomCenter,
  }) : super(transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return ScaleTransition(scale: animation, child: child, filterQuality: quality, alignment: alignment);
        });
}
