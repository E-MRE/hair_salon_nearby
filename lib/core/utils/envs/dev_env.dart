import 'package:envied/envied.dart';

import 'app_environment.dart';
import 'environment_field_key_mixin.dart';

part 'dev_env.g.dart';

@Envied(name: 'DevEnv', path: 'assets/envs/development.env', obfuscate: true)
class DevEnv extends AppEnvironment {
  @override
  @EnviedField(varName: EnvironmentFieldKeyMixin.baseUrlKey)
  final String baseUrl = _DevEnv.baseUrl;
}
