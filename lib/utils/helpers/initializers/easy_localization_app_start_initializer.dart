import 'package:easy_localization/easy_localization.dart';

import 'app_start_initializer.dart';

class EasyLocalizationAppStartInitializer extends FutureAppStartInitializer {
  const EasyLocalizationAppStartInitializer();

  @override
  Future<void> initialize() async {
    await EasyLocalization.ensureInitialized();
  }
}
