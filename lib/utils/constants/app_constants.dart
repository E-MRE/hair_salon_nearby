import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';

import '../../core/utils/enums/environment/environment_profile.dart';

class AppConstants {
  static bool getDevicePreviewEnable([bool showDebugMode = false]) => showDebugMode ? kDebugMode : false;

  static const EnvironmentProfile environmentProfile = EnvironmentProfile.test;
  static const String appName = 'AppName';

  static const double minScreenWidth = 450;
  static const double maxScreenWidth = 1280;

  static final responsiveBreakpoints = [
    const Breakpoint(start: 0, end: 450, name: MOBILE),
    const Breakpoint(start: 451, end: 820, name: TABLET),
    const Breakpoint(start: 821, end: 1920, name: DESKTOP),
    const Breakpoint(start: 1921, end: double.infinity, name: '4K'),
  ];

  static const Size designSize = Size(375, 812);
}
