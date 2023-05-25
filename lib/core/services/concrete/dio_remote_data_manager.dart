import 'package:dio/dio.dart';

import '../../utils/enums/duration_types.dart';
import '../../utils/enums/environment/dot_environment_type.dart';
import '../../utils/enums/request_type.dart';
import '../../utils/mixins/http_status_code_controller_mixin.dart';
import '../../utils/results/data_result.dart';
import '../abstract/dio_remote_data_service.dart';
import '../abstract/remote_data_service.dart';
import '../abstract/token_service.dart';
import '../constants/api_constants.dart';
import '../interceptors/token_expiration_interceptor.dart';
import '../models/api_cancel_token.dart';
import '../models/api_request_model.dart';
import '../models/dio_api_response.dart';
import '../models/dio_api_response_model.dart';
import '../models/token_model.dart';
import 'dio_token_manager.dart';

class DioRemoteDataManager extends DioRemoteDataService with HttpStatusCodeControllerMixin {
  DioRemoteDataManager.byOptions({
    required super.options,
    super.interceptors,
    super.isLoggerEnable,
    super.unAuthorizedErrorCallback,
    TokenService? tokenService,
  }) : super.byOptions() {
    {
      _addTokenInterceptor(tokenService);
    }
  }

  DioRemoteDataManager({
    required super.baseUrl,
    super.receiveTimeOut,
    super.sendTimeout,
    super.connectTimeout,
    super.interceptors,
    super.isLoggerEnable,
    super.unAuthorizedErrorCallback,
    TokenService? tokenService,
  }) {
    {
      _addTokenInterceptor(tokenService);
    }
  }

  DioRemoteDataManager.byDefault({
    super.isLoggerEnable,
    super.unAuthorizedErrorCallback,
    super.interceptors,
    TokenService? tokenService,
  }) : super(
          baseUrl: DotEnvironmentType.baseUrl.read(),
          connectTimeout: ApiConstants.defaultTimeout,
          receiveTimeOut: ApiConstants.defaultTimeout,
          sendTimeout: ApiConstants.defaultTimeout,
        ) {
    _addTokenInterceptor(tokenService);
  }

  @override
  Future<DioApiResponse<TResponse>> getData<TResponse>({
    required TResponse Function(dynamic data) fromMap,
    Map<String, dynamic>? queryParameters,
    ApiProgressCallback? onReceiveProgress,
    ApiProgressCallback? onSendProgress,
    DurationTypes? timeoutDuration,
    Map<String, String>? headers,
    ApiCancelToken? cancelToken,
    required String endpoint,
    String? customBaseUrl,
  }) async {
    return _futureRequest<TResponse>(
      fromMap: fromMap,
      cancelToken: cancelToken,
      requestType: RequestType.get,
      onSendProgress: onSendProgress,
      queryParameters: queryParameters,
      onReceiveProgress: onReceiveProgress,
      options: _createOptions(timeout: timeoutDuration, headers: headers),
      path: (customBaseUrl?.isEmpty ?? true) ? endpoint : '$customBaseUrl$endpoint',
    );
  }

  @override
  Future<DioApiResponse<TResponse>> postData<TResponse>({
    TResponse Function(dynamic json)? fromMap,
    ApiProgressCallback? onReceiveProgress,
    Map<String, dynamic>? queryParameters,
    ApiProgressCallback? onSendProgress,
    required ApiRequestModel request,
    DurationTypes? timeoutDuration,
    Map<String, String>? headers,
    ApiCancelToken? cancelToken,
    required String endpoint,
    String? customBaseUrl,
  }) async {
    return _futureRequest<TResponse>(
      fromMap: fromMap,
      data: request.toJson(),
      cancelToken: cancelToken,
      requestType: RequestType.post,
      onSendProgress: onSendProgress,
      queryParameters: queryParameters,
      onReceiveProgress: onReceiveProgress,
      options: _createOptions(timeout: timeoutDuration, headers: headers),
      path: (customBaseUrl?.isEmpty ?? true) ? endpoint : '$customBaseUrl$endpoint',
    );
  }

  Future<DioApiResponse<T>> _futureRequest<T>({
    T Function(dynamic json)? fromMap,
    Map<String, dynamic>? queryParameters,
    ProgressCallback? onReceiveProgress,
    ProgressCallback? onSendProgress,
    required RequestType requestType,
    CancelToken? cancelToken,
    required String path,
    Options? options,
    dynamic data,
  }) async {
    try {
      setOptions((options ?? getOptions).copyWith(method: requestType.value));

      final response = await getService.request(
        onReceiveProgress: onReceiveProgress,
        queryParameters: queryParameters,
        onSendProgress: onSendProgress,
        cancelToken: cancelToken,
        options: getOptions,
        data: data,
        path,
      );

      final statusCodeResult = checkStatusCode(response.statusCode ?? -1);

      if (statusCodeResult.success && response.data != null) {
        if (!isResponseSaltData(response.data)) {
          final isSuccess = statusCodeResult.success && response.data != null;
          return DioApiResponseModel.fromResponse(response, isSuccess);
        }

        final model = fromMap?.call(response.data);
        response.data = model;
      }

      return DioApiResponseModel.fromResponse(response, statusCodeResult.success);
    } on DioError catch (error) {
      return DioApiResponseModel.fromDioError(error);
    } catch (exception) {
      return DioApiResponseModel.fromException(exception);
    }
  }

  void _addTokenInterceptor(TokenService? tokenService) {
    getInterceptors.add(TokenExpirationInterceptor(
      tokenService: tokenService ?? DioTokenManager(),
      remoteTokenRequest: ({required jsonParser, required path, required request}) async {
        final result = await postData<TokenModel>(
          fromMap: (json) => jsonParser(json),
          request: request,
          endpoint: path,
        );

        return DataResult(success: result.success, message: result.message, data: result.data);
      },
    ));
  }

  Options _createOptions({DurationTypes? timeout, Map<String, String>? headers}) {
    return getOptions.copyWith(
      headers: headers,
      receiveTimeout: timeout?.rawValue(),
      sendTimeout: timeout?.rawValue(),
    );
  }
}