import 'package:dio/dio.dart';

import '../../utils/enums/global_error_key.dart';
import 'api_response.dart';
import 'dio_api_response.dart';

class DioApiResponseModel<TResponse> extends DioApiResponse<TResponse> {
  @override
  final DioErrorType? dioError;

  final Object? error;

  @override
  final String message;

  @override
  final StackTrace? stackTrace;

  DioApiResponseModel({
    required super.requestOptions,
    required super.success,
    required this.message,
    super.isRedirect,
    super.statusCode,
    super.redirects,
    this.stackTrace,
    super.headers,
    this.dioError,
    super.extra,
    this.error,
    super.data,
  }) : super(message: message);

  factory DioApiResponseModel.fromResponse(
    Response response,
    bool defaultSuccess, {
    Object? error,
    StackTrace? stackTrace,
    DioErrorType? dioErrorType,
    String? defaultMessage,
  }) {
    bool isEncapsuledByData = response.data is Map<String, dynamic> &&
        (response.data as Map<String, dynamic>).containsKey(ApiResponseJsonKeyMixin.dataKey);

    if (isEncapsuledByData) {
      final map = response.data as Map<String, dynamic>;
      final data = map[ApiResponseJsonKeyMixin.dataKey];
      final success = map[ApiResponseJsonKeyMixin.successKey];
      final statusCode = map[ApiResponseJsonKeyMixin.statusCodeKey];
      final message = map[ApiResponseJsonKeyMixin.messageKey];
      final error = map[ApiResponseJsonKeyMixin.errorKey];

      return DioApiResponseModel<TResponse>(
        message: message ?? defaultMessage ?? response.statusMessage ?? '',
        statusCode: statusCode ?? response.statusCode,
        data: data is TResponse ? data : null,
        requestOptions: response.requestOptions,
        isRedirect: response.isRedirect,
        redirects: response.redirects,
        success: success ?? defaultSuccess,
        headers: response.headers,
        dioError: dioErrorType,
        stackTrace: stackTrace,
        extra: response.extra,
        error: error,
      );
    }

    return DioApiResponseModel<TResponse>(
      error: error,
      data: response.data,
      extra: response.extra,
      dioError: dioErrorType,
      stackTrace: stackTrace,
      success: defaultSuccess,
      headers: response.headers,
      redirects: response.redirects,
      statusCode: response.statusCode,
      isRedirect: response.isRedirect,
      requestOptions: response.requestOptions,
      message: defaultMessage ?? response.statusMessage ?? '',
    );
  }

  factory DioApiResponseModel.fromDioError(DioError dioError) {
    final response = dioError.response ?? Response<TResponse>(requestOptions: dioError.requestOptions);

    bool isEncapsuledByData = response.data is Map<String, dynamic> &&
        (response.data as Map<String, dynamic>).containsKey(ApiResponseJsonKeyMixin.dataKey);

    if (isEncapsuledByData) {
      final map = response.data as Map<String, dynamic>;
      final data = map[ApiResponseJsonKeyMixin.dataKey];
      final success = map[ApiResponseJsonKeyMixin.successKey];
      final statusCode = map[ApiResponseJsonKeyMixin.statusCodeKey];
      final message = map[ApiResponseJsonKeyMixin.messageKey];
      final error = map[ApiResponseJsonKeyMixin.errorKey];

      return DioApiResponseModel<TResponse>(
        message: message ?? dioError.message ?? response.statusMessage ?? '',
        statusCode: statusCode ?? response.statusCode,
        requestOptions: response.requestOptions,
        data: data is TResponse ? data : null,
        stackTrace: dioError.stackTrace,
        isRedirect: response.isRedirect,
        error: error ?? dioError.error,
        redirects: response.redirects,
        success: success ?? false,
        headers: response.headers,
        dioError: dioError.type,
        extra: response.extra,
      );
    }

    return DioApiResponseModel<TResponse>(
      success: false,
      data: response.data,
      extra: response.extra,
      error: dioError.error,
      dioError: dioError.type,
      headers: response.headers,
      redirects: response.redirects,
      stackTrace: dioError.stackTrace,
      statusCode: response.statusCode,
      isRedirect: response.isRedirect,
      requestOptions: response.requestOptions,
      message: dioError.message ?? response.statusMessage ?? '',
    );
  }

  factory DioApiResponseModel.fromException(Object exception) {
    return DioApiResponseModel<TResponse>(
      success: false,
      error: exception,
      stackTrace: StackTrace.empty,
      message: exception.toString(),
      dioError: DioErrorType.unknown,
      requestOptions: RequestOptions(),
      statusCode: GlobalErrorKey.networkException.value,
    );
  }
}
