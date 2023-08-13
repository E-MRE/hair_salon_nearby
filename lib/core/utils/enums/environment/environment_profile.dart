import '../../envs/app_environment.dart';
import '../../envs/dev_env.dart';
import '../../envs/release_env.dart';

enum EnvironmentProfile {
  development,
  release;
}

extension EnvironmentProfileExtension on EnvironmentProfile {
  AppEnvironment toEnvironment() {
    switch (this) {
      case EnvironmentProfile.release:
        return ReleaseEnv();
      case EnvironmentProfile.development:
        return DevEnv();
    }
  }
}
