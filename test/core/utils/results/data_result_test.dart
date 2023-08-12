import 'package:flutter_test/flutter_test.dart';
import 'package:hair_salon_nearby/core/utils/results/data_result.dart';

void main() {
  setUp(() => TestWidgetsFlutterBinding.ensureInitialized());

  test('Success result and data not null test', () {
    final dataResult = DataResult.success(data: 0);

    expect(dataResult.success, true);
    expect(dataResult.isSuccessAndDataExists, true);
    expect(dataResult.isNotSuccessOrDataNotExists, false);
    expect(dataResult.isNotSuccess, false);
    expect(dataResult.message, isEmpty);
    expect(dataResult.data, isNotNull);
    expect(dataResult.data, isA<int>());
    expect(dataResult.data, 0);
    expect(dataResult.message, isEmpty);
  });

  test('Success result and data not null and not empty message test', () {
    final dataResult = DataResult.successByMessage(data: 0, message: 'Success');

    expect(dataResult.success, true);
    expect(dataResult.isSuccessAndDataExists, true);
    expect(dataResult.isNotSuccessOrDataNotExists, false);
    expect(dataResult.isNotSuccess, false);
    expect(dataResult.message, isNotEmpty);
    expect(dataResult.data, isNotNull);
    expect(dataResult.data, isA<int>());
    expect(dataResult.data, 0);
    expect(dataResult.message, 'Success');
  });

  test('Success result and but null data  test', () {
    final dataResult = DataResult<int>(success: true, message: 'Success');

    expect(dataResult.success, true);
    expect(dataResult.isSuccessAndDataExists, false);
    expect(dataResult.isNotSuccessOrDataNotExists, true);
    expect(dataResult.isNotSuccess, false);
    expect(dataResult.message, isNotEmpty);
    expect(dataResult.data, isNull);
    expect(dataResult.message, 'Success');
  });

  test('Error result  test', () {
    final dataResult = DataResult<int>(success: false, message: 'Success');

    expect(dataResult.success, false);
    expect(dataResult.isSuccessAndDataExists, false);
    expect(dataResult.isNotSuccessOrDataNotExists, true);
    expect(dataResult.isNotSuccess, true);
    expect(dataResult.message, isNotEmpty);
    expect(dataResult.data, isNull);
    expect(dataResult.message, 'Success');
  });

  test('Error result without message test', () {
    final dataResult = DataResult.errorByEmpty();

    expect(dataResult.success, false);
    expect(dataResult.isSuccessAndDataExists, false);
    expect(dataResult.isNotSuccessOrDataNotExists, true);
    expect(dataResult.isNotSuccess, true);
    expect(dataResult.message, isEmpty);
    expect(dataResult.data, isNull);
    expect(dataResult.message, isEmpty);
  });
}
