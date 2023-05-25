import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:responsive_framework/utils/responsive_utils.dart';

import '../constants/app_constants.dart';

class CustomResponsiveWrapper extends StatelessWidget {
  const CustomResponsiveWrapper({
    Key? key,
    required this.child,
    this.breakpoints = const [],
    this.maxWidth = AppConstants.maxScreenWidth,
    this.background,
    this.breakpointsLandscape,
    this.landscapePlatforms,
    this.debugLog = false,
    this.useShortestSide = false,
  });

  final Widget? child;
  final List<Breakpoint> breakpoints;
  final List<Breakpoint>? breakpointsLandscape;
  final List<ResponsiveTargetPlatform>? landscapePlatforms;
  final bool debugLog;
  final bool useShortestSide;
  final double maxWidth;
  final Widget? background;

  @override
  Widget build(BuildContext context) {
    return ResponsiveBreakpoints.builder(
      breakpoints: breakpoints,
      breakpointsLandscape: breakpointsLandscape,
      landscapePlatforms: landscapePlatforms,
      useShortestSide: useShortestSide,
      debugLog: debugLog,
      child: _buildChildByMaxWidth(),
    );
  }

  Widget _buildChildByMaxWidth() {
    return MaxWidthBox(
      maxWidth: maxWidth,
      background: background ?? Container(color: const Color(0xFFF5F5F5)),
      child: Builder(builder: (context) {
        return ResponsiveScaledBox(
          width: ResponsiveValue<double>(context, conditionalValues: [
            const Condition.equals(name: MOBILE, value: 450),
            const Condition.between(start: 800, end: 1100, value: 800),
            Condition.between(start: 1000, end: AppConstants.maxScreenWidth.toInt(), value: 1000),
            // There are no conditions for width over 1200
            // because the `maxWidth` is set to 1200 via the MaxWidthBox.
          ]).value,
          child: child ?? const SizedBox.shrink(),
        );
      }),
    );
  }
}
