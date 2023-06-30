enum SpecialKey {
  empty(''),
  space(' '),
  dash('-'),
  dot('.'),
  centeredDot('·'),
  flame('🔥'),
  slash('/'),
  backSlash('\\'),
  underDash('_');

  final String value;
  const SpecialKey(this.value);
}
