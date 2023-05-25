/// It is used to determine the number of Inputs [max lines] and [min lines].
///
/// * ``loose: 1 line``
/// * ``enough: 2 line``
/// * ``normal: 3 line``
/// * ``more: 4 line``
/// * ``hard: 5 line``
/// * ``ultra: 6 line``
enum TextLineType {
  /// value: 1 line
  loose(1),

  /// value: 2 line
  enough(2),

  /// value: 3 line
  normal(3),

  /// value: 4 line
  more(4),

  /// value: 5 line
  hard(5),

  /// value: 6 line
  ultra(6);

  final int value;
  const TextLineType(this.value);
}
