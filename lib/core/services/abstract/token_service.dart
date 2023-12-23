import 'package:easy_localization/easy_localization.dart';
import 'package:hair_salon_nearby/core/utils/constants/core_app_constants.dart';
import 'package:hair_salon_nearby/utils/enum/auth_type.dart';
import 'package:hair_salon_nearby/utils/helpers/caching_keys.dart';

import '../../../utils/constants/lang/locale_keys.g.dart';
import '../../utils/enums/storage_keys.dart';
import '../../utils/helpers/dependency/core_dependencies.dart';
import '../../utils/helpers/token/token_context.dart';
import '../../utils/helpers/token/token_context_helper_mixin.dart';
import '../../utils/results/result.dart';
import '../models/api_response.dart';
import '../models/refresh_token_request_model.dart';
import '/core/services/models/token_model.dart';
import '/core/utils/results/data_result.dart';
import 'cache_service.dart';
import 'remote_data_service.dart';

abstract class TokenService with TokenContextHelperMixin {
  final String _tokenNotFound = LocaleKeys.token_notFound.tr();
  final String _tokenExpired = LocaleKeys.token_expired.tr();

  String get refreshTokenEndpoint => CoreAppConstants.refreshTokenEndpoint;

  String get guestRefreshTokenEndpoint => CoreAppConstants.guestRefreshTokenEndpoint;

  CacheService get cacheService;

  TokenContext get tokenContext;

  Future<DataResult<TokenModel>> getTokenRemote({Map<String, dynamic>? body}) async => DataResult.errorByEmpty();

  DataResult<TokenModel> getTokenLocale() {
    if (tokenContext.isTokenAvailable()) {
      return DataResult.success(data: getTokenModelByContext(tokenContext));
    }

    final tokenResult = cacheService.getValue<TokenModel>(StorageKeys.token);

    if (tokenResult.isNotSuccessOrDataNotExists) {
      return DataResult.error(message: _tokenNotFound);
    }

    //data is not null we checked before use
    if (isDateExpired(dateString: tokenResult.data!.refreshExpirationDate)) {
      saveByTokenModel(tokenContext, tokenResult.data!);
      return tokenResult;
    }

    return DataResult.error(message: _tokenExpired);
  }

  Result saveTokenToCache(TokenModel tokenModel) {
    return cacheService.setValue<TokenModel>(StorageKeys.token, tokenModel);
  }

  Future<DataResult<TokenModel>> getTokenAny({RemoteDataService? dataService}) async {
    final localeResult = getTokenLocale();

    if (localeResult.success && (localeResult.data?.token?.isNotEmpty ?? false)) {
      return DataResult.success(data: localeResult.data);
    }

    return await getRefreshToken(dataService: dataService);
  }

  Future<ApiResponse<TokenModel>> getRefreshToken({RemoteDataService? dataService}) async {
    final request = RefreshTokenRequestModel.byTokenContext(tokenContext: tokenContext);

    final authResult = cacheService.getValue<AuthType>(CachingKeys.authType, defaultValue: AuthType.emailPassword);
    final authType = authResult.data ?? AuthType.emailPassword;

    final response = await (dataService ?? kRemoteDataService).postData<TokenModel>(
      fromMap: (json) => TokenModel.fromJson(json),
      endpoint: authType == AuthType.emailPassword ? refreshTokenEndpoint : guestRefreshTokenEndpoint,
      request: request,
    );

    if (response.success && response.data != null) {
      saveByTokenModel(tokenContext, response.data!);
      await saveTokenToCache(response.data!);
    }

    return response;
  }
}
