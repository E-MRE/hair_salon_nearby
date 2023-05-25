import 'package:flutter/material.dart';

import '../../../core/extensions/context_extensions.dart';
import '../../../core/extensions/screen_util_extensions.dart';

class AppText extends Text {
  AppText(super.data);

  AppText.general(super.data, {Key? key, required BuildContext context, double? fontSize, bool isScaledSize = true})
      : super(
          key: key,
          style: context.textTheme.bodyText2?.copyWith(fontSize: isScaledSize ? fontSize?.fontSizeScale : fontSize),
        );
}
