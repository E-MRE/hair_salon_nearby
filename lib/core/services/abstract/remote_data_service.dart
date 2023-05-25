import '../../utils/enums/duration_types.dart';
import '../models/api_cancel_token.dart';
import '../models/api_request_model.dart';
import '../models/api_response.dart';

typedef ApiProgressCallback = void Function(int count, int total);

abstract class RemoteDataService {
  /* ******************************************************************* */
  /* ************************ GETTER -- SETTERS ************************ */
  /* ******************************************************************* */

  ///Base url for get and post data.
  String get baseUrl;

  ///API header
  Future<Map<String, dynamic>> get baseHeader;

  ///Gets timeout of http methods.
  Duration get getTimeout;

  ///Set base url of remote service with custom url.
  void setUrl(String url);

  ///Set remote service header with custom header
  void setHeader(Map<String, String> header);

  ///Set timeout of http methods.
  void setTimeout(DurationTypes duration);

  ///Add custom token to service header
  void addBearerTokenToHeader(String token);

  ///Add key and value to service header
  void addToHeader(String key, String value);

  void removeHeader(String key);

  void clearHeader();

  Future<ApiResponse<TResponse>> getData<TResponse>({
    required TResponse Function(dynamic data) fromMap,
    ApiProgressCallback? onReceiveProgress,
    Map<String, dynamic>? queryParameters,
    ApiProgressCallback? onSendProgress,
    DurationTypes? timeoutDuration,
    Map<String, String>? headers,
    ApiCancelToken? cancelToken,
    required String endpoint,
    String? customBaseUrl,
  });

  Future<ApiResponse<TResponse>> postData<TResponse>({
    TResponse Function(dynamic json)? fromMap,
    ApiProgressCallback? onReceiveProgress,
    Map<String, dynamic>? queryParameters,
    ApiProgressCallback? onSendProgress,
    required ApiRequestModel request,
    DurationTypes? timeoutDuration,
    Map<String, String>? headers,
    ApiCancelToken? cancelToken,
    required String endpoint,
    String? customBaseUrl,
  });

  List<TResponse> castFromJson<TResponse>(dynamic json, TResponse Function(Map<String, dynamic> json) fromJson) {
    if (json is List) {
      return json.map((item) => fromJson(item)).cast<TResponse>().toList();
    }

    return <TResponse>[];
  }
}
