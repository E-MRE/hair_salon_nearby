// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hair_salon_nearby/core/services/models/friendly_message_model.dart';
import 'package:hair_salon_nearby/core/services/models/refresh_token_request_model.dart';
import 'package:mockito/mockito.dart';

import 'package:hair_salon_nearby/core/services/abstract/dio_remote_data_service.dart';
import 'package:hair_salon_nearby/core/services/abstract/remote_data_service.dart';
import 'package:hair_salon_nearby/core/services/models/api_cancel_token.dart';
import 'package:hair_salon_nearby/core/services/models/api_request_model.dart';
import 'package:hair_salon_nearby/core/services/models/dio_api_response.dart';
import 'package:hair_salon_nearby/core/services/models/dio_api_response_model.dart';
import 'package:hair_salon_nearby/core/utils/enums/duration_types.dart';
import 'package:hair_salon_nearby/core/utils/enums/process_status.dart';
import 'package:hair_salon_nearby/models/entity/auth_model.dart';
import 'package:hair_salon_nearby/models/request/login_request_model.dart';
import 'package:hair_salon_nearby/repositories/abstracts/login_repository.dart';
import 'package:hair_salon_nearby/repositories/concretes/dio_login_repository.dart';

class MockRemoteDataService extends Mock implements DioRemoteDataService {
  final Map<String, dynamic> postDataJson;

  final bool isSuccess;

  MockRemoteDataService({required this.postDataJson, required this.isSuccess});

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
    if (isSuccess) {
      final model = fromMap?.call(postDataJson);
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
          title: 'Auth Error',
          message: 'Unverified user',
        ));
  }
}

void main() {
  late LoginRepository loginRepository;

  setUp(() {
    TestWidgetsFlutterBinding.ensureInitialized();
  });

  test('Test login operation with verified account', () async {
    final dataService = MockRemoteDataService(postDataJson: authJson, isSuccess: true);

    final request = LoginRequestModel(email: 'email@gmail.com', password: 'password');

    loginRepository = DioLoginRepository(dataService: dataService);

    final response = await loginRepository.login(request);

    expect(response.success, true);
    expect(response.data, isNotNull);
    expect(response.data, isA<AuthModel>());
    expect(response.processStatus, ProcessStatus.success);
    expect(response.data!.token, 'eyJhbGciOiJodHRwOi8vd3d3L');
    expect(response.data!.refreshToken, 'wV883JA1a00j9xb3M7KtZjO7F');
  });

  test('Test login operation with unverified account', () async {
    final dataService = MockRemoteDataService(postDataJson: authJson, isSuccess: false);

    final request = LoginRequestModel(email: 'email2@gmail.com', password: 'password1');

    loginRepository = DioLoginRepository(dataService: dataService);

    final response = await loginRepository.login(request);

    expect(response.success, false);
    expect(response.data, isNull);
    expect(response.processStatus, ProcessStatus.error);
  });

  test('Test refresh token operation account', () async {
    final dataService = MockRemoteDataService(postDataJson: authJson, isSuccess: true);

    final request = RefreshTokenRequestModel(
      token: authJson['token'] as String,
      refreshToken: authJson['refreshToken'] as String,
    );

    loginRepository = DioLoginRepository(dataService: dataService);

    final response = await loginRepository.refreshToken(request);

    expect(response.success, true);
    expect(response.data, isNotNull);
    expect(response.processStatus, ProcessStatus.success);
    expect(response.data!.token, 'eyJhbGciOiJodHRwOi8vd3d3L');
    expect(response.data!.refreshToken, 'wV883JA1a00j9xb3M7KtZjO7F');
  });
}

var authJson = {
  'token': 'eyJhbGciOiJodHRwOi8vd3d3L',
  'refreshToken': 'wV883JA1a00j9xb3M7KtZjO7F',
  'expirationDate': '2023-07-15T17:07:57.1140352+03:00',
  'refreshExpirationDate': '2023-07-15T17:11:57.1140406+03:00'
};
