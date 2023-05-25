import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

import '../../errors/exceptions.dart';
import '../../utils/enums/duration_types.dart';
import '../../utils/enums/environment/dot_environment_type.dart';
import '../../utils/enums/headers.dart';
import '../../utils/mixins/http_status_code_controller_mixin.dart';
import '../../utils/results/data_result.dart';
import '../abstract/remote_data_service.dart';
import '../abstract/token_service.dart';
import '../constants/api_messages.dart';
import '../models/api_cancel_token.dart';
import '../models/api_request_model.dart';
import '../models/api_response.dart';
import '../models/api_response_model.dart';
import '../models/token_model.dart';
import '../models/token_request_model.dart';
import 'remote_token_manager.dart';

class HttpRemoteDataManager extends RemoteDataService with HttpStatusCodeControllerMixin {
  static HttpRemoteDataManager? _instance;

  final http.Client _client;
  final TokenService _tokenService;
  final String emptyJson = '{}';

  String _baseUrl = DotEnvironmentType.baseUrl.read();
  DurationTypes _timeout = DurationTypes.sixteenSeconds;
  Map<String, String> _header;

  static HttpRemoteDataManager getInstance({
    String? baseUrl,
    Map<String, String>? header,
    DurationTypes? timeout,
  }) {
    _instance ??= HttpRemoteDataManager._init(
      baseUrl: baseUrl,
      header: header,
      timeout: timeout,
    );
    return _instance!;
  }

  factory HttpRemoteDataManager({
    String? baseUrl,
    Map<String, String>? header,
    DurationTypes? timeout,
    TokenService? tokenService,
  }) {
    _instance ??= HttpRemoteDataManager._init(
      baseUrl: baseUrl,
      header: header,
      timeout: timeout,
      tokenService: tokenService,
    );

    return _instance!;
  }

  HttpRemoteDataManager._init({
    String? baseUrl,
    Map<String, String>? header,
    DurationTypes? timeout,
    TokenService? tokenService,
  })  : _baseUrl = baseUrl ?? DotEnvironmentType.baseUrl.read(),
        _header = header ?? Headers.applicationJson.rawValue(),
        _timeout = timeout ?? DurationTypes.sixteenSeconds,
        _tokenService = tokenService ?? RemoteTokenManager(),
        _client = http.Client();

  @override
  Future<Map<String, String>> get baseHeader async {
    var tokenResult = await _tokenService.getTokenAny(remoteRequest: _getTokenRemote);
    _header[HttpHeaders.contentTypeHeader] = 'application/json; charset=UTF-8';
    _header[HttpHeaders.authorizationHeader] = tokenResult.success ? 'Bearer ${tokenResult.data}' : '';
    return _header;
  }

  @override
  String get baseUrl => _baseUrl;

  @override
  Duration get getTimeout => _timeout.rawValue();

  @override
  void setUrl(String url) {
    _baseUrl = url;
  }

  @override
  void setHeader(Map<String, String> header) {
    _header = header;
  }

  @override
  void setTimeout(DurationTypes duration) {
    _timeout = duration;
  }

  @override
  void addBearerTokenToHeader(String token) {
    _header[HttpHeaders.authorizationHeader] = 'Bearer $token';
  }

  @override
  void addToHeader(String key, String value) {
    _header[key] = value;
  }

  @override
  void clearHeader() {
    _header.clear();
  }

  @override
  void removeHeader(String key) {
    _header.remove(key);
  }

  @override
  Future<ApiResponse<TResponse>> getData<TResponse>({
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
    final result = await _get(
      query: _getQuery(queryParameters),
      timeoutDuration: timeoutDuration,
      customBaseUrl: customBaseUrl,
      endpoint: endpoint,
      headers: headers,
    );

    final response = fromMap.call(jsonDecode(result.data?.body ?? emptyJson));

    return ApiResponseModel(
      data: response,
      success: result.success,
      message: result.message,
      statusCode: result.statusCode,
      error: result.success ? null : result.message,
    );
  }

  @override
  Future<ApiResponse<TResponse>> postData<TResponse>({
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
    var result = await _post(
      headers: headers,
      endpoint: endpoint,
      body: request.toJson(),
      customBaseUrl: customBaseUrl,
      timeoutDuration: timeoutDuration,
    );

    final response = fromMap?.call(jsonDecode(result.data?.body ?? emptyJson));

    return ApiResponseModel(
      data: response,
      success: result.success,
      message: result.message,
      statusCode: result.statusCode,
      error: result.success ? null : result.message,
    );
  }

  Future<DataResult<http.Response>> _post({
    required String endpoint,
    String? customBaseUrl,
    Object? body,
    Map<String, String>? headers,
    DurationTypes? timeoutDuration,
  }) async {
    try {
      var response = await _client
          .post(
            Uri.parse(_getUrl(customBaseUrl, endpoint, null)),
            headers: headers ?? await baseHeader,
            body: body,
          )
          .timeout(timeoutDuration?.rawValue() ?? getTimeout);

      return checkStatusCode(response.statusCode).success
          ? DataResult.success(data: response)
          : DataResult.error(data: response, message: ApiMessages.instance.OPERATION_FAILED);
    } on SocketException {
      return DataResult.error(message: ApiMessages.instance.NETWORK_ERROR);
    } on ServerException {
      return DataResult.error(message: ApiMessages.instance.INTERNAL_SERVER_ERROR);
    } on TimeoutException {
      return DataResult.error(message: ApiMessages.instance.TIMEOUT_ERROR);
    } catch (error) {
      return DataResult.error(message: error.toString());
    }
  }

  Future<DataResult<http.Response>> _get({
    required String endpoint,
    String? customBaseUrl,
    String? query,
    Map<String, String>? headers,
    DurationTypes? timeoutDuration,
  }) async {
    try {
      var response = await _client
          .get(
            Uri.parse(_getUrl(customBaseUrl, endpoint, query)),
            headers: headers ?? await baseHeader,
          )
          .timeout(timeoutDuration?.rawValue() ?? getTimeout);

      return response.statusCode == HttpStatus.ok
          ? DataResult.success(data: response)
          : DataResult.error(message: ApiMessages.instance.OPERATION_FAILED);
    } on SocketException {
      throw ConnectionException();
    } on ServerException {
      throw ServerException();
    } on TimeoutException {
      throw Exception(ApiMessages.instance.TIMEOUT_ERROR);
    } catch (error) {
      return DataResult.error(message: error.toString());
    }
  }

  Future<DataResult<TokenModel>> _getTokenRemote({
    required TokenModel Function(Map<String, dynamic> json) jsonParser,
    required String path,
    required TokenRequestModel request,
  }) async {
    final result = await postData<TokenModel>(
      endpoint: path,
      request: request,
      fromMap: (json) => jsonParser(json),
    );

    return DataResult(success: result.success, message: result.message, data: result.data);
  }

  String _getUrl(String? customBaseUrl, String endpoint, String? query) {
    return query?.isNotEmpty ?? false
        ? '${customBaseUrl ?? baseUrl}/$endpoint?$query'
        : '${customBaseUrl ?? baseUrl}/$endpoint';
  }

  String _getQuery(Map<String, dynamic>? query) {
    String value = '';
    if (query == null || query.isEmpty) return value;

    for (var entry in query.entries) {
      value += '${entry.key}=${entry.value}';
    }

    return value;
  }
}
