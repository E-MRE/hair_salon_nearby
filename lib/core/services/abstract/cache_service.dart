import '../../utils/enums/caching_keys.dart';

abstract class CacheService {
  Future<void> init();
  Future<T?> getValue<T>(
    CachingKeys key, {
    T? defaultValue,
  });

  Future<bool> setValue<T>(CachingKeys key, T data);

  Future<bool> deleteValue<T>(CachingKeys key);
}
