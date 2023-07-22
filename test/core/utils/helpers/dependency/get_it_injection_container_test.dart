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
}

class MockRegisterClass {}
