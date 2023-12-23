import 'package:hair_salon_nearby/core/services/models/api_response.dart';
import 'package:hair_salon_nearby/models/entity/venue_list_model.dart';
import 'package:hair_salon_nearby/models/request/venue_list_request_model.dart';

abstract class VenueRepository {
  Future<ApiResponse<VenueListModel>> getVenues(VenueListRequestModel requestModel);
}
