import '../enums/environment/environment_profile.dart';
import '../envs/app_environment.dart';

class CoreAppConstants {
  static const EnvironmentProfile environmentProfile = EnvironmentProfile.release;

  static bool get isTest => environmentProfile != EnvironmentProfile.release;
}

AppEnvironment get kEnvironment => CoreAppConstants.environmentProfile.toEnvironment();
