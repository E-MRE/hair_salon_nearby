import '../../core/services/models/api_response.dart';
import '../../core/services/models/refresh_token_request_model.dart';
import '../../core/services/models/token_model.dart';
import '../../models/entity/auth_model.dart';
import '../../models/request/login_request_model.dart';

/// The `abstract class LoginRepository` is defining a contract for classes that will implement login
/// and refresh token operations. It declares two abstract methods: `login` and `refreshToken`. These
/// methods take specific request models as parameters and return `Future` objects that resolve to
/// `ApiResponse` objects containing authentication and token information respectively. Classes that
/// implement this interface will be responsible for providing the implementation details for these
/// methods.
abstract class LoginRepository {
  /// The `login` method in the `LoginRepository` class is a function that takes a `LoginRequestModel`
  /// object as a parameter and returns a `Future` object that resolves to an `ApiResponse` object
  /// containing an `AuthModel` object. This method is responsible for performing the login operation
  /// and returning the authentication response.
  Future<ApiResponse<AuthModel>> login(LoginRequestModel request);

  /// The `refreshToken` method in the `LoginRepository` class is a function that takes a
  /// `RefreshTokenRequestModel` object as a parameter and returns a `Future` object that resolves to an
  /// `ApiResponse` object containing a `TokenModel` object. This method is responsible for performing
  /// the refresh token operation and returning the response containing the new token.
  Future<ApiResponse<TokenModel>> refreshToken(RefreshTokenRequestModel request);
}
