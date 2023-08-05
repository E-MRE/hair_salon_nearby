import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:hair_salon_nearby/models/entity/auth_model.dart';

void main() {
  setUp(() {
    TestWidgetsFlutterBinding.ensureInitialized();
  });

  test('From json method test', () {
    final map = jsonDecode(json) as Map<String, dynamic>;
    final model = AuthModel.fromJson(map);

    expect(model, isA<AuthModel>());
    expect(map.containsValue(model.token), true);
    expect(map.containsValue(model.refreshToken), true);
    expect(map.containsValue(model.expirationDate), true);
    expect(map.containsValue(model.refreshExpirationDate), true);

    map['token'] = 'token';
    map['refreshToken'] = 'refreshToken';
    map['expirationDate'] = 'expirationDate';
    map['refreshExpirationDate'] = 'refreshExpirationDate';

    final fromJson = model.fromJson(map);

    expect(fromJson.token, 'token');
    expect(fromJson.refreshToken, 'refreshToken');
    expect(fromJson.expirationDate, 'expirationDate');
    expect(fromJson.refreshExpirationDate, 'refreshExpirationDate');
  });
}

String json = '''
{
    "token": "eyJhbGciOiJodHRwOi8vd3d3LnczLm9yZy8yMDAxLzA0L3htbGRzaWctbW9yZSNobWFjLXNoYTUxMiIsInR5cCI6IkpXVCJ9.eyJBY2NvdW50Um9sZSI6IkFkbWluIiwiSWQiOiIyIiwiaHR0cDovL3NjaGVtYXMubWljcm9zb2Z0LmNvbS93cy8yMDA4LzA2L2lkZW50aXR5L2NsYWltcy9yb2xlIjoiQWRtaW4iLCJuYmYiOjE2ODk0Mjk4OTcsImV4cCI6MTY4OTQzMDA3NywiaXNzIjoib25saW5laGFpcmRyZXNzZXIuY29tIiwiYXVkIjoib25saW5laGFpcmRyZXNzZXIuY29tIn0.mWo2PWoF11sA3JBr6vFlg4z4pCaE9Wrui4Bqs-dlXOvF6ssSBcrmZOYdJSIh6F7xnz_rDD2L001Y9RYnqChTZg",
    "refreshToken": "wV883JA1a00j9xb3M7KtZjO7FmmzUufm06MSBsBSr/IwSW2hkguaKAro9W2rK0EmpYkSKw+lg0nltChaThr1Gw==",
    "expirationDate": "2023-07-15T17:07:57.1140352+03:00",
    "refreshExpirationDate": "2023-07-15T17:11:57.1140406+03:00"
}
''';
