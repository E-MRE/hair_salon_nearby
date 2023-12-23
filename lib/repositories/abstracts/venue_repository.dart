import 'package:hair_salon_nearby/core/services/models/api_response.dart';

abstract class VenueRepository {
  Future<ApiResponse> get();
}
