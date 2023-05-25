extension StringToBoolExtension on String {
  bool toBool() {
    return toLowerCase() == true.toString().toLowerCase();
  }
}
