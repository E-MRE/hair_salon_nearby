enum SpecialKey {
  empty(''),
  space(' '),
  dash('-'),
  dot('.'),
  slash('/'),
  backSlash('\\'),
  underDash('_');

  final String value;
  const SpecialKey(this.value);
}
