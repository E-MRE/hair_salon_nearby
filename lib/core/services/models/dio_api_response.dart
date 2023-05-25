import 'package:dio/dio.dart';

import 'api_response.dart';

abstract class DioApiResponse<TResponse> extends Response<TResponse> implements ApiResponse<TResponse> {
  @override
  Object? get error;

  DioErrorType? get dioError;

  StackTrace? get stackTrace;

  @override
  bool get isSuccessAndDataExists => success && data != null;

  @override
  bool get isNotSuccessOrDataNotExists => !isSuccessAndDataExists;

  @override
  bool get isNotSuccess => !success;

  @override
  String get message => statusMessage ?? '';
  @override
  final bool success;

  DioApiResponse({
    required super.requestOptions,
    required String message,
    required this.success,
    super.data,
    super.extra,
    super.headers,
    super.isRedirect,
    super.redirects,
    super.statusCode,
  }) : super(statusMessage: message);
}
