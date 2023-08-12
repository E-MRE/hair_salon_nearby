import '../../core/services/models/api_response.dart';
import '../../models/entity/theme_model.dart';

/// The `ThemeRepository` class declares a method `getThemes()` that returns a `Future` object resolving
/// to an `ApiResponse` containing a list of `ThemeModel` objects.
abstract class ThemeRepository {
  /// The `getThemes()` method is declaring a function signature that returns a `Future` object. The
  /// `Future` object represents a potential value or error that will be available at some point in the
  /// future. In this case, the `Future` object will resolve to an `ApiResponse` object that contains a
  /// list of `ThemeModel` objects.
  Future<ApiResponse<List<ThemeModel>>> getThemes();
}
