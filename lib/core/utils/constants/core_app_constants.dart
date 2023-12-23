import '../enums/environment/environment_profile.dart';
import '../envs/app_environment.dart';

class CoreAppConstants {
  static const EnvironmentProfile environmentProfile = EnvironmentProfile.release;

  static bool get isTest => environmentProfile != EnvironmentProfile.release;

  static const String refreshTokenEndpoint = 'Login/RefreshToken';

  static const String guestRefreshTokenEndpoint = 'Login/GeneralRefreshToken';
}

AppEnvironment get kEnvironment => CoreAppConstants.environmentProfile.toEnvironment();
