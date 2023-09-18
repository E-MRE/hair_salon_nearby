import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../enums/slide_begin_type.dart';

class SlideTransitionRoute extends CustomRoute {
  SlideTransitionRoute({
    required super.page,
    required super.path,
    SlideBeginType slideType = SlideBeginType.right,
  }) : super(transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return SlideTransition(position: slideType.toTween().animate(animation), child: child);
        });
}
