import '../../core/services/models/api_response.dart';
import '../../core/services/models/api_response_model.dart';
import '../../core/services/models/empty_entity_model.dart';
import '../../core/services/models/friendly_message_model.dart';
import '../../core/utils/enums/duration_types.dart';
import '../../core/utils/enums/process_status.dart';
import '../../models/request/register_request_model.dart';
import '../abstracts/register_repository.dart';

class MockRegisterRepository implements RegisterRepository {
  @override
  Future<ApiResponse<EmptyEntityModel>> registerUser(RegisterRequestModel request) async {
    await Future.delayed(DurationTypes.oneSecond.rawValue());

    if (request.email == 'fatih.mandirali@hotmail.com' && request.password == '123456') {
      return ApiResponseModel(processStatus: ProcessStatus.success);
    }

    return ApiResponseModel(
      friendlyMessage: FriendlyMessageModel(title: 'Register Error', message: 'Email or password is wrong'),
    );
  }
}
