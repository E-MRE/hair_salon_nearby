import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hair_salon_nearby/core/services/abstract/cache_service.dart';
import 'package:hair_salon_nearby/core/services/abstract/remote_data_service.dart';
import 'package:hair_salon_nearby/core/services/abstract/token_service.dart';
import 'package:hair_salon_nearby/core/services/concrete/dio_token_manager.dart';
import 'package:hair_salon_nearby/core/services/constants/hive_constants.dart';
import 'package:hair_salon_nearby/core/services/models/api_response.dart';
import 'package:hair_salon_nearby/core/services/models/dio_api_response_model.dart';
import 'package:hair_salon_nearby/core/services/models/token_model.dart';
import 'package:hair_salon_nearby/core/utils/enums/caching_keys.dart';
import 'package:hair_salon_nearby/core/utils/enums/environment/environment_profile.dart';
import 'package:hair_salon_nearby/core/utils/enums/process_status.dart';
import 'package:hair_salon_nearby/core/utils/helpers/dependency/core_dependencies.dart';
import 'package:hair_salon_nearby/core/utils/helpers/dependency/get_it_injection_container.dart';
import 'package:hair_salon_nearby/core/utils/helpers/token/token_context.dart';
import 'package:hair_salon_nearby/core/utils/helpers/token/token_context_helper_mixin.dart';
import 'package:hair_salon_nearby/core/utils/results/data_result.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:mockito/mockito.dart';

class MockTokenModel extends Mock implements TokenModel {
  @override
  String? get token => 'XYZ';

  @override
  String? get refreshToken => 'ABC';
}

class MockCacheManager extends Mock implements CacheService {}

class MockTokenContext extends Mock implements TokenContext {}

class MockTokenManager extends Mock with TokenContextHelperMixin implements DioTokenManager {
  @override
  final CacheService cacheService;

  MockTokenManager(this.cacheService, this.tokenContext);

  @override
  final TokenContext tokenContext;

  @override
  Future<DataResult<TokenModel>> getTokenAny({RemoteDataService? dataService}) async {
    return await getRefreshToken();
  }

  @override
  Future<ApiResponse<TokenModel>> getRefreshToken({RemoteDataService? dataService}) {
    return Future.value(
      DioApiResponseModel(
        requestOptions: RequestOptions(),
        processStatus: ProcessStatus.success,
        data: tokenModel,
      ),
    );
  }
}

class ErrorRemoteMockTokenManager extends DioTokenManager {
  @override
  Future<ApiResponse<TokenModel>> getRefreshToken({RemoteDataService? dataService}) {
    return Future.value(DioApiResponseModel(requestOptions: RequestOptions(), processStatus: ProcessStatus.error));
  }
}

var tokenModel = TokenModel(
  token: 'token',
  refreshToken: 'refreshToken',
  expirationDate: DateTime.now().add(const Duration(hours: 1)).toIso8601String(),
  refreshExpirationDate: DateTime.now().add(const Duration(hours: 1)).toIso8601String(),
);

