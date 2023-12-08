import 'package:hair_salon_nearby/core/repositories/base_dio_remote_repository.dart';
import 'package:hair_salon_nearby/core/services/models/api_response.dart';
import 'package:hair_salon_nearby/models/entity/city_model.dart';
import 'package:hair_salon_nearby/repositories/abstracts/city_repository.dart';
import 'package:hair_salon_nearby/utils/constants/endpoints/endpoint_constants.dart';

final class DioCityRepository extends BaseDioRemoteRepository implements CityRepository {
  const DioCityRepository({required super.dataService}) : super.remote();

  @override
  Future<ApiResponse<List<CityModel>>> getCities() {
    return dataService.getData<List<CityModel>>(
      fromMap: (data) => dataService.castFromJson<CityModel>(data, (json) => CityModel.fromJson(json)),
      endpoint: EndpointConstants.city.cities,
    );
  }
}
