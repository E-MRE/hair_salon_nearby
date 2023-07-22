import 'package:easy_localization/easy_localization.dart';
import 'package:hair_salon_nearby/core/utils/helpers/dependency/core_dependencies.dart';

import '../../../utils/constants/lang/locale_keys.g.dart';
import '../../utils/enums/caching_keys.dart';
import '../models/token_request_model.dart';
import '/core/services/models/token_model.dart';
import '/core/utils/results/data_result.dart';
import 'cache_service.dart';

typedef RemoteTokenCallback = Future<DataResult<TokenModel>> Function({
  required String path,
  required TokenRequestModel request,
  required TokenModel Function(Map<String, dynamic> json) jsonParser,
});

abstract class TokenService {
  final String _tokenNotFound = LocaleKeys.token_notFound.tr();
  final String _tokenExpired = LocaleKeys.token_expired.tr();

  CacheService get cacheService;

  Future<DataResult<TokenModel>> getTokenRemote({
    required RemoteTokenCallback remoteRequest,
    Map<String, dynamic>? body,
  });

  Future<DataResult<String>> getTokenLocale() async {
    if (kTokenContext.isTokenAvailable()) {
      return DataResult.success(data: kTokenContext.token);
    }

    final token = await cacheService.getValue<TokenModel>(CachingKeys.token);

    if (token == null) {
      return DataResult.error(message: _tokenNotFound);
    }

    final tokenAvailable = isTokenAvailable(token.getExpirationDate());

    if (tokenAvailable) {
      setConstValuesByModel(token);
      return DataResult.success(data: token.accessToken);
    }

    return DataResult.error(message: _tokenExpired);
  }

  Future<void> saveTokenToLocale(TokenModel tokenModel) async {
    await cacheService.setValue<TokenModel>(CachingKeys.token, tokenModel);
  }

  Future<DataResult<String>> getTokenAny({required RemoteTokenCallback remoteRequest}) async {
    final localeResult = await getTokenLocale();

    if (localeResult.success && (localeResult.data?.isNotEmpty ?? false)) {
      return DataResult.success(data: localeResult.data);
    }

    final remoteResult = await getTokenRemote(remoteRequest: remoteRequest);

    return DataResult(
      success: remoteResult.success,
      message: remoteResult.message,
      data: remoteResult.data?.accessToken,
    );
  }

  Future<String> getRefreshToken() async => '';

  bool isTokenAvailable(DateTime expirationDate) {
    var difference = DateTime.now().toUtc().difference(expirationDate).inSeconds;

    return difference < 0;
  }

  void setConstValuesByModel(TokenModel tokenModel) {
    //TODO: set by mixin
    kTokenContext.token = tokenModel.accessToken ?? '';
    kTokenContext.setTokenExpirationDate(tokenModel.acceptTokenExpiration);
  }
}
