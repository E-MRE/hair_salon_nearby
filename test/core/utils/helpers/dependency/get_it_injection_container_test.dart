import 'package:flutter_test/flutter_test.dart';
import 'package:hair_salon_nearby/core/utils/helpers/dependency/core_dependencies.dart';
import 'package:hair_salon_nearby/core/utils/helpers/dependency/get_it_injection_container.dart';
import 'package:hair_salon_nearby/core/utils/helpers/token/token_context.dart';

void main() {
  setUp(() {
    TestWidgetsFlutterBinding.ensureInitialized();
  });
  tearDown(() {});
  test('TokenContext instance is registered test', () {
    GetItInjectionContainer.instance.register();
    expect(GetItInjectionContainer.instance.injector.isRegistered<TokenContext>(), true);
    expect(kTokenContext.token, '');
  });

  test('Custom instances are registered test', () {
    GetItInjectionContainer.instance.register(
      customInjections: (injector) {
        injector.registerSingleton<MockRegisterClass>(MockRegisterClass());
      },
    );

    expect(GetItInjectionContainer.instance.injector.isRegistered<MockRegisterClass>(), true);
  });

  test('When instance called generates new value test', () async {
    GetItInjectionContainer.instance.register(
      customInjections: (injector) {
        injector.registerFactory<TestDateTimeGetterEveryCall>(() => TestDateTimeGetterEveryCall());
      },
    );

    final date1 = GetItInjectionContainer.instance.injector.get<TestDateTimeGetterEveryCall>().date;
    await Future.delayed(const Duration(seconds: 1));
    final date2 = GetItInjectionContainer.instance.injector.get<TestDateTimeGetterEveryCall>().date;

    expect(date1.millisecondsSinceEpoch != date2.millisecondsSinceEpoch, true);
  });
}

class MockRegisterClass {}

class TestDateTimeGetterEveryCall {
  final DateTime date;

  TestDateTimeGetterEveryCall() : date = DateTime.now();
}
