import '../../core/services/models/api_response.dart';
import '../../models/request/check_update_request_model.dart';

/// The abstract class PublicRepository defines a method checkUpdate() that returns a Future of
/// ApiResponse.
abstract class PublicRepository {
  /// `Future<ApiResponse> checkUpdate();` is declaring an abstract method named `checkUpdate()` that
  /// returns a `Future` of `ApiResponse`. This means that any class that implements the
  /// `PublicRepository` abstract class must provide an implementation for this method, which should
  /// return a `Future` that resolves to an `ApiResponse` object.
  Future<ApiResponse> checkUpdate(CheckUpdateRequestModel request);
}
