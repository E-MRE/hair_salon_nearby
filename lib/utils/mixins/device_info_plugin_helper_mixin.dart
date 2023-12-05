import 'package:flutter_app_info/flutter_app_info.dart';

mixin DeviceInfoPluginHelperMixin {
  Future<AppInfoData> getAppInfo() {
    return AppInfoData.get();
  }
}
