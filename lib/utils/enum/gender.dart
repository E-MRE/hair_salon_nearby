import 'package:easy_localization/easy_localization.dart';
import 'package:json_annotation/json_annotation.dart';

import '../constants/lang/locale_keys.g.dart';

@JsonEnum(valueField: 'gender')
enum Gender {
  @JsonValue(0)
  man(0),
  @JsonValue(1)
  woman(1);

  final int value;
  const Gender(this.value);
}

extension GenderExtension on Gender {
  String toText() {
    return switch (this) {
      Gender.man => LocaleKeys.gender_man.tr(),
      Gender.woman => LocaleKeys.gender_woman.tr(),
    };
  }
}
