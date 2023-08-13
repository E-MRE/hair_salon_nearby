import 'package:envied/envied.dart';

import 'app_environment.dart';
import 'environment_field_key_mixin.dart';

part 'release_env.g.dart';

@Envied(name: 'ReleaseEnv', path: 'assets/envs/release.env', obfuscate: true)
class ReleaseEnv extends AppEnvironment {
  @override
  @EnviedField(varName: EnvironmentFieldKeyMixin.baseUrlKey)
  final String baseUrl = _ReleaseEnv.baseUrl;

  @override
  @EnviedField(varName: EnvironmentFieldKeyMixin.clientIdKey)
  final String clientId = _ReleaseEnv.clientId;

  @override
  @EnviedField(varName: EnvironmentFieldKeyMixin.clientSecretKey)
  final String clientSecret = _ReleaseEnv.clientSecret;

  @override
  @EnviedField(varName: EnvironmentFieldKeyMixin.isLoggerActiveKey)
  final bool isLoggerActive = _ReleaseEnv.isLoggerActive;

  @override
  @EnviedField(varName: EnvironmentFieldKeyMixin.isTestKey)
  final bool isTest = _ReleaseEnv.isTest;
}
