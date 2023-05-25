import 'package:easy_localization/easy_localization.dart';

import '../../../utils/constants/endpoint_constants.dart';
import '../../../utils/constants/lang/locale_keys.g.dart';
import '../../utils/results/data_result.dart';
import '../abstract/cache_service.dart';
import '../abstract/dio_remote_data_service.dart';
import '../abstract/token_service.dart';
import '../models/token_model.dart';
import '../models/token_request_model.dart';
import 'hive_cache_manager.dart';

class DioTokenManager extends TokenService {
  final CacheService _cacheService;
  CacheService get cacheService => _cacheService;

  DioRemoteDataService? _networkService;

  final String _getTokenError = LocaleKeys.token_getError.tr();

  DioTokenManager({DioRemoteDataService? networkService, CacheService? cacheService})
      : _cacheService = cacheService ?? HiveCacheManager.instance,
        _networkService = networkService;

  void setService(DioRemoteDataService service) => _networkService = service;

  @override
  Future<DataResult<TokenModel>> getTokenRemote({
    required RemoteTokenCallback remoteRequest,
    Map<String, dynamic>? body,
  }) async {
    try {
      final response = await remoteRequest(
        path: EndpointConstants.token,
        request: TokenRequestModel.clientInfo(),
        jsonParser: (json) => TokenModel.fromJson(json),
      );

      if (response.success && response.data != null) {
        setConstValuesByModel(response.data!);
        await saveTokenToLocale(response.data!);
        _networkService?.addBearerTokenToHeader(response.data!.accessToken ?? '');
        return DataResult.success(data: response.data);
      }

      final message = response.message.isEmpty ? _getTokenError : response.message;
      return DataResult.error(message: message);
    } catch (error) {
      return DataResult.error(message: error.toString());
    }
  }
}
