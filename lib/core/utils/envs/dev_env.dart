import 'package:envied/envied.dart';

import 'app_environment.dart';
import 'environment_field_key_mixin.dart';

part 'dev_env.g.dart';

@Envied(name: 'DevEnv', path: 'assets/envs/development.env', obfuscate: true)
class DevEnv extends AppEnvironment {
  @override
  @EnviedField(varName: EnvironmentFieldKeyMixin.baseUrlKey)
  final String baseUrl = _DevEnv.baseUrl;

  @override
  @EnviedField(varName: EnvironmentFieldKeyMixin.clientIdKey)
  final String clientId = _DevEnv.clientId;

  @override
  @EnviedField(varName: EnvironmentFieldKeyMixin.clientSecretKey)
  final String clientSecret = _DevEnv.clientSecret;

  @override
  @EnviedField(varName: EnvironmentFieldKeyMixin.isLoggerActiveKey)
  final bool isLoggerActive = _DevEnv.isLoggerActive;

  @override
  @EnviedField(varName: EnvironmentFieldKeyMixin.isTestKey)
  final bool isTest = _DevEnv.isTest;
}
