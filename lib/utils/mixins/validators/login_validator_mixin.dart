import 'package:easy_localization/easy_localization.dart';

import '../../constants/lang/locale_keys.g.dart';
import '../regexp_mixin.dart';

mixin LoginValidatorMixin {
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
