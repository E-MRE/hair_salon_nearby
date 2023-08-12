import 'package:dio/dio.dart';
import 'package:hair_salon_nearby/core/services/abstract/dio_remote_data_service.dart';
import 'package:hair_salon_nearby/core/services/abstract/remote_data_service.dart';
import 'package:hair_salon_nearby/core/services/constants/api_constants.dart';
import 'package:hair_salon_nearby/core/services/interceptors/unauthorized_interceptor.dart';
import 'package:hair_salon_nearby/core/services/models/api_cancel_token.dart';
import 'package:hair_salon_nearby/core/services/models/api_request_model.dart';
import 'package:hair_salon_nearby/core/services/models/dio_api_response.dart';
import 'package:hair_salon_nearby/core/services/models/dio_api_response_model.dart';
import 'package:hair_salon_nearby/core/services/models/friendly_message_model.dart';
import 'package:hair_salon_nearby/core/utils/enums/duration_types.dart';
import 'package:hair_salon_nearby/core/utils/enums/process_status.dart';
import 'package:mockito/mockito.dart';

class MockRemoteDataService extends Mock implements DioRemoteDataService {
  final dynamic responseData;

  final bool isSuccess;

  MockRemoteDataService({required this.responseData, required this.isSuccess});

  @override
  Future<DioApiResponse<TResponse>> postData<TResponse>({
    TResponse Function(dynamic json)? fromMap,
    Map<String, dynamic>? queryParameters,
    ApiProgressCallback? onReceiveProgress,
    ApiProgressCallback? onSendProgress,
    required ApiRequestModel request,
    DurationTypes? timeoutDuration,
    Map<String, String>? headers,
    ApiCancelToken? cancelToken,
    required String endpoint,
    String? customBaseUrl,
  }) async {
    await Future.delayed(Duration.zero);
    if (isSuccess) {
      final model = fromMap?.call(responseData);
      return DioApiResponseModel(
        requestOptions: RequestOptions(),
        data: model,
        processStatus: model != null ? ProcessStatus.success : ProcessStatus.error,
        statusCode: model != null ? 200 : 400,
      );
    }

    return DioApiResponseModel(
        requestOptions: RequestOptions(),
        processStatus: ProcessStatus.error,
        statusCode: 400,
        dioError: DioErrorType.badResponse,
        friendlyMessage: FriendlyMessageModel(
          title: 'Error',
          message: 'Error message',
        ));
  }

  @override
  Future<DioApiResponse<TResponse>> getData<TResponse>({
    required TResponse Function(dynamic data) fromMap,
    Map<String, dynamic>? queryParameters,
    ApiProgressCallback? onReceiveProgress,
    ApiProgressCallback? onSendProgress,
    DurationTypes? timeoutDuration,
    Map<String, String>? headers,
    ApiCancelToken? cancelToken,
    required String endpoint,
    String? customBaseUrl,
  }) async {
    await Future.delayed(Duration.zero);
    if (isSuccess) {
      final model = fromMap.call(responseData);
      return DioApiResponseModel(
        requestOptions: RequestOptions(),
        data: model,
        processStatus: model != null ? ProcessStatus.success : ProcessStatus.error,
        statusCode: model != null ? 200 : 400,
      );
    }

    return DioApiResponseModel(
        requestOptions: RequestOptions(),
        processStatus: ProcessStatus.error,
        statusCode: 400,
        dioError: DioErrorType.badResponse,
        friendlyMessage: FriendlyMessageModel(
          title: 'Error',
          message: 'Error message',
        ));
  }

  @override
  void addBearerTokenToHeader(String token) {}

  @override
  void addToHeader(String key, String value) {}

  @override
  // TODO: implement baseHeader
  Future<Map<String, dynamic>> get baseHeader async => {};

  @override
  String get baseUrl => 'www.google.com';

  @override
  List<TResponse> castFromJson<TResponse>(dynamic json, TResponse Function(Map<String, dynamic> json) fromJson) {
    return [];
  }

  @override
  void clearHeader() {}

  @override
  Interceptors get getInterceptors => Interceptors();

  @override
  Options get getOptions => Options();

  @override
  Dio get getService => Dio();

  @override
  Duration get getTimeout => ApiConstants.defaultTimeout;

  @override
  bool get isLoggerEnable => true;

  @override
  bool isResponseSaltData(json) {
    return true;
  }

  @override
  void removeHeader(String key) {}

  @override
  void setHeader(Map<String, String> header) {}

  @override
  void setOptions(Options options) {}

  @override
  void setTimeout(DurationTypes duration) {}

  @override
  void setUrl(String url) {}

  @override
  UnAuthorizedErrorCallback? get unAuthorizedErrorCallback => throw UnimplementedError();
}
