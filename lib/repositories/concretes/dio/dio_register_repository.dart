import '../../../core/repositories/base_remote_repository.dart';
import '../../../core/services/models/api_response.dart';
import '../../../models/entity/user_model.dart';
import '../../../models/request/register_request_model.dart';
import '../../../utils/constants/endpoints/endpoint_constants.dart';
import '../../abstracts/register_repository.dart';

class DioRegisterRepository extends BaseRemoteRepository implements RegisterRepository {
  const DioRegisterRepository({required super.dataService}) : super.remote();

  DioRegisterRepository.defaultRemote() : super.defaultRemote();

  @override
  Future<ApiResponse<UserModel>> registerUser(RegisterRequestModel request) async {
    return dataService.postData<UserModel>(
      endpoint: EndpointConstants.register.register,
      fromMap: (json) => UserModel.fromJson(json),
      request: request,
    );
  }
}
