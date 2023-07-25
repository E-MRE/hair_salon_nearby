import 'package:easy_localization/easy_localization.dart';

import '../../../utils/constants/endpoint_constants.dart';
import '../../../utils/constants/lang/locale_keys.g.dart';
import '../../utils/helpers/dependency/core_dependencies.dart';
import '../../utils/results/data_result.dart';
import '../abstract/cache_service.dart';
import '../abstract/remote_data_service.dart';
import '../abstract/token_service.dart';
import '../models/token_model.dart';
import '../models/token_request_model.dart';

class RemoteTokenManager extends TokenService {
  @override
  final CacheService cacheService;

  final RemoteDataService? dataService;

  final String _getTokenError = LocaleKeys.token_getError.tr();

  RemoteTokenManager({CacheService? cacheService, this.dataService}) : cacheService = cacheService ?? kCacheService;

  @override
  Future<DataResult<TokenModel>> getTokenRemote({
    required RemoteTokenCallback remoteRequest,
    Map<String, dynamic>? body,
  }) async {
    try {
      final response = await remoteRequest(
        path: EndpointConstants.token,
        request: TokenRequestModel.clientInfo(),
        jsonParser: (_) => TokenModel(),
      );

      if (response.success && response.data != null) {
        setConstValuesByModel(response.data!);
        await saveTokenToLocale(response.data!);
        dataService?.addBearerTokenToHeader(response.data!.accessToken ?? '');
        return DataResult.success(data: response.data);
      }

      final message = response.message.isEmpty ? _getTokenError : response.message;
      return DataResult.error(message: message);
    } catch (error) {
      return DataResult.error(message: error.toString());
    }
  }
}
