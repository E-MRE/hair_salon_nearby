import 'dart:io';

import '../enum/platform_type.dart';

mixin CurrentPlatformGetterMixin {
  PlatformType getPlatform() {
    if (Platform.isAndroid) {
      return PlatformType.android;
    } else if (Platform.isIOS) {
      return PlatformType.ios;
    } else if (Platform.isWindows || Platform.isLinux || Platform.isMacOS) {
      return PlatformType.web;
    }

    return PlatformType.other;
  }
}
