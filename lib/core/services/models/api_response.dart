import '../../utils/results/data_result.dart';

abstract class ApiResponse<TResponse> extends DataResult<TResponse> {
  @override
  TResponse? get data;
  @override
  int? get statusCode;
  @override
  String get message;
  @override
  bool get success;

  Object? get error;

  ApiResponse.success({super.data, super.statusCode, super.message}) : super.success();

  ApiResponse.error({required super.message, super.data, super.statusCode}) : super.error();

  ApiResponse({
    required super.data,
    required super.message,
    required super.statusCode,
    required super.success,
  }) : super();
}

//TODO-INITIAL-PROJECT: Check Response json keys & update with yours.
mixin ApiResponseJsonKeyMixin<TResponse> on ApiResponse<TResponse> {
  static const String dataKey = 'data';
  static const String messageKey = 'message';
  static const String successKey = 'success';
  static const String errorKey = 'error';
  static const String statusCodeKey = 'statusCode';
}
