import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import '../../extensions/dio_options_extension.dart';
import '../../utils/enums/duration_types.dart';
import '../constants/api_constants.dart';
import '../interceptors/unauthorized_interceptor.dart';
import '../models/api_cancel_token.dart';
import '../models/api_request_model.dart';
import '../models/api_response.dart';
import '../models/dio_api_response.dart';
import 'remote_data_service.dart';

abstract class DioRemoteDataService extends RemoteDataService {
  late final Dio _service;
  late String _baseUrl;
  late Options _options;
  final bool isLoggerEnable;
  final UnAuthorizedErrorCallback? unAuthorizedErrorCallback;

  Interceptors get getInterceptors => getService.interceptors;
  Options get getOptions => _options;
  Dio get getService => _service;

  String get baseUrl => _baseUrl;

  Future<Map<String, dynamic>> get baseHeader async => _options.headers ?? _service.options.headers;

  Duration get getTimeout => _service.options.connectTimeout ?? _options.receiveTimeout ?? ApiConstants.defaultTimeout;

  DioRemoteDataService.byOptions({
    this.unAuthorizedErrorCallback,
    required BaseOptions options,
    Interceptors? interceptors,
    this.isLoggerEnable = kDebugMode,
  }) : _service = Dio(options) {
    _setOptionsByBaseOptions(options);
    _baseUrl = _service.options.baseUrl;
    _setInitialInterceptors(interceptors);
  }

  DioRemoteDataService({
    this.unAuthorizedErrorCallback,
    Interceptors? interceptors,
    this.isLoggerEnable = kDebugMode,
    required String baseUrl,
    Duration? receiveTimeOut,
    Duration? sendTimeout,
    Duration? connectTimeout,
  }) {
    _baseUrl = baseUrl;
    _service = Dio(BaseOptions(baseUrl: baseUrl));
    _service.options.sendTimeout = sendTimeout;
    _service.options.connectTimeout = connectTimeout;
    _service.options.receiveTimeout = receiveTimeOut;
    _setOptionsByBaseOptions(_service.options);
    _setInitialInterceptors(interceptors);
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
  });

  @override
  Future<DioApiResponse<TResponse>> postData<TResponse>({
    TResponse Function(dynamic json)? fromMap,
    Map<String, dynamic>? queryParameters,
    ApiProgressCallback? onReceiveProgress,
    ApiProgressCallback? onSendProgress,
    required ApiRequestModel request,
    DurationTypes? timeoutDuration,
    Map<String, String>? headers,
    ApiCancelToken? cancelToken,
    required String endpoint,
    String? customBaseUrl,
  });

  ///Set base url of remote service with custom url.
  void setUrl(String url) {
    getService.options.baseUrl = url;
  }

  ///Set remote service header with custom header
  void setHeader(Map<String, String> header) {
    setOptions(getOptions.copyWith(headers: header));
  }

  ///Set timeout of http methods.
  void setTimeout(DurationTypes duration) {
    setOptions(getOptions.copyWith(receiveTimeout: duration.rawValue(), sendTimeout: duration.rawValue()));
  }

  ///Add custom token to service header
  void addBearerTokenToHeader(String token) {
    final fixedToken = token.toLowerCase().contains('bearer') ? token : 'Bearer $token';
    getOptions.headers?[HttpHeaders.authorizationHeader] = fixedToken;
    getService.options.headers[HttpHeaders.authorizationHeader] = fixedToken;
  }

  ///Add key and value to service header
  void addToHeader(String key, String value) {
    getOptions.headers?[key] = value;
    getService.options.headers[key] = value;
  }

  void clearHeader() {
    getOptions.headers?.clear();
    getService.options.headers.clear();
  }

  void removeHeader(String key) {
    getOptions.headers?.remove(key);
    getService.options.headers.remove(key);
  }

  bool isResponseSaltData(dynamic json) {
    bool isList = json != null && json is List;
    bool isNotExistsDataKey = json is Map<String, dynamic> && !json.containsKey(ApiResponseJsonKeyMixin.dataKey);

    return isList || isNotExistsDataKey;
  }

  void setOptions(Options options) {
    _options = options;
    getService.options = options.toBaseOptions(
      baseUrl: baseUrl,
      queryParameters: getService.options.queryParameters,
      persistentConnection: getService.options.persistentConnection,
    );
  }

  void _setOptionsByBaseOptions(BaseOptions? options) {
    _options = (options ?? BaseOptions()).toOptions();
  }

  void _setInitialInterceptors(Interceptors? interceptors) {
    interceptors == null ? null : getInterceptors.addAll(interceptors);

    if (unAuthorizedErrorCallback != null) {
      _service.interceptors.add(UnAuthorizedInterceptor(unAuthorizedErrorCallback!));
    }

    isLoggerEnable ? _service.interceptors.add(LogInterceptor()) : null;
  }
}
