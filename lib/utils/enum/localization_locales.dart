import 'package:flutter/material.dart';

enum LocalizationLocales { init, tr }

extension LocalizationLocalesExtension on LocalizationLocales {
  Locale get rawValue {
    switch (this) {
      case LocalizationLocales.tr:
      case LocalizationLocales.init:
        return const Locale('tr', 'TR');
    }
  }

  List<LocalizationLocales> get supportedLocalizations =>
      LocalizationLocales.values.where((element) => element != LocalizationLocales.init).toList();

  List<Locale> get supportedLocales => supportedLocalizations.map((element) => element.rawValue).toList();
}
