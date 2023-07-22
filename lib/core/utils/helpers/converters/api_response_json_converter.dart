import '../../../services/models/api_response.dart';
import '../../../services/models/api_response_model.dart';
import '../../../services/models/friendly_message_model.dart';
import '../../../services/models/parameters/api_response_convert_parameter_model.dart';
import '../../enums/process_status.dart';
import 'response_json_converter.dart';

class ApiResponseJsonConverter<TData, TParams extends ApiResponseConvertParameterModel>
    extends ResponseJsonConverter<ApiResponseModel> {
  @override
  ApiResponseModel fromJson<TParams>(TParams otherParams) {
    FriendlyMessageModel friendlyMessage = FriendlyMessageModel(
      message: (otherParams as ApiResponseConvertParameterModel).defaultMessage,
    );

    final json = otherParams.json;

    if (json.containsKey(ApiResponseJsonKeyMixin.messageKey)) {
      final value = json[ApiResponseJsonKeyMixin.messageKey];
      if (value is Map<String, dynamic>) {
        friendlyMessage = FriendlyMessageModel.fromJson(value);
      }
    }

    ProcessStatus processStatus = ProcessStatus.undefined;
    if (json.containsKey(ApiResponseJsonKeyMixin.statusKey)) {
      final status = json[ApiResponseJsonKeyMixin.statusKey];
      processStatus = status is String ? status.toProcessStatus() : ProcessStatus.undefined;
    }

    if (!json.containsKey(ApiResponseJsonKeyMixin.dataKey)) {
      return ApiResponseModel<TData>(friendlyMessage: friendlyMessage, processStatus: processStatus);
    }

    try {
      final data = json[ApiResponseJsonKeyMixin.dataKey];
      if (data is List && TData is List) {
        final list = data.map((element) => otherParams.parser(element)).toList();
        if (list is! TData) {
          throw Exception('${TData.runtimeType} is not ${list.runtimeType}');
        }

        return ApiResponseModel<TData>(
          data: list as TData,
          processStatus: processStatus,
          friendlyMessage: friendlyMessage,
        );
      }

      return ApiResponseModel<TData>(
        data: data == null ? null : otherParams.parser(data),
        processStatus: processStatus,
        friendlyMessage: friendlyMessage,
      );
    } catch (exception) {
      final message = 'Parse JSON Exception >>> ${exception}';
      throw Exception(message);
    }
  }
}
