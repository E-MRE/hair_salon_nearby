import 'package:hair_salon_nearby/core/utils/helpers/dependency/core_dependencies.dart';
import 'package:hair_salon_nearby/utils/helpers/device/device_info.dart';

class DependencyConstants {
  static DeviceInfo get deviceInfo => CoreDependencies.getDependency<DeviceInfo>();
}
