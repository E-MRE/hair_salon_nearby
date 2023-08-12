import '../../core/services/models/api_response.dart';
import '../../models/entity/user_model.dart';
import '../../models/request/register_request_model.dart';

/// The RegisterRepository class is an abstract class that defines a method for registering a user and
/// returns an ApiResponse containing a UserModel.
abstract class RegisterRepository {
  /// The `registerUser` method is a function declaration that takes a `RegisterRequestModel` object as
  /// a parameter and returns a `Future` object that resolves to an `ApiResponse` object containing a
  /// `UserModel`.
  Future<ApiResponse<UserModel>> registerUser(RegisterRequestModel request);
}
