import 'package:envied/envied.dart';

import 'app_environment.dart';
import 'environment_field_key_mixin.dart';

part 'release_env.g.dart';

@Envied(name: 'ReleaseEnv', path: 'assets/envs/release.env', obfuscate: true)
class ReleaseEnv extends AppEnvironment {
  @override
  @EnviedField(varName: EnvironmentFieldKeyMixin.baseUrlKey)
  final String baseUrl = _ReleaseEnv.baseUrl;
}
