import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:hair_salon_nearby/utils/constants/lang/locale_keys.g.dart';

import '../../utils/constants/core_app_constants.dart';
import '../../utils/enums/duration_types.dart';
import '../../utils/enums/global_error_key.dart';
import '../../utils/enums/process_status.dart';
import '../../utils/enums/request_type.dart';
import '../../utils/helpers/converters/dio_api_response_json_converter.dart';
import '../../utils/mixins/http_status_code_controller_mixin.dart';
import '../abstract/dio_remote_data_service.dart';
import '../abstract/remote_data_service.dart';
import '../abstract/token_service.dart';
import '../constants/api_constants.dart';
import '../interceptors/token_expiration_interceptor.dart';
import '../models/api_cancel_token.dart';
import '../models/api_request_model.dart';
import '../models/dio_api_response.dart';
import '../models/dio_api_response_model.dart';
import '../models/friendly_message_model.dart';
import '../models/parameters/dio_api_response_convert_parameter_model.dart';

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
          baseUrl: kEnvironment.baseUrl,
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
    final responseJsonConverter = DioApiResponseJsonConverter<T, DioApiResponseConvertParameterModel<T>>();

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

      return responseJsonConverter.fromJson<DioApiResponseConvertParameterModel<T>>(
        DioApiResponseConvertParameterModel<T>(response: response, parser: (json) => fromMap?.call(json)),
      );
    } on DioException catch (error) {
      return responseJsonConverter.fromJson<DioApiResponseConvertParameterModel<T>>(
        DioApiResponseConvertParameterModel<T>(
          response: error.response ?? Response(requestOptions: error.requestOptions),
          parser: (json) => fromMap?.call(json),
          defaultMessage: _handleErrorMessage(error.type, error.message),
          stackTrace: error.stackTrace,
          dioErrorType: error.type,
        ),
      );
    } catch (exception) {
      return DioApiResponseModel<T>(
        friendlyMessage: FriendlyMessageModel(message: exception.toString()),
        statusCode: GlobalErrorKey.networkException.value,
        processStatus: ProcessStatus.undefined,
        statusMessage: exception.toString(),
        requestOptions: RequestOptions(),
        dioError: DioExceptionType.unknown,
        stackTrace: StackTrace.empty,
      );
    }
  }

  void _addTokenInterceptor(TokenService? tokenService) {
    getInterceptors.add(TokenExpirationInterceptor(tokenService: tokenService));
  }

  Options _createOptions({DurationTypes? timeout, Map<String, String>? headers}) {
    return getOptions.copyWith(
      headers: headers,
      receiveTimeout: timeout?.rawValue(),
      sendTimeout: timeout?.rawValue(),
    );
  }

  String _handleErrorMessage(DioExceptionType exceptionType, String? message) {
    if ([DioExceptionType.connectionError, DioExceptionType.receiveTimeout, DioExceptionType.sendTimeout]
        .contains(exceptionType)) {
      return LocaleKeys.apiMessage_timeoutError.tr();
    }

    return message ?? LocaleKeys.apiMessage_failed.tr();
  }
}
