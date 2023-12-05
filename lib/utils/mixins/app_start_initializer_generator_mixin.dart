import 'package:flutter/material.dart';
import 'package:hair_salon_nearby/utils/helpers/initializers/collect_device_info_app_start_initializer.dart';

import '../helpers/initializers/app_start_initializer.dart';
import '../helpers/initializers/cache_service_app_start_initializer.dart';
import '../helpers/initializers/dependency_app_start_initializer.dart';
import '../helpers/initializers/easy_localization_app_start_initializer.dart';
import '../helpers/initializers/native_splash_app_start_initializer.dart';
import '../helpers/initializers/token_context_app_start_initializer.dart';

mixin AppStartInitializerGeneratorMixin {
  List<AppStartInitializer> generateInitializers(WidgetsBinding widgetsBinding) {
    return [
      NativeSplashAppStartInitializer(widgetsBinding: widgetsBinding),
      const EasyLocalizationAppStartInitializer(),
      const DependencyAppStartInitializer(),
      const CollectDeviceInfoAppStartInitializer(),
      const CacheServiceAppStartInitializer(),
      const TokenContextAppStartInitializer(),
    ];
  }
}
