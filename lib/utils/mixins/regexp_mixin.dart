mixin RegExpMixin {
  String phoneRegExp(String phone) {
    return phone.replaceAll(RegExp(r'\D'), '');
  }
}
