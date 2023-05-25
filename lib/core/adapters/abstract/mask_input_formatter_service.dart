import 'package:flutter/material.dart';

abstract class MaskInputFormatterService {
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue);
}
