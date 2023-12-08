import 'package:hair_salon_nearby/core/services/abstract/cache_service.dart';
import 'package:hair_salon_nearby/models/entity/city_model.dart';
import 'package:hair_salon_nearby/models/entity/county_model.dart';

mixin HiveRegisterAdaptersMixin {
  void registerAdapters(CacheService cacheService) {
    cacheService.register<CityModel>((json) => CityModel.fromJson(json));
    cacheService.register<CountyModel>((json) => CountyModel.fromJson(json));
  }
}
