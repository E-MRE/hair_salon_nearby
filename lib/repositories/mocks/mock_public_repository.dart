import '../../core/services/models/api_response.dart';
import '../../core/services/models/api_response_model.dart';
import '../../core/services/models/friendly_message_model.dart';
import '../../core/utils/enums/process_status.dart';
import '../../models/request/check_update_request_model.dart';
import '../abstracts/public_repository.dart';

class MockPublicRepository extends PublicRepository {
  final String validVersion;

  MockPublicRepository({this.validVersion = '1.0.0'});
  @override
  Future<ApiResponse> checkUpdate(CheckUpdateRequestModel request) async {
    await Future.delayed(Duration.zero);

    return ApiResponseModel(
      processStatus: request.version != validVersion ? ProcessStatus.majorUpdate : ProcessStatus.success,
      friendlyMessage: request.version != validVersion
          ? FriendlyMessageModel(title: 'Old Version', message: 'Current version is old. Please, update it!')
          : null,
    );
  }
}
