import '../../services/abstract/cache_service.dart';
import '../../services/models/token_model.dart';

/// If you want to save any model to locale, you have to register by this mixin.
/// its example
///  if (!Hive.isAdapterRegistered(HiveKeys.user.value)) {
///       Hive.registerAdapter<AuthData>(AuthDataAdapter());
///     }
///
mixin HiveRegisterAdapterMixin on CacheService {
  void registerAdapters() {
    register<TokenModel>((json) => TokenModel.fromJson(json));
  }
}
