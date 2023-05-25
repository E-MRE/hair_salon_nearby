import 'package:hive_flutter/hive_flutter.dart';

import '../../utils/enums/caching_keys.dart';
import '../abstract/cache_service.dart';

class HiveCacheManager implements CacheService {
  static HiveCacheManager? _instance;

  static HiveCacheManager get instance {
    _instance ??= HiveCacheManager._init();
    return _instance!;
  }

  @override
  Future<void> init() async {
    await Hive.initFlutter('document');
  }

  HiveCacheManager._init();

  @override
  Future<T?> getValue<T>(
    CachingKeys key, {
    T? defaultValue,
  }) async {
    var box = await Hive.openBox<T>(key.toString());
    return box.get(key.toString(), defaultValue: defaultValue);
  }

  @override
  Future<bool> setValue<T>(CachingKeys key, T data) async {
    try {
      var box = await Hive.openBox<T>(key.toString());
      await box.put(key.toString(), data);
      return true;
    } catch (error) {
      return false;
    }
  }

  @override
  Future<bool> deleteValue<T>(CachingKeys key) async {
    var box = await Hive.openBox<T>(key.toString());
    box.delete(key.toString());
    return true;
  }
}
