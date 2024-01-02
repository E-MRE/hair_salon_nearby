import 'package:hair_salon_nearby/core/extensions/query_parameter_extension.dart';
import 'package:hair_salon_nearby/core/repositories/base_dio_remote_repository.dart';
import 'package:hair_salon_nearby/core/services/models/api_response.dart';
import 'package:hair_salon_nearby/models/entity/venue_list_model.dart';
import 'package:hair_salon_nearby/models/request/venue_list_request_model.dart';
import 'package:hair_salon_nearby/repositories/abstracts/venue_repository.dart';
import 'package:hair_salon_nearby/utils/constants/endpoints/endpoint_constants.dart';

final class DioVenueRepository extends BaseDioRemoteRepository implements VenueRepository {
  DioVenueRepository({required super.dataService}) : super.remote();

  @override
  Future<ApiResponse<VenueListModel>> getVenues(VenueListRequestModel requestModel) async {
    return dataService.getData<VenueListModel>(
      endpoint: EndpointConstants.venue.venueList,
      fromMap: (data) => VenueListModel.fromJson(data),
      queryParameters: requestModel.toJson().toQueryMap(),
    );
  }
}
