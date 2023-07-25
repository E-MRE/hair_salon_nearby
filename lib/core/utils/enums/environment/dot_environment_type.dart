import 'package:flutter_dotenv/flutter_dotenv.dart';

import '../../../extensions/string_to_bool_extension.dart';

/**
 * That enum using for access to the value of environments. 
 * For get value just choose a enum and call `[read]` method.
 * If your value is boolean so you can easily call `[readBool]` method.
 */
enum DotEnvironmentType {
  baseUrl('BASE_URL'),
  mainUrl('MAIN_URL'),
  clientId('CLIENT_ID'),
  clientSecret('CLIENT_SECRET'),
  isLoggerActive('IS_LOGGER_ACTIVE');

  final String key;
  const DotEnvironmentType(this.key);

  String read({String? fallback}) {
    return dotenv.get(key, fallback: fallback);
  }

  bool readBool({String? fallback}) {
    final stringValue = dotenv.get(key, fallback: fallback);
    return stringValue.toBool();
  }
}