void main() {
  late TokenService tokenService;

  setUp(() async {
    TestWidgetsFlutterBinding.ensureInitialized();
    Hive.init('database');
    await dotenv.load(fileName: EnvironmentProfile.test.path);
    GetItInjectionContainer.instance.register();
    tokenService = DioTokenManager();

    if (!Hive.isAdapterRegistered(HiveConstants.token)) {
      Hive.registerAdapter<TokenModel>(TokenModelAdapter());
    }
  });
  tearDown(() {
    dotenv.clean();
  });

  test('Get Error result when call remote token method test', () async {
    final result = await tokenService.getTokenRemote();
    expect(result.success, false);
    expect(result.data, isNull);
    expect(result.message.isEmpty, true);
  });

  group('Test all methods of DioTokenManager', () {
    test('DateTime(1) is expired test', () {
      final dateString = DateTime(1).toIso8601String();
      expect(tokenService.isDateExpired(dateString: dateString), true);
    });

    test('Invalid date is expired test', () {
      final dateString = 'DateTime(1).toIso8601String()';
      expect(tokenService.isDateExpired(dateString: dateString), true);
    });

    test('DateTime.now() is expired test', () {
      final dateString = DateTime.now().toIso8601String();
      expect(tokenService.isDateExpired(dateString: dateString), false);
    });

    test('negative delay seconds assertion test', () {
      final dateString = DateTime.now().toIso8601String();
      expect(
        () => tokenService.isDateExpired(dateString: dateString, delaySeconds: -1),
        throwsA(isA<AssertionError>()),
      );
    });
  });

  group('Get local token tests', () {
    test('Get local token test', () async {
      await tokenService.cacheService.deleteValue<TokenModel>(CachingKeys.token);
      final result = await tokenService.getTokenLocale();
      expect(result.success, false);
      expect(result.data, isNull);
    });

    test('Add firstly a token to local and get local token test', () async {
      await tokenService.saveTokenToCache(MockTokenModel());
      final result = await tokenService.getTokenLocale();
      expect(result.success, true);
      expect(result.data, isA<TokenModel>());
      expect(result.data?.token, isNotNull);
      expect(result.data?.token, 'XYZ');
      expect(result.data?.refreshToken, 'ABC');
    });
  });

  group('Token model save tests', () {
    test('save context test', () {
      final model = MockTokenModel();
      final now = DateTime.now();

      when(model.expirationDate).thenAnswer((_) => now.toIso8601String());
      when(model.refreshExpirationDate).thenAnswer((_) => now.toIso8601String());

      tokenService.saveByTokenModel(tokenService.tokenContext, model);
      expect(tokenService.tokenContext.token, 'XYZ');
      expect(tokenService.tokenContext.refreshToken, 'ABC');
      expect(tokenService.tokenContext.refreshToken, 'ABC');
      expect(tokenService.tokenContext.tokenExpirationDate, now);
      expect(tokenService.tokenContext.refreshTokenExpirationDate, now);
    });

    test('save cache test', () async {
      final model = MockTokenModel();
      final now = DateTime.now();

      when(model.expirationDate).thenAnswer((_) => now.toIso8601String());
      when(model.refreshExpirationDate).thenAnswer((_) => now.toIso8601String());

      tokenService.saveTokenToCache(model);
      final tokenResult = await tokenService.getTokenLocale();
      expect(tokenResult.success, true);
      expect(tokenResult.data, isA<TokenModel>());
      expect(tokenResult.data?.token, 'XYZ');
      expect(tokenResult.data?.refreshToken, 'ABC');
    });
  });

  group('Get token remote or local tests', () {
    test('Call token any and get model from default remote service test', () async {
      tokenService = MockTokenManager(kCacheService, kTokenContext);

      final result = await tokenService.getTokenAny();
      expect(result.success, true);
      expect(result.data, isNotNull);
      expect(result.data?.token, 'token');
      expect(result.data?.refreshToken, 'refreshToken');
      expect(tokenService.isDateExpired(dateString: result.data?.expirationDate), false);
      expect(tokenService.isDateExpired(dateString: result.data?.refreshExpirationDate), false);
    });

    test('Add firstly a token to local and call token any test', () async {
      tokenService = ErrorRemoteMockTokenManager();

      tokenService.saveByTokenModel(tokenService.tokenContext, tokenModel);
      await tokenService.saveTokenToCache(tokenModel);
      final result = await tokenService.getTokenAny();
      expect(result.success, true);
      expect(result.data, isA<TokenModel>());
      expect(result.data?.token, isNotNull);
      expect(result.data?.token, 'token');
      expect(result.data?.refreshToken, 'refreshToken');
      expect(tokenService.isDateExpired(dateString: result.data?.expirationDate), false);
      expect(tokenService.isDateExpired(dateString: result.data?.refreshExpirationDate), false);
    });
  });
}
