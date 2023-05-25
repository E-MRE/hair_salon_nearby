import '../../services/constants/api_messages.dart';
import '../../services/models/api_response.dart';
import '../enums/api_error_type.dart';
import '../results/data_result.dart';

mixin ErrorMessageByApiResponseMixin {
  String getErrorMessage({required ApiResponse response, String? defaultErrorMessage}) {
    if (response.success) return response.message;

    final message = _handleErrorMessages(message: response.message, defaultMessage: defaultErrorMessage);
    return message;
  }

  String getErrorMessageFromDataResult({required DataResult result, String? defaultErrorMessage}) {
    return result.success
        ? result.message
        : _handleErrorMessages(message: result.message, defaultMessage: defaultErrorMessage);
  }

  String _handleErrorMessages({String? message, String? defaultMessage}) {
    if (message == null || message.isEmpty) {
      return defaultMessage ?? ApiMessages.instance.OPERATION_FAILED;
    } else if (_isErrorContainsInMessage(message, ApiErrorType.statusError)) {
      return defaultMessage ?? ApiMessages.instance.OPERATION_FAILED;
    } else if (_isErrorContainsInMessage(message, ApiErrorType.timeout)) {
      return ApiMessages.instance.TIMEOUT_ERROR;
    } else if (_isErrorContainsInMessage(message, ApiErrorType.serverError)) {
      return ApiMessages.instance.INTERNAL_SERVER_ERROR;
    }

    return defaultMessage ?? ApiMessages.instance.OPERATION_FAILED;
  }

  bool _isErrorContainsInMessage(String message, ApiErrorType errorType) {
    for (var element in errorType.errorList) {
      if (message.contains(element)) {
        return true;
      }
    }

    return false;
  }
}
