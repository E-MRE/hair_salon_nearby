import '../../../core/utils/helpers/dependency/core_dependencies.dart';
import '../../mixins/hive_register_adapters_mixin.dart';
import 'app_start_initializer.dart';

class CacheServiceAppStartInitializer extends FutureAppStartInitializer with HiveRegisterAdaptersMixin {
  const CacheServiceAppStartInitializer();

  @override
  Future<void> initialize() async {
    await kCacheService.init();
    registerAdapters(kCacheService);
  }
}
