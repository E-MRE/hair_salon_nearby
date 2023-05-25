import '../../utils/enums/global_error_key.dart';
import 'api_response.dart';

class ApiResponseModel<TData> extends ApiResponse<TData> with ApiResponseJsonKeyMixin<TData> {
  @override
  final TData? data;

  @override
  final String message;

  @override
  final int? statusCode;

  @override
  final bool success;

  final Object? error;

  ApiResponseModel.byDefault({
    this.data,
    this.statusCode,
    this.success = false,
    this.message = '',
    this.error,
  }) : super(data: data, message: message, statusCode: statusCode, success: success);

  ApiResponseModel({
    this.data,
    this.statusCode,
    required this.success,
    required this.message,
    this.error,
  }) : super(data: data, message: message, statusCode: statusCode, success: success);

  ApiResponseModel.success({required this.data, this.statusCode, this.message = ''})
      : success = true,
        error = null,
        super.success(data: data, message: message, statusCode: statusCode);

  ApiResponseModel.error({
    required this.message,
    Object? error,
    this.data,
    this.statusCode,
  })  : success = false,
        error = error ?? message,
        super.error(data: data, message: message, statusCode: statusCode);

  ApiResponseModel.emptyError({this.data, this.statusCode, Object? error, this.message = ''})
      : success = false,
        error = error ?? message,
        super.error(message: message, data: data, statusCode: statusCode);

  factory ApiResponseModel.fromJson(
    Map<String, dynamic> json, {
    required TEntity Function<TEntity>(Map<String, dynamic> json) parser,
    String defaultMessage = '',
    bool defaultSuccess = false,
    int? defaultStatusCode,
  }) {
    String message = defaultMessage;
    if (json.containsKey(ApiResponseJsonKeyMixin.messageKey)) {
      final value = json[ApiResponseJsonKeyMixin.messageKey];
      message = value is String ? value : message;
    }

    bool success = defaultSuccess;
    if (json.containsKey(ApiResponseJsonKeyMixin.successKey)) {
      final value = json[ApiResponseJsonKeyMixin.successKey];
      success = value is bool ? value : success;
    }

    int statusCode = defaultStatusCode ?? GlobalErrorKey.emptyStatusCode.value;
    if (json.containsKey(ApiResponseJsonKeyMixin.statusCodeKey)) {
      final value = json[ApiResponseJsonKeyMixin.statusCodeKey];
      statusCode = value is int ? value : statusCode;
    }

    Object? error;
    if (json.containsKey(ApiResponseJsonKeyMixin.errorKey)) {
      error = json[ApiResponseJsonKeyMixin.errorKey];
    }

    if (!json.containsKey(ApiResponseJsonKeyMixin.dataKey)) {
      //TODO: localize this message
      message.isEmpty ? message = 'Data is not found in the json' : null;
      return ApiResponseModel<TData>(success: success, message: message, statusCode: statusCode, error: error);
    }

    try {
      final data = json[ApiResponseJsonKeyMixin.dataKey];
      if (data is List && TData is List) {
        final list = data.map((element) => parser(element)).toList();
        if (list is! TData) {
          //TODO: localize this message
          throw Exception('${TData.runtimeType} is not ${list.runtimeType}');
        }

        return ApiResponseModel<TData>(
          data: list as TData,
          statusCode: statusCode,
          success: success,
          message: message,
          error: error,
        );
      }

      return ApiResponseModel<TData>(
        data: data == null ? null : parser(data),
        statusCode: statusCode,
        success: success,
        message: message,
        error: error,
      );
    } catch (exception) {
      //TODO: localize this message
      final message = 'Parse JSON Exception >>> ${exception}';
      throw Exception(message);
    }
  }
}
