import 'package:flutter/material.dart';

import '../../../utils/enum/hair_salon_type.dart';
import 'base_theme.dart';

abstract class ThemeService extends ChangeNotifier {
  BaseTheme theme;

  void setSalonType(HairSalonType salonType) {
    theme = salonType.getTheme;
    notifyListeners();
  }

  ThemeService({required this.theme});

  ThemeData get createTheme;
}
