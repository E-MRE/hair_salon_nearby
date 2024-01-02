import 'dart:convert';

import 'package:hair_salon_nearby/core/services/models/api_response.dart';
import 'package:hair_salon_nearby/core/services/models/api_response_model.dart';
import 'package:hair_salon_nearby/core/utils/enums/process_status.dart';
import 'package:hair_salon_nearby/models/entity/venue_list_model.dart';
import 'package:hair_salon_nearby/models/request/venue_list_request_model.dart';
import 'package:hair_salon_nearby/repositories/abstracts/venue_repository.dart';

final class MockVenueRepository implements VenueRepository {
  final String _mockVenueListJson = '''
{
    "items": [
      {
        "id": 1,
        "name": "FM Kuaför",
        "info": "FM Kuaför Hizmetinizde",
        "motto": "Bay&Bayan Kuaför",
        "image": "http://139.59.144.130:5006/images/venue/hairdresser.png",
        "longitute": 123.123,
        "latitute": 123.123,
        "distance": 0,
        "star": 0,
        "venueType": 0
      }
    ],
    "pageIndex": 1,
    "totalPages": 1,
    "totalCount": 1,
    "hasPreviousPage": false,
    "hasNextPage": false
  }
''';

  @override
  Future<ApiResponse<VenueListModel>> getVenues(VenueListRequestModel requestModel) async {
    final data = VenueListModel.fromJson(jsonDecode(_mockVenueListJson));
    return ApiResponseModel<VenueListModel>(data: data, processStatus: ProcessStatus.success);
  }
}
