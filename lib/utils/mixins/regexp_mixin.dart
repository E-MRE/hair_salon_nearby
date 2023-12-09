mixin RegExpMixin {
  String phoneRegExp(String phone) {
    return phone.replaceAll(RegExp(r'\D'), '');
  }

  static RegExp get alphabetRegexp => RegExp('[a-zA-ZğüşöçİĞÜŞÖÇ]');

  static RegExp get emailRegexp => RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
}
