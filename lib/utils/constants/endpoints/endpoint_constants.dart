part 'login_endpoints.dart';
part 'onboarding_endpoints.dart';
part 'public_endpoints.dart';
part 'theme_endpoints.dart';

final class EndpointConstants {
  const EndpointConstants._init();

  static const _LoginEndpoints login = const _LoginEndpoints();
  static const _OnboardingEndpoints onboarding = const _OnboardingEndpoints();
  static const _PublicEndpoints public = const _PublicEndpoints();
  static const _ThemeEndpoints theme = const _ThemeEndpoints();
}
