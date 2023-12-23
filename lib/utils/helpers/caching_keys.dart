import '../../core/utils/enums/storage_keys.dart';

class CachingKeys implements StorageKeys {
  @override
  final String value;

  const CachingKeys._(this.value);

  static const onboarding = CachingKeys._('onboarding');
  static const cities = CachingKeys._('cities');
  static const authType = CachingKeys._('authType');
}
