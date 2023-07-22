import 'dio_api_response.dart';

class DioApiResponseModel<TResponse> extends DioApiResponse<TResponse> {
  DioApiResponseModel({
    required super.requestOptions,
    super.isRedirect,
    super.statusCode,
    super.redirects,
    super.stackTrace,
    super.headers,
    super.dioError,
    super.extra,
    super.data,
    super.friendlyMessage,
    super.processStatus,
    super.statusMessage,
  });
}
