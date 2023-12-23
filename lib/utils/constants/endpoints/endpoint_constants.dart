import 'package:hair_salon_nearby/core/utils/constants/core_app_constants.dart';

part 'login_endpoints.dart';
part 'onboarding_endpoints.dart';
part 'public_endpoints.dart';
part 'theme_endpoints.dart';
part 'register_endpoints.dart';
part 'city_endpoints.dart';

final class EndpointConstants {
  const EndpointConstants._init();

  static const _LoginEndpoints login = const _LoginEndpoints();
  static const _OnboardingEndpoints onboarding = const _OnboardingEndpoints();
  static const _PublicEndpoints public = const _PublicEndpoints();
  static const _ThemeEndpoints theme = const _ThemeEndpoints();
  static const _RegisterEndpoints register = const _RegisterEndpoints();
  static const _CityEndpoints city = const _CityEndpoints();
}
