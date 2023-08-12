// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_test/flutter_test.dart';
import 'package:hair_salon_nearby/core/services/abstract/dio_remote_data_service.dart';
import 'package:hair_salon_nearby/core/services/models/refresh_token_request_model.dart';

import 'package:hair_salon_nearby/core/utils/enums/process_status.dart';
import 'package:hair_salon_nearby/core/utils/helpers/dependency/get_it_injection_container.dart';
import 'package:hair_salon_nearby/models/entity/auth_model.dart';
import 'package:hair_salon_nearby/models/request/login_request_model.dart';
import 'package:hair_salon_nearby/repositories/abstracts/login_repository.dart';
import 'package:hair_salon_nearby/repositories/concretes/dio_login_repository.dart';

import '../mocks/mock_remote_data_service.dart';

void main() {
  late LoginRepository loginRepository;

  setUp(() {
    TestWidgetsFlutterBinding.ensureInitialized();
  });

  test('Test login operation with verified account', () async {
    final dataService = MockRemoteDataService(responseData: authJson, isSuccess: true);

    final request = LoginRequestModel(email: 'email@gmail.com', password: 'password');

    loginRepository = DioLoginRepository(dataService: dataService);

    final response = await loginRepository.login(request);

    expect(response.success, true);
    expect(response.isNotSuccess, false);
    expect(response.isSuccessAndDataExists, true);
    expect(response.isNotSuccessOrDataNotExists, false);
    expect(response.data, isNotNull);
    expect(response.data, isA<AuthModel>());
    expect(response.processStatus, ProcessStatus.success);
    expect(response.data!.token, 'eyJhbGciOiJodHRwOi8vd3d3L');
    expect(response.data!.refreshToken, 'wV883JA1a00j9xb3M7KtZjO7F');
  });

  test('Test login operation with unverified account', () async {
    final dataService = MockRemoteDataService(responseData: authJson, isSuccess: false);

    final request = LoginRequestModel(email: 'email2@gmail.com', password: 'password1');

    loginRepository = DioLoginRepository(dataService: dataService);

    final response = await loginRepository.login(request);

    expect(response.success, false);
    expect(response.data, isNull);
    expect(response.processStatus, ProcessStatus.error);
  });

  test('Test refresh token operation account', () async {
    final dataService = MockRemoteDataService(responseData: authJson, isSuccess: true);

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

  test('Test login operation with verified account and default remote service', () async {
    GetItInjectionContainer.instance.injector.registerLazySingleton<DioRemoteDataService>(
      () => MockRemoteDataService(responseData: authJson, isSuccess: true),
    );

    final request = LoginRequestModel(email: 'email@gmail.com', password: 'password');

    loginRepository = DioLoginRepository.defaultRemote();

    final response = await loginRepository.login(request);

    expect(response.success, true);
    expect(response.isNotSuccess, false);
    expect(response.isSuccessAndDataExists, true);
    expect(response.isNotSuccessOrDataNotExists, false);
    expect(response.data, isNotNull);
    expect(response.data, isA<AuthModel>());
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
