import 'package:flutter_test/flutter_test.dart';
import 'package:hair_salon_nearby/models/request/register_request_model.dart';

void main() {
  setUp(() {
    TestWidgetsFlutterBinding.ensureInitialized();
  });

  final model = RegisterRequestModel(
    name: 'My name',
    surname: 'My surname',
    gender: 0,
    city: 'My city',
    county: 'My county',
    latitude: '42.56744',
    longitude: '34.34534',
    platform: 0,
    version: '1.0.0',
    notificationId: 'notification',
    phone: '543221212312',
    email: 'myemail@gmail.com',
    password: 'password',
  );

  test('Variables verify test', () {
    expect(model.name, 'My name');
    expect(model.surname, 'My surname');
    expect(model.gender, 0);
    expect(model.city, 'My city');
    expect(model.county, 'My county');
    expect(model.latitude, '42.56744');
    expect(model.longitude, '34.34534');
    expect(model.platform, 0);
    expect(model.version, '1.0.0');
    expect(model.notificationId, 'notification');
    expect(model.phone, '543221212312');
    expect(model.email, 'myemail@gmail.com');
    expect(model.password, 'password');
  });

  test('ToJson function test', () {
    final json = model.toJson();

    expect(json.containsKey('name'), true);
    expect(json.containsKey('surname'), true);
    expect(json.containsKey('gender'), true);
    expect(json.containsKey('city'), true);
    expect(json.containsKey('county'), true);
    expect(json.containsKey('latitude'), true);
    expect(json.containsKey('longitude'), true);
    expect(json.containsKey('platform'), true);
    expect(json.containsKey('version'), true);
    expect(json.containsKey('notificationId'), true);
    expect(json.containsKey('phone'), true);
    expect(json.containsKey('email'), true);
    expect(json.containsKey('password'), true);
  });
}
