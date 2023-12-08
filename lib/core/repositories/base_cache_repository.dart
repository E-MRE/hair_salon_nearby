import 'package:hair_salon_nearby/core/services/abstract/cache_service.dart';

abstract class BaseCacheRepository {
  final CacheService cacheService;

  const BaseCacheRepository({required this.cacheService});
}
