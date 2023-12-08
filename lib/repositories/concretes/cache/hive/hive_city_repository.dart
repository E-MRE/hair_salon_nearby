import 'package:hair_salon_nearby/core/services/abstract/cache_service.dart';
import 'package:hair_salon_nearby/core/services/models/api_response.dart';
import 'package:hair_salon_nearby/core/services/models/api_response_model.dart';
import 'package:hair_salon_nearby/core/services/models/friendly_message_model.dart';
import 'package:hair_salon_nearby/core/utils/enums/process_status.dart';
import 'package:hair_salon_nearby/models/entity/city_model.dart';
import 'package:hair_salon_nearby/repositories/abstracts/city_repository.dart';
import 'package:hair_salon_nearby/utils/helpers/caching_keys.dart';

final class HiveCityRepository extends CityRepository {
  const HiveCityRepository({required this.cacheService});

  final CacheService cacheService;

  @override
  Future<ApiResponse<List<CityModel>>> getCities() async {
    final cityResult = cacheService.getListValue<CityModel>(CachingKeys.cities);

    final status = cityResult.isSuccessAndDataExists ? ProcessStatus.success : ProcessStatus.error;

    return ApiResponseModel(
      data: cityResult.data,
      processStatus: status,
      friendlyMessage: FriendlyMessageModel(message: cityResult.message, title: status.name),
    );
  }
}
