import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

class FadeTransitionRoute extends CustomRoute {
  FadeTransitionRoute({
    required super.page,
    required super.path,
    super.initial,
    super.durationInMilliseconds = 750,
  }) : super(transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return FadeTransition(opacity: animation, child: child);
        });
}
