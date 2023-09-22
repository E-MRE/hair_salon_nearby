import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

import 'app_start_initializer.dart';

class NativeSplashAppStartInitializer extends AppStartInitializer {
  final WidgetsBinding widgetsBinding;

  const NativeSplashAppStartInitializer({required this.widgetsBinding});

  @override
  void initialize() {
    FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  }
}
