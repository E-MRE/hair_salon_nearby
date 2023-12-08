import 'package:hair_salon_nearby/core/services/models/api_response.dart';
import 'package:hair_salon_nearby/models/entity/city_model.dart';

/// The `CityRepository` class declares a method `getCities()` that returns a `Future` object resolving
/// to an `ApiResponse` containing a list of `CityModel` objects.
abstract class CityRepository {
  /// The `getCities()` method is declaring a function signature that returns a `Future` object. The
  /// `Future` object represents a potential value or error that will be available at some point in the
  /// future. In this case, the `Future` object will resolve to an `ApiResponse` object that contains a
  /// list of `CityModel` objects.
  Future<ApiResponse<List<CityModel>>> getCities();
}
