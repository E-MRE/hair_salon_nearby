import 'package:flutter/material.dart';

class ErrorAlertDialog extends AlertDialog {
  ErrorAlertDialog({
    Key? key,
    required String content,
    String title = 'Hata',
    String buttonText = 'OK',
    VoidCallback? onPressed,
  }) : super(
          key: key,
          title: Text(title),
          content: Text(content),
          actions: [
            TextButton(
              onPressed: onPressed,
              child: Text(buttonText),
            )
          ],
        );
}
