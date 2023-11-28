import '../../../core/services/models/token_model.dart';
import '../../../core/utils/enums/storage_keys.dart';
import '../../../core/utils/helpers/dependency/core_dependencies.dart';
import '../../../core/utils/helpers/token/token_context_helper_mixin.dart';
import 'app_start_initializer.dart';

class TokenContextAppStartInitializer extends AppStartInitializer with TokenContextHelperMixin {
  const TokenContextAppStartInitializer();

  @override
  void initialize() {
    final cachedToken = kCacheService.getValue<TokenModel>(StorageKeys.token);
    if (cachedToken.isNotSuccessOrDataNotExists) return;

    saveByTokenModel(kTokenContext, cachedToken.data!);
  }
}
