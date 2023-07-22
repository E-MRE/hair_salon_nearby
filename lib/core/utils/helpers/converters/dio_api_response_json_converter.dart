import '../../../services/models/api_response.dart';
import '../../../services/models/dio_api_response_model.dart';
import '../../../services/models/friendly_message_model.dart';
import '../../../services/models/parameters/dio_api_response_convert_parameter_model.dart';
import '../../enums/process_status.dart';
import 'response_json_converter.dart';

class DioApiResponseJsonConverter<TResponse, TParams extends DioApiResponseConvertParameterModel<TResponse>>
    extends ResponseJsonConverter<DioApiResponseModel<TResponse>> {
  @override
  DioApiResponseModel<TResponse> fromJson<TParams>(TParams otherParams) {
    final response = (otherParams as DioApiResponseConvertParameterModel).response;

    if (response.data is! Map<String, dynamic>) {
      final data = otherParams.parser(response.data);
      return DioApiResponseModel<TResponse>(
        statusMessage: response.statusMessage ?? otherParams.defaultMessage ?? '',
        requestOptions: response.requestOptions,
        data: data is TResponse ? data : null,
        dioError: otherParams.dioErrorType,
        stackTrace: otherParams.stackTrace,
        statusCode: response.statusCode,
        isRedirect: response.isRedirect,
        redirects: response.redirects,
        headers: response.headers,
        extra: response.extra,
      );
    }

    final map = response.data as Map<String, dynamic>;

    var processStatus = ProcessStatus.undefined;
    if (map.containsKey(ApiResponseJsonKeyMixin.statusKey)) {
      final status = map[ApiResponseJsonKeyMixin.statusKey];
      if (status is String) {
        processStatus = status.toProcessStatus();
      }
    }

    FriendlyMessageModel? friendlyMessage;
    if (map.containsKey(ApiResponseJsonKeyMixin.messageKey)) {
      final messageJson = map[ApiResponseJsonKeyMixin.messageKey];
      if (messageJson is Map<String, dynamic>) {
        friendlyMessage = FriendlyMessageModel.fromJson(messageJson);
      }
    }

    if (map.containsKey(ApiResponseJsonKeyMixin.dataKey)) {
      final data = map[ApiResponseJsonKeyMixin.dataKey];
      final model = otherParams.parser(data);

      return DioApiResponseModel<TResponse>(
        statusMessage: response.statusMessage ?? otherParams.defaultMessage ?? '',
        requestOptions: response.requestOptions,
        data: model is TResponse ? model : null,
        stackTrace: otherParams.stackTrace,
        dioError: otherParams.dioErrorType,
        friendlyMessage: friendlyMessage,
        statusCode: response.statusCode,
        isRedirect: response.isRedirect,
        redirects: response.redirects,
        processStatus: processStatus,
        headers: response.headers,
        extra: response.extra,
      );
    }

    return DioApiResponseModel<TResponse>(
      statusMessage: response.statusMessage ?? otherParams.defaultMessage ?? '',
      requestOptions: response.requestOptions,
      stackTrace: otherParams.stackTrace,
      dioError: otherParams.dioErrorType,
      friendlyMessage: friendlyMessage,
      statusCode: response.statusCode,
      isRedirect: response.isRedirect,
      redirects: response.redirects,
      processStatus: processStatus,
      headers: response.headers,
      extra: response.extra,
    );
  }
}
