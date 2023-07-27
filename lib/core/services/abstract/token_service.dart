import 'package:easy_localization/easy_localization.dart';
import 'package:hair_salon_nearby/core/utils/helpers/dependency/core_dependencies.dart';

import '../../utils/helpers/token/token_context_helper_mixin.dart';
import '/core/services/models/token_model.dart';
import '/core/utils/results/data_result.dart';
import '../../../utils/constants/lang/locale_keys.g.dart';
import '../../utils/enums/caching_keys.dart';
import '../../utils/helpers/token/token_context.dart';
import '../models/api_response.dart';
import '../models/refresh_token_request_model.dart';
import 'cache_service.dart';
import 'remote_data_service.dart';

abstract class TokenService with TokenContextHelperMixin {
  final String _tokenNotFound = LocaleKeys.token_notFound.tr();
  final String _tokenExpired = LocaleKeys.token_expired.tr();

  String get refreshTokenEndpoint => 'api/Login/RefreshToken';

  CacheService get cacheService;

  TokenContext get tokenContext;

  Future<DataResult<TokenModel>> getTokenRemote({Map<String, dynamic>? body}) async => DataResult.errorByEmpty();

  Future<DataResult<TokenModel>> getTokenLocale() async {
    if (tokenContext.isTokenAvailable()) {
      return DataResult.success(data: getTokenModelByContext(tokenContext));
    }

    final token = await cacheService.getValue<TokenModel>(CachingKeys.token);

    if (token == null) {
      return DataResult.error(message: _tokenNotFound);
    }

    if (isDateExpired(dateString: token.refreshExpirationDate)) {
      saveByTokenModel(tokenContext, token);
      return DataResult.success(data: token);
    }

    return DataResult.error(message: _tokenExpired);
  }

  Future<void> saveTokenToCache(TokenModel tokenModel) async {
    await cacheService.setValue<TokenModel>(CachingKeys.token, tokenModel);
  }

  Future<DataResult<TokenModel>> getTokenAny({RemoteDataService? dataService}) async {
    final localeResult = await getTokenLocale();

    if (localeResult.success && (localeResult.data?.token?.isNotEmpty ?? false)) {
      return DataResult.success(data: localeResult.data);
    }

    return await getRefreshToken(dataService: dataService);
  }

  Future<ApiResponse<TokenModel>> getRefreshToken({RemoteDataService? dataService}) async {
    final request = RefreshTokenRequestModel.byTokenContext(tokenContext: tokenContext);

    final response = await (dataService ?? kRemoteDataService).postData<TokenModel>(
      fromMap: (json) => TokenModel.fromJson(json),
      endpoint: refreshTokenEndpoint,
      request: request,
    );

    if (response.success && response.data != null) {
      saveByTokenModel(tokenContext, response.data!);
      await saveTokenToCache(response.data!);
    }

    return response;
  }
}
