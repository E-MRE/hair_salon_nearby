import '../../core/repositories/base_remote_repository.dart';
import '../../core/services/models/api_response.dart';
import '../../models/request/check_update_request_model.dart';
import '../../utils/constants/endpoints/endpoint_constants.dart';
import '../abstracts/public_repository.dart';

class DioPublicRepository extends BaseRemoteRepository implements PublicRepository {
  DioPublicRepository({required super.dataService}) : super.remote();

  DioPublicRepository.defaultRemote() : super.defaultRemote();

  @override
  Future<ApiResponse> checkUpdate(CheckUpdateRequestModel request) async {
    return dataService.postData(
      request: request,
      endpoint: EndpointConstants.public.checkUpdate,
    );
  }
}
