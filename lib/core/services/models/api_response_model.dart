import 'api_response.dart';

class ApiResponseModel<TData> extends ApiResponse<TData> with ApiResponseJsonKeyMixin<TData> {
  ApiResponseModel({super.data, super.processStatus, super.friendlyMessage});
}
