import 'package:flutter_test/flutter_test.dart';
import 'package:hair_salon_nearby/core/services/abstract/dio_remote_data_service.dart';
import 'package:hair_salon_nearby/core/utils/enums/process_status.dart';
import 'package:hair_salon_nearby/core/utils/helpers/dependency/get_it_injection_container.dart';
import 'package:hair_salon_nearby/models/entity/theme_model.dart';
import 'package:hair_salon_nearby/repositories/abstracts/theme_repository.dart';
import 'package:hair_salon_nearby/repositories/concretes/dio_theme_repository.dart';

import '../mocks/mock_remote_data_service.dart';

void main() {
  setUp(() {
    TestWidgetsFlutterBinding.ensureInitialized();
  });

  late ThemeRepository repository;

  test('Get Themes mock remote data service test', () async {
    final dataService = MockRemoteDataService(responseData: responseData, isSuccess: true);

    repository = DioThemeRepository.remote(dataService: dataService);

    final response = await repository.getThemes();

    expect(response.success, true);
    expect(response.isSuccessAndDataExists, true);
    expect(response.isNotSuccess, false);
    expect(response.isNotSuccessOrDataNotExists, false);
    expect(response.processStatus, ProcessStatus.success);
    expect(response.data, isNotNull);
    expect(response.data, isA<List<ThemeModel>>());
  });

  test('Get Themes default remote data service test', () async {
    GetItInjectionContainer.instance.injector.registerSingleton<DioRemoteDataService>(
      MockRemoteDataService(responseData: responseData, isSuccess: true),
    );

    repository = DioThemeRepository.defaultRemote();

    final response = await repository.getThemes();

    expect(response.success, true);
    expect(response.isSuccessAndDataExists, true);
    expect(response.isNotSuccess, false);
    expect(response.isNotSuccessOrDataNotExists, false);
    expect(response.processStatus, ProcessStatus.success);
    expect(response.data, isNotNull);
    expect(response.data, isA<List<ThemeModel>>());
  });
}

var responseData = [
  {'gender': 0, 'colorOne': '#000000', 'colorTwo': '#111111', 'colorThree': '#222222'},
  {'gender': 1, 'colorOne': '#000000', 'colorTwo': '#efd181', 'colorThree': '#222222'}
];
