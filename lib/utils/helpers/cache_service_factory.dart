import '../../core/services/abstract/cache_service.dart';
import '../../core/services/concrete/hive_cache_manager.dart';

class CacheServiceFactory {
  static CacheServiceFactory? _instance;
  static CacheServiceFactory get instance {
    _instance ??= CacheServiceFactory._init();
    return _instance!;
  }

  CacheServiceFactory._init();

  CacheService get cacheService => HiveCacheManager.instance;

  Future<void> initialize() async => await cacheService.init();
}
