import 'package:flutter_test/flutter_test.dart';
import 'package:hair_salon_nearby/models/request/login_request_model.dart';

void main() {
  setUp(() {
    TestWidgetsFlutterBinding.ensureInitialized();
  });

  test('Variables verify test', () {
    final model = LoginRequestModel(email: 'myemail@gmail.com', password: 'password');

    expect(model.email, 'myemail@gmail.com');
    expect(model.password, 'password');
  });

  test('ToJson function test', () {
    final model = LoginRequestModel(email: 'myemail@gmail.com', password: 'password');
    final json = model.toJson();

    expect(json.containsKey('email'), true);
    expect(json.containsKey('email'), true);
    expect(json.containsValue('myemail@gmail.com'), true);
    expect(json.containsValue('password'), true);
  });
}
