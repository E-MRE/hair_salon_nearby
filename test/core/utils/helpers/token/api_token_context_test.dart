import 'package:flutter_test/flutter_test.dart';
import 'package:hair_salon_nearby/core/utils/helpers/dependency/core_dependencies.dart';
import 'package:hair_salon_nearby/core/utils/helpers/dependency/get_it_injection_container.dart';

void main() {
  setUp(() {
    TestWidgetsFlutterBinding.ensureInitialized();
    GetItInjectionContainer.instance.register();
  });
  tearDown(() {});
  test('TokenContext values are default test', () {
    expect(kTokenContext.token.isEmpty, true);
    expect(kTokenContext.refreshToken.isEmpty, true);
    expect(kTokenContext.tokenExpirationDate, DateTime(1));
    expect(kTokenContext.refreshTokenExpirationDate, DateTime(1));
    expect(kTokenContext.isRefreshTokenAvailable(), false);
  });

  test('Set all variables test', () {
    final token = 'ABCDEF';
    final refreshToken = 'XYZABC';

    final tokenExpirationDate = DateTime(2023);
    final refreshTokenExpirationDate = DateTime(2024);

    kTokenContext.token = token;
    kTokenContext.refreshToken = refreshToken;
    kTokenContext.setTokenExpirationDate(tokenExpirationDate.toString());
    kTokenContext.setRefreshTokenExpirationDate(refreshTokenExpirationDate.toString());

    expect(kTokenContext.token, token);
    expect(kTokenContext.refreshToken, refreshToken);
    expect(kTokenContext.tokenExpirationDate.year, tokenExpirationDate.year);
    expect(kTokenContext.refreshTokenExpirationDate.year, refreshTokenExpirationDate.year);
    expect(kTokenContext.isRefreshTokenAvailable(), true);
  });

  test('convert iso 9601 string to date time test', () {
    final date = DateTime(2023, 1, 2, 3, 5);
    expect(kTokenContext.convertStringToDateTime(date.toIso8601String()), date);
  });

  test('convert invalid date time test', () {
    expect(kTokenContext.convertStringToDateTime('XYZ'), DateTime(1));
    expect(kTokenContext.convertStringToDateTime('XYZ', defaultDate: DateTime(2023)), DateTime(2023));
    expect(kTokenContext.convertStringToDateTime('XYZ', defaultYear: 2024), DateTime(2024));
    expect(
      kTokenContext.convertStringToDateTime('XYZ', defaultDate: DateTime(2028), defaultYear: 2024),
      DateTime(2028),
    );
  });
}
