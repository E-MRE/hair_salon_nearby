import '../../core/repositories/base_remote_repository.dart';
import '../../core/services/models/api_response.dart';
import '../../models/entity/onboarding_model.dart';
import '../../utils/constants/endpoints/endpoint_constants.dart';
import '../abstracts/onboarding_repository.dart';

class DioOnboardingRepository extends BaseRemoteRepository implements OnboardingRepository {
  DioOnboardingRepository({required super.dataService}) : super.remote();

  DioOnboardingRepository.defaultRemote() : super.defaultRemote();

  @override
  Future<ApiResponse<List<OnboardingModel>>> getList() {
    return dataService.getData(
      fromMap: (data) => data is List ? data.map((item) => OnboardingModel.fromJson(item)).toList() : [],
      endpoint: EndpointConstants.onboarding.onboarding,
    );
  }
}
