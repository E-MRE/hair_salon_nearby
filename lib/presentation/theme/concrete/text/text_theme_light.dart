import 'package:flutter/material.dart';

import '../../abstract/base_text_theme.dart';

class TextThemeLight implements BaseTextTheme {
  @override
  late final TextTheme data;

  @override
  final Color? primaryColor;

  @override
  TextStyle? bodyLarge;

  @override
  TextStyle? bodyMedium;

  @override
  TextStyle? bodySmall;

  @override
  TextStyle? displayLarge;

  @override
  TextStyle? displayMedium;

  @override
  TextStyle? displaySmall;

  @override
  TextStyle? headlineLarge;

  @override
  TextStyle? headlineMedium;

  @override
  TextStyle? headlineSmall;

  @override
  TextStyle? labelLarge;

  @override
  TextStyle? labelMedium;

  @override
  TextStyle? labelSmall;

  @override
  TextStyle? titleLarge;

  @override
  TextStyle? titleMedium;

  @override
  TextStyle? titleSmall;

  TextThemeLight(this.primaryColor) {
    data = _setData();
  }

  TextTheme _setData() {
    return TextTheme(
      displayLarge: displayLarge,
      displayMedium: displayMedium,
      displaySmall: displaySmall,
      headlineLarge: headlineLarge,
      headlineMedium: headlineMedium,
      headlineSmall: headlineSmall,
      titleLarge: titleLarge,
      titleMedium: titleMedium,
      titleSmall: titleSmall,
      bodyLarge: bodyLarge,
      bodyMedium: bodyMedium,
      bodySmall: bodySmall,
      labelLarge: labelLarge,
      labelMedium: labelMedium,
      labelSmall: labelSmall,
    );
  }
}
