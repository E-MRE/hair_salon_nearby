import 'package:flutter_test/flutter_test.dart';
import 'package:hair_salon_nearby/models/entity/user_model.dart';

void main() {
  setUp(() {
    TestWidgetsFlutterBinding.ensureInitialized();
  });

  test('From json method test', () {
    final model = UserModel.fromJson(json);

    expect(model, isA<UserModel>());
    expect(json.containsValue(model.name), true);
    expect(json.containsValue(model.surname), true);

    json['name'] = 'new name';
    json['surname'] = 'new surname';

    final fromJson = model.fromJson(json);

    expect(fromJson.name, 'new name');
    expect(fromJson.surname, 'new surname');
  });
}

var json = {'name': 'My name', 'surname': 'My surname'};
