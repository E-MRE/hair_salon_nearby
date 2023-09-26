// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:hair_salon_nearby/core/services/models/api_response.dart';
import 'package:hair_salon_nearby/core/services/models/api_response_model.dart';
import 'package:hair_salon_nearby/core/services/models/friendly_message_model.dart';
import 'package:hair_salon_nearby/core/services/models/refresh_token_request_model.dart';
import 'package:hair_salon_nearby/core/services/models/token_model.dart';
import 'package:hair_salon_nearby/core/utils/enums/duration_types.dart';
import 'package:hair_salon_nearby/core/utils/enums/process_status.dart';
import 'package:hair_salon_nearby/models/entity/auth_model.dart';
import 'package:hair_salon_nearby/models/request/login_request_model.dart';
import 'package:hair_salon_nearby/repositories/abstracts/login_repository.dart';

class MockLoginRepository extends LoginRepository {
  final String validEmail;
  final String validPassword;

  MockLoginRepository({this.validEmail = 'fatih.mandirali@hotmail.com', this.validPassword = '123456'});

  @override
  Future<ApiResponse<AuthModel>> login(LoginRequestModel request) async {
    await Future.delayed(DurationTypes.oneSecond.rawValue());

    if (request.email == validEmail && request.password == validPassword) {
      return ApiResponseModel(
        data: AuthModel.fromJson(_mockLoginJsonResponse['payload'] as Map<String, dynamic>),
        processStatus: (_mockLoginJsonResponse['processStatus'] as String).toProcessStatus(),
        friendlyMessage:
            FriendlyMessageModel.fromJson(_mockLoginJsonResponse['friendlyMessage'] as Map<String, dynamic>),
      );
    }

    return ApiResponseModel(
      friendlyMessage: FriendlyMessageModel(title: 'Login Error', message: 'Username or password wrong'),
      processStatus: ProcessStatus.error,
    );
  }

  @override
  Future<ApiResponse<TokenModel>> refreshToken(RefreshTokenRequestModel request) async {
    await Future.delayed(DurationTypes.oneSecond.rawValue());

    return ApiResponseModel(
        data: TokenModel.fromJson(_mockLoginJsonResponse['payload'] as Map<String, dynamic>),
        processStatus: (_mockLoginJsonResponse['payload'] as String).toProcessStatus(),
        friendlyMessage:
            FriendlyMessageModel.fromJson(_mockLoginJsonResponse['friendlyMessage'] as Map<String, dynamic>));
  }
}

var _mockLoginJsonResponse = {
  'processStatus': 'Success',
  'friendlyMessage': {'title': 'string', 'message': 'string'},
  'payload': {
    'token':
        'eyJhbGciOiJodHRwOi8vd3d3LnczLm9yZy8yMDAxLzA0L3htbGRzaWctbW9yZSNobWFjLXNoYTUxMiIsInR5cCI6IkpXVCJ9.eyJBY2NvdW50Um9sZSI6IkFkbWluIiwiSWQiOiIyIiwiaHR0cDovL3NjaGVtYXMubWljcm9zb2Z0LmNvbS93cy8yMDA4LzA2L2lkZW50aXR5L2NsYWltcy9yb2xlIjoiQWRtaW4iLCJuYmYiOjE2ODk0Mjk4OTcsImV4cCI6MTY4OTQzMDA3NywiaXNzIjoib25saW5laGFpcmRyZXNzZXIuY29tIiwiYXVkIjoib25saW5laGFpcmRyZXNzZXIuY29tIn0.mWo2PWoF11sA3JBr6vFlg4z4pCaE9Wrui4Bqs-dlXOvF6ssSBcrmZOYdJSIh6F7xnz_rDD2L001Y9RYnqChTZg',
    'refreshToken': 'wV883JA1a00j9xb3M7KtZjO7FmmzUufm06MSBsBSr/IwSW2hkguaKAro9W2rK0EmpYkSKw+lg0nltChaThr1Gw==',
    'expirationDate': '${DateTime.now().add(const Duration(hours: 1)).toIso8601String()}',
    'refreshExpirationDate': '${DateTime.now().add(const Duration(hours: 2)).toIso8601String()}'
  }
};
