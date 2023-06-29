import 'package:easy_localization/easy_localization.dart';

import '../constants/lang/locale_keys.g.dart';

enum Gender { man, woman }

extension GenderExtension on Gender {
  String toText() {
    return switch (this) {
      Gender.man => LocaleKeys.gender_man.tr(),
      Gender.woman => LocaleKeys.gender_woman.tr(),
    };
  }
}
