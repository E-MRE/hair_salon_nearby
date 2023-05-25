import 'package:flutter/material.dart';

/// Yerelleştirme için kullanılır.
enum LocalizationLocales {
  init,
  tr,
  en,
}

extension LocalizatonLocalesExtension on LocalizationLocales {
  ///Seçili enum değerine karşılık gelen `Locale` değerini döndürür
  Locale get rawValue {
    switch (this) {
      case LocalizationLocales.en:
        return const Locale('en', 'US');

      case LocalizationLocales.tr:
        return const Locale('tr', 'TR');

      case LocalizationLocales.init:
        return const Locale('tr', 'TR');
    }
  }

  /// Desteklenen yerelleştirmeleri döner
  List<Locale> get supportedLocales => [
        const Locale('en', 'US'),
        const Locale('tr', 'TR'),
      ];
}
