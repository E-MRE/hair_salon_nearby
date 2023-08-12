import '../../core/services/models/api_response.dart';
import '../../models/entity/onboarding_model.dart';

/// The `OnboardingRepository` class declares a method named `getList()` that returns a `Future` of
/// `ApiResponse` containing a list of `OnboardingModel` objects.
abstract class OnboardingRepository {
  /// The line `Future<ApiResponse<List<OnboardingModel>>> getList();` is declaring a method named
  /// `getList()` in the `OnboardingRepository` class.
  Future<ApiResponse<List<OnboardingModel>>> getList();
}
