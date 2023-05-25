import 'package:flutter/material.dart';

import '../../utils/gen/fonts.gen.dart';
import 'abstract/base_theme.dart';
import 'abstract/theme_service.dart';

class ThemeManager extends ThemeService {
  ThemeManager({required BaseTheme theme}) : super(theme: theme);

  @override
  ThemeData get createTheme {
    return ThemeData(
      fontFamily: FontFamily.poppins,
      textTheme: theme.textTheme.data,
      primaryColor: theme.colorTheme.colorScheme?.primary,
      focusColor: theme.colorTheme.focusColor,
      disabledColor: theme.colorTheme.disabledColor,
      hintColor: theme.colorTheme.hintColor,
      hoverColor: theme.colorTheme.hoverColor,
      shadowColor: theme.colorTheme.shadowColor,
      scaffoldBackgroundColor: theme.colorTheme.scaffoldBackgroundColor,
      colorScheme: theme.colorTheme.colorScheme,
      inputDecorationTheme: InputDecorationTheme(
        focusColor: theme.colorTheme.focusColor,
      ),
    );
  }
}
