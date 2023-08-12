import 'package:flutter_test/flutter_test.dart';
import 'package:hair_salon_nearby/core/services/models/api_response.dart';
import 'package:hair_salon_nearby/core/services/models/api_response_model.dart';
import 'package:hair_salon_nearby/core/services/models/friendly_message_model.dart';
import 'package:hair_salon_nearby/core/utils/enums/process_status.dart';
import 'package:hair_salon_nearby/models/entity/user_model.dart';
import 'package:hair_salon_nearby/models/request/register_request_model.dart';
import 'package:hair_salon_nearby/repositories/abstracts/register_repository.dart';
import 'package:hair_salon_nearby/utils/enum/gender.dart';
import 'package:hair_salon_nearby/utils/enum/platform_type.dart';

class MockDioRegisterRepository implements RegisterRepository {
  @override
  Future<ApiResponse<UserModel>> registerUser(RegisterRequestModel request) async {
    await Future.delayed(Duration.zero);

    final list = [
      request.email,
      request.name,
      request.phone,
      request.surname,
      request.version,
    ];

    bool isSuccess = list.every((element) => element.isNotEmpty);

    return ApiResponseModel(
      data: isSuccess ? UserModel(name: request.name, surname: request.surname) : null,
      processStatus: isSuccess ? ProcessStatus.success : ProcessStatus.error,
      friendlyMessage: isSuccess
          ? null
          : FriendlyMessageModel(title: 'Register Error', message: 'Required fields must not be empty'),
    );
  }
}

void main() {
  late RegisterRepository registerRepository;
  setUp(() async {
    TestWidgetsFlutterBinding.ensureInitialized();
  });

  test('Register user with successfully test', () async {
    registerRepository = MockDioRegisterRepository();

    final request = RegisterRequestModel(
      name: 'My name',
      surname: 'My surname',
      gender: Gender.man,
      city: 'My city',
      county: 'My county',
      latitude: '42.56744',
      longitude: '34.34534',
      platform: PlatformType.android,
      version: '1.0.0',
      notificationId: 'notification',
      phone: '543221212312',
      email: 'myemail@gmail.com',
      password: 'password',
    );

    final response = await registerRepository.registerUser(request);
    expect(response.processStatus, ProcessStatus.success);
    expect(response.data, isNotNull);
    expect(response.data, isA<UserModel>());
  });

  test('Register user with error test', () async {
    registerRepository = MockDioRegisterRepository();

    final request = RegisterRequestModel(
      name: '',
      surname: '',
      gender: Gender.man,
      city: 'My city',
      county: 'My county',
      latitude: '42.56744',
      longitude: '34.34534',
      platform: PlatformType.android,
      version: '1.0.0',
      notificationId: 'notification',
      phone: '543221212312',
      email: 'myemail@gmail.com',
      password: 'password',
    );

    final response = await registerRepository.registerUser(request);
    expect(response.processStatus, ProcessStatus.error);
    expect(response.data, isNull);
    expect(response.friendlyMessage, isNotNull);
  });
}
