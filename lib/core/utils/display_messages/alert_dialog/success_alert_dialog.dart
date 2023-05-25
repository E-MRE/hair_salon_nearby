import 'package:flutter/material.dart';

class SuccessAlertDialog extends AlertDialog {
  SuccessAlertDialog({
    Key? key,
    required String content,
    String title = 'Başarılı',
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
