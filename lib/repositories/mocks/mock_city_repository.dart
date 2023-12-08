import 'package:hair_salon_nearby/core/services/models/api_response.dart';
import 'package:hair_salon_nearby/core/services/models/api_response_model.dart';
import 'package:hair_salon_nearby/core/utils/enums/process_status.dart';
import 'package:hair_salon_nearby/models/entity/city_model.dart';
import 'package:hair_salon_nearby/repositories/abstracts/city_repository.dart';

final class MockCityRepository extends CityRepository {
  @override
  Future<ApiResponse<List<CityModel>>> getCities() {
    return Future.value(ApiResponseModel(data: [CityModel.fromJson(_json)], processStatus: ProcessStatus.success));
  }
}

final _json = {
  'cityName': 'ADANA',
  'counties': [
    {'countyName': 'ÇUKUROVA', 'id': 3},
    {'countyName': 'YUMURTALIK', 'id': 14},
    {'countyName': 'YÜREĞİR', 'id': 15}
  ]
};
