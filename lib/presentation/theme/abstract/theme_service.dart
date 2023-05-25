import 'package:flutter/material.dart';

import 'base_theme.dart';

abstract class ThemeService {
  final BaseTheme theme;

  ThemeService({
    required this.theme,
  });

  ThemeData get createTheme;
}
