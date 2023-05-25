import 'package:flutter/material.dart';

import 'base_snack_bar.dart';

class DisplaySnackBar {
  late final BuildContext _context;

  DisplaySnackBar(context) {
    _context = context;
  }

  void successMessage(String text, {Color backgroundColor = Colors.green}) {
    return _showSnackBar(text, backgroundColor);
  }

  void errorMessage(String text, {Color backgroundColor = Colors.red}) {
    return _showSnackBar(text, backgroundColor);
  }

  void _showSnackBar(String text, Color backgroundColor) {
    ScaffoldMessenger.of(_context)
      ..removeCurrentSnackBar()
      ..showSnackBar(BaseSnackBar(
        content: Text(text),
        backgroundColor: backgroundColor,
        behavior: SnackBarBehavior.fixed,
      ));
  }
}
