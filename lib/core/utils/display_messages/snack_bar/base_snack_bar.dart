import 'package:flutter/material.dart';

class BaseSnackBar extends SnackBar {
  const BaseSnackBar({
    Key? key,
    required Widget content,
    required Color backgroundColor,
    SnackBarBehavior behavior = SnackBarBehavior.fixed,
  }) : super(
          key: key,
          content: content,
          backgroundColor: backgroundColor,
          behavior: behavior,
        );
}
