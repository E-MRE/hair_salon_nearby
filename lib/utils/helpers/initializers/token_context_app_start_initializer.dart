import '../../../core/services/models/token_model.dart';
import '../../../core/utils/enums/caching_keys.dart';
import '../../../core/utils/helpers/dependency/core_dependencies.dart';
import '../../../core/utils/helpers/token/token_context_helper_mixin.dart';
import 'app_start_initializer.dart';

class TokenContextAppStartInitializer extends FutureAppStartInitializer with TokenContextHelperMixin {
  const TokenContextAppStartInitializer();

  @override
  Future<void> initialize() async {
    final cachedToken = await kCacheService.getValue<TokenModel>(CachingKeys.token);

    if (cachedToken == null) return;

    saveByTokenModel(kTokenContext, cachedToken);
  }
}
