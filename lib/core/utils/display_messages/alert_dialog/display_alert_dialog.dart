import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../utils/constants/lang/locale_keys.g.dart';
import '/core/utils/display_messages/alert_dialog/error_alert_dialog.dart';
import '/core/utils/display_messages/alert_dialog/success_alert_dialog.dart';

class DisplayAlertDialog {
  late final BuildContext _context;
  final String _success = LocaleKeys.success.tr();
  final String _error = LocaleKeys.error.tr();
  final String _okay = LocaleKeys.okay.tr();

  DisplayAlertDialog(BuildContext context) {
    _context = context;
  }

  Future<T?> successAlert<T>(
    String content, {
    String? title,
    String? buttonText,
    VoidCallback? onPressed,
    bool dismissible = true,
  }) {
    return showDialog<T?>(
        context: _context,
        barrierDismissible: dismissible,
        builder: (context) {
          return WillPopScope(
            onWillPop: () => Future.value(dismissible),
            child: SuccessAlertDialog(
              title: title ?? _success,
              content: content,
              buttonText: buttonText ?? _okay,
              onPressed: () {
                Navigator.of(context).maybePop();
                onPressed?.call();
              },
            ),
          );
        });
  }

  Future<T?> errorAlert<T>(
    String content, {
    String? title,
    String? buttonText,
    VoidCallback? onPressed,
    bool dismissible = true,
  }) {
    return showDialog<T?>(
        context: _context,
        barrierDismissible: dismissible,
        builder: (context) {
          return WillPopScope(
            onWillPop: () => Future.value(dismissible),
            child: ErrorAlertDialog(
              title: title ?? _error,
              content: content,
              buttonText: buttonText ?? _okay,
              onPressed: () {
                Navigator.of(context).maybePop();
                onPressed?.call();
              },
            ),
          );
        });
  }

  Future<T?> custom<T>({required Widget dialog, bool barrierDismisable = true}) {
    return showDialog<T?>(
      barrierDismissible: barrierDismisable,
      builder: (context) => dialog,
      context: _context,
    );
  }

  Future<T?> customAlert<T>({required Widget content}) {
    return showDialog<T?>(
        context: _context,
        builder: (context) {
          return AlertDialog(
              content: SizedBox(
            child: content,
            width: double.maxFinite,
          ));
        });
  }
}
