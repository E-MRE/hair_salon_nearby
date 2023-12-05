import 'package:hair_salon_nearby/core/utils/helpers/dependency/core_dependencies.dart';
import 'package:hair_salon_nearby/utils/helpers/device/device_info.dart';
import 'package:hair_salon_nearby/utils/helpers/initializers/app_start_initializer.dart';
import 'package:hair_salon_nearby/utils/mixins/current_platform_getter_mixin.dart';
import 'package:hair_salon_nearby/utils/mixins/device_info_plugin_helper_mixin.dart';

class CollectDeviceInfoAppStartInitializer extends FutureAppStartInitializer
    with DeviceInfoPluginHelperMixin, CurrentPlatformGetterMixin {
  const CollectDeviceInfoAppStartInitializer();

  @override
  Future<void> initialize() async {
    final info = await getAppInfo();
    final version = '${info.package.version.major}.${info.package.version.minor}.${info.package.version.patch}';

    CoreDependencies.getDependency<DeviceInfo>().setAll(
      version: version,
      serialNo: info.package.buildSignature,
      platformType: getPlatform(),
    );
  }
}
