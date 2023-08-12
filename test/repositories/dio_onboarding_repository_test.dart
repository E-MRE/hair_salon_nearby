import 'package:flutter_test/flutter_test.dart';
import 'package:hair_salon_nearby/core/services/abstract/dio_remote_data_service.dart';
import 'package:hair_salon_nearby/core/services/constants/api_constants.dart';
import 'package:hair_salon_nearby/core/utils/enums/process_status.dart';
import 'package:hair_salon_nearby/core/utils/helpers/dependency/get_it_injection_container.dart';
import 'package:hair_salon_nearby/models/entity/onboarding_model.dart';
import 'package:hair_salon_nearby/repositories/abstracts/onboarding_repository.dart';
import 'package:hair_salon_nearby/repositories/concretes/dio_onboarding_repository.dart';
import 'package:hair_salon_nearby/utils/enum/gender.dart';

import '../mocks/mock_remote_data_service.dart';

void main() {
  setUp(() {
    TestWidgetsFlutterBinding.ensureInitialized();
  });

  late OnboardingRepository repository;

  test('Success test', () async {
    final dataService = MockRemoteDataService(responseData: responseData, isSuccess: true);
    expect(dataService, isNotNull);

    repository = DioOnboardingRepository(dataService: dataService);

    final response = await repository.getList();
    expect(response.success, true);
    expect(response.isSuccessAndDataExists, true);
    expect(response.data, isNotNull);
    expect(response.data, isA<List<OnboardingModel>>());
    expect(response.data!.first.name, isNotNull);
    expect(response.data!.first.description, isNotNull);
    expect(response.data!.first.gender, isNotNull);
    expect(response.data!.first.imageUrl, isNotNull);
    expect(response.data!.first.theme, isNotNull);

    final model = response.data!.first.fromJson(responseData[1]);
    final theme = response.data!.first.theme!.fromJson(themeData);
    expect(model.name, isNotNull);
    expect(theme.primaryColor, '#000000');
    expect(theme.gender, isNotNull);
    expect(theme.gender!.toText(), Gender.woman.toText());
  });

  test('Error test', () async {
    final dataService = MockRemoteDataService(responseData: null, isSuccess: false);
    expect(dataService, isNotNull);
    expect(dataService.getTimeout, ApiConstants.defaultTimeout);

    repository = DioOnboardingRepository(dataService: dataService);

    final response = await repository.getList();
    expect(response.success, false);
    expect(response.isSuccessAndDataExists, false);
    expect(response.isNotSuccessOrDataNotExists, true);
    expect(response.data, isNull);
    expect(response.processStatus, ProcessStatus.error);
  });

  test('Success default remote test', () async {
    GetItInjectionContainer.instance.injector.registerLazySingleton<DioRemoteDataService>(
      () => MockRemoteDataService(responseData: responseData, isSuccess: true),
    );

    repository = DioOnboardingRepository.defaultRemote();

    final response = await repository.getList();

    GetItInjectionContainer.instance.injector.resetLazySingleton<DioRemoteDataService>();

    expect(response.success, true);
    expect(response.isSuccessAndDataExists, true);
    expect(response.data, isNotNull);
    expect(response.data, isA<List<OnboardingModel>>());
  });

  test('Error default remote test', () async {
    if (GetItInjectionContainer.instance.injector.isRegistered<DioRemoteDataService>()) {
      GetItInjectionContainer.instance.injector.unregister<DioRemoteDataService>();
    }

    GetItInjectionContainer.instance.injector.registerSingleton<DioRemoteDataService>(
      MockRemoteDataService(responseData: responseData, isSuccess: false),
    );

    repository = DioOnboardingRepository.defaultRemote();

    final response = await repository.getList();

    GetItInjectionContainer.instance.injector.unregister<DioRemoteDataService>();

    expect(response.success, false);
    expect(response.isSuccessAndDataExists, false);
    expect(response.data, isNull);
  });
}

var responseData = [
  {
    'name': 'MALE',
    'description': 'Çevrendeki en popüler erkek kuaförleri bir tık uzağında!',
    'imageUrl': 'http://52.207.241.142:5006/images/onboarding/men.png',
    'theme': {'gender': 0, 'colorOne': '#000000', 'colorTwo': '#111111', 'colorThree': '#222222'},
    'gender': 0
  },
  {
    'name': 'WOMEN',
    'description': 'Çevrendeki en popüler bayan kuaförleri bir tık uzağında!',
    'imageUrl': 'http://52.207.241.142:5006/images/onboarding/women.png',
    'theme': {'gender': 1, 'colorOne': '#000000', 'colorTwo': '#efd181', 'colorThree': '#222222'},
    'gender': 1
  }
];

var themeData = {'gender': 1, 'colorOne': '#000000', 'colorTwo': '#efd181', 'colorThree': '#222222'};
