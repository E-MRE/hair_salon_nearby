import 'package:dio/dio.dart';

import '../../utils/enums/process_status.dart';
import 'api_response.dart';
import 'friendly_message_model.dart';

abstract class DioApiResponse<TResponse> extends Response<TResponse> implements ApiResponse<TResponse> {
  final DioErrorType? dioError;

  final StackTrace? stackTrace;

  @override
  bool get isNotSuccessOrDataNotExists => !isSuccessAndDataExists;

  @override
  final String message;

  @override
  final FriendlyMessageModel? friendlyMessage;

  @override
  bool get isNotSuccess => !success;

  @override
  bool get isSuccessAndDataExists => success && data != null;

  @override
  final ProcessStatus? processStatus;

  @override
  bool get success => (processStatus ?? ProcessStatus.undefined) == ProcessStatus.success;

  DioApiResponse({
    required super.requestOptions,
    String? statusMessage,
    this.friendlyMessage,
    this.processStatus,
    super.isRedirect,
    super.statusCode,
    super.redirects,
    this.stackTrace,
    super.headers,
    this.dioError,
    super.extra,
    super.data,
  })  : message = friendlyMessage?.message ?? statusMessage ?? '',
        super(statusMessage: friendlyMessage?.message ?? statusMessage ?? '');
}
