import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../presentation/theme/abstract/base_theme.dart';
import '../../presentation/theme/abstract/theme_service.dart';

extension BuildContextThemeExtension on BuildContext {
  BaseTheme get readTheme => read<ThemeService>().theme;

  ThemeService get themeService => read<ThemeService>();
  ThemeService get watchThemeService => watch<ThemeService>();
}
