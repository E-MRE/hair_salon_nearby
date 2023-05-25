import 'package:flutter/services.dart';
import 'package:mask_input_formatter/mask_input_formatter.dart';

import '/core/adapters/abstract/mask_input_formatter_service.dart';

class MaskInputFormatterManager implements MaskInputFormatterService {
  final TextInputFormatter _inputFormatter;
  final String? mask;
  final bool? textAllCaps;

  MaskInputFormatterManager({
    TextInputFormatter? inputFormatter,
    required this.mask,
    this.textAllCaps,
  }) : _inputFormatter = inputFormatter ??
            MaskInputFormatter(
              mask: mask,
              textAllCaps: textAllCaps,
            );

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    return _inputFormatter.formatEditUpdate(oldValue, newValue);
  }
}
