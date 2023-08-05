import '../../core/services/models/api_response.dart';
import '../../models/entity/auth_model.dart';
import '../../models/request/login_request_model.dart';

abstract class LoginRepository {
  /// The `login` method in the `LoginRepository` class is a function that takes a `LoginRequestModel`
  /// object as a parameter and returns a `Future` object that resolves to an `ApiResponse` object
  /// containing an `AuthModel` object. This method is responsible for performing the login operation
  /// and returning the authentication response.
  Future<ApiResponse<AuthModel>> login(LoginRequestModel request);
}
