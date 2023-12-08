import 'package:hair_salon_nearby/core/repositories/base_dio_remote_repository.dart';

import '../../../core/services/models/api_response.dart';
import '../../../models/request/check_update_request_model.dart';
import '../../../utils/constants/endpoints/endpoint_constants.dart';
import '../../abstracts/public_repository.dart';

final class DioPublicRepository extends BaseDioRemoteRepository implements PublicRepository {
  const DioPublicRepository({required super.dataService}) : super.remote();

  @override
  Future<ApiResponse> checkUpdate(CheckUpdateRequestModel request) async {
    return dataService.postData(
      request: request,
      endpoint: EndpointConstants.public.checkUpdate,
      fromMap: (json) {},
    );
  }
}
