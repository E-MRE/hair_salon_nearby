import 'package:hair_salon_nearby/core/repositories/base_cache_repository.dart';
import 'package:hair_salon_nearby/repositories/abstracts/city_repository.dart';

abstract class CacheCityRepository extends BaseCacheRepository implements CityRepository {
  const CacheCityRepository({required super.cacheService});
}
