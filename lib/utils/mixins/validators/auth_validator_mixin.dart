import 'package:easy_localization/easy_localization.dart';
import 'package:hair_salon_nearby/core/utils/enums/special_key.dart';

import '../../constants/lang/locale_keys.g.dart';
import '../regexp_mixin.dart';

mixin AuthValidatorMixin {
  String? validateFullName(String? value) {
    if (value == null || value.isEmpty) return _emptyField(LocaleKeys.validators_nameSurname);

    if (!value.contains(SpecialKey.space.value)) {
      return LocaleKeys.validators_enterNameAndSurname.tr();
    }

    final splintedNames = value.split(SpecialKey.space.value);
    for (var index = 0; index < splintedNames.length; index++) {
      final matches = RegExpMixin.alphabetRegexp.allMatches(splintedNames[index]);
      bool isAllMatched = matches.length == splintedNames[index].length;
      if (isAllMatched && splintedNames[index].length > 1) {
        continue;
      }

      if (index == 0) {
        return LocaleKeys.validators_invalidName.tr();
      } else if (index == splintedNames.length - 1) {
        return LocaleKeys.validators_invalidSurname.tr();
      } else {
        return LocaleKeys.validators_invalidOtherName.tr(args: [(index + 1).toString()]);
      }
    }

    return null;
  }

  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) return _emptyField(LocaleKeys.validators_email);

    if (RegExpMixin.emailRegexp.hasMatch(value)) {
      return null;
    }

    return LocaleKeys.validators_invalidEmailError.tr();
  }

  String? validatePassword(String? value, {int minimumLength = 6}) {
    if (value == null || value.isEmpty) return _emptyField(LocaleKeys.validators_password);

    if (value.length < minimumLength) {
      return LocaleKeys.validators_lessLengthPassword.tr(args: [minimumLength.toString()]);
    }

    return null;
  }

  String _emptyField(String key) {
    return LocaleKeys.validators_fieldEmptyError.tr(args: [key.tr()]);
  }
}
