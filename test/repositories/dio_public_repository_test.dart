import 'package:flutter_test/flutter_test.dart';
import 'package:hair_salon_nearby/core/services/abstract/dio_remote_data_service.dart';
import 'package:hair_salon_nearby/core/utils/enums/process_status.dart';
import 'package:hair_salon_nearby/core/utils/helpers/dependency/get_it_injection_container.dart';
import 'package:hair_salon_nearby/models/request/check_update_request_model.dart';
import 'package:hair_salon_nearby/repositories/abstracts/public_repository.dart';
import 'package:hair_salon_nearby/repositories/concretes/dio/dio_public_repository.dart';
import 'package:hair_salon_nearby/utils/enum/platform_type.dart';

import '../mocks/mock_remote_data_service.dart';

void main() {
  setUp(() {
    TestWidgetsFlutterBinding.ensureInitialized();
  });

  late PublicRepository repository;

  final request = CheckUpdateRequestModel(platform: PlatformType.android, version: '1.0.0');

  test('Success result with mock dataResult test', () async {
    final dataService = MockRemoteDataService(responseData: responseData, isSuccess: true);

    repository = DioPublicRepository(dataService: dataService);

    final response = await repository.checkUpdate(request);

    expect(response.success, true);
    expect(response.friendlyMessage, isNull);
    expect(response.processStatus, ProcessStatus.success);
    expect(response.data, isNull);
    expect(request.toJson().containsKey('version'), true);
    expect(request.toJson().containsKey('platform'), true);
  });

  test('Error result with mock dataResult test', () async {
    final dataService = MockRemoteDataService(responseData: null, isSuccess: false);

    repository = DioPublicRepository(dataService: dataService);

    final response = await repository.checkUpdate(
      CheckUpdateRequestModel(platform: PlatformType.android, version: '1.0.0'),
    );

    expect(response.success, false);
    expect(response.friendlyMessage, isNotNull);
    expect(response.processStatus, ProcessStatus.error);
    expect(response.data, isNull);
  });

  test('Success result with remote dataResult test', () async {
    GetItInjectionContainer.instance.injector.registerSingleton<DioRemoteDataService>(
      MockRemoteDataService(responseData: responseData, isSuccess: true),
    );

    repository = DioPublicRepository(
      dataService: GetItInjectionContainer.instance.injector.get<DioRemoteDataService>(),
    );

    final response = await repository.checkUpdate(
      CheckUpdateRequestModel(platform: PlatformType.android, version: '1.0.0'),
    );

    expect(response.success, true);
    expect(response.friendlyMessage, isNull);
    expect(response.processStatus, ProcessStatus.success);
    expect(response.data, isNull);

    GetItInjectionContainer.instance.injector.unregister<DioRemoteDataService>();
  });

  test('Error result with remote dataResult test', () async {
    GetItInjectionContainer.instance.injector.registerSingleton<DioRemoteDataService>(
      MockRemoteDataService(responseData: errorResponse, isSuccess: false),
    );

    repository = DioPublicRepository(
      dataService: GetItInjectionContainer.instance.injector.get<DioRemoteDataService>(),
    );

    final response = await repository.checkUpdate(
      CheckUpdateRequestModel(platform: PlatformType.android, version: '1.0.0'),
    );

    expect(response.success, false);
    expect(response.isNotSuccessOrDataNotExists, true);
    expect(response.friendlyMessage, isNotNull);
    expect(response.processStatus, ProcessStatus.error);
    expect(response.data, isNull);

    GetItInjectionContainer.instance.injector.unregister<DioRemoteDataService>();
  });
}

var errorResponse = {'processStatus': 'MajorUpdate', 'friendlyMessage': null, 'payload': null};
var responseData = {'processStatus': 'Success', 'friendlyMessage': null, 'payload': null};
