import 'package:hair_salon_nearby/utils/mixins/regexp_mixin.dart';

mixin LoginValidatorMixin {
  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) return 'Email alanı boş bırakılmamalıdır.';

    if (RegExpMixin.emailRegexp.hasMatch(value)) {
      return null;
    }

    return 'Lütfen geçerli bir e-posta giriniz.';
  }

  String? validatePassword(String? value, {int minimumLength = 8}) {
    if (value == null || value.isEmpty) return 'Şifre alanı boş bırakılmamalıdır.';

    if (value.length < minimumLength) {
      return 'Girilen şifre en az 8 karakter olmalıdır.';
    }

    return null;
  }
}
