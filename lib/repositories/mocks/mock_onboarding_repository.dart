import '../../core/services/models/api_response.dart';
import '../../core/services/models/api_response_model.dart';
import '../../core/services/models/friendly_message_model.dart';
import '../../core/utils/enums/process_status.dart';
import '../../models/entity/onboarding_model.dart';
import '../abstracts/onboarding_repository.dart';

class MockOnboardingRepository extends OnboardingRepository {
  @override
  Future<ApiResponse<List<OnboardingModel>>> getList() async {
    return ApiResponseModel(
      data: (onboardingApiResponse['payload'] as List).map((e) => OnboardingModel.fromJson(e)).toList(),
      processStatus: ProcessStatus.success,
      friendlyMessage: FriendlyMessageModel.fromJson(onboardingApiResponse['payload'] as Map<String, dynamic>),
    );
  }
}

var onboardingApiResponse = {
  'processStatus': 'Success',
  'friendlyMessage': null,
  'payload': [
    {
      'name': 'MALE',
      'description': 'Çevrendeki en popüler erkek kuaförleri bir tık uzağında!',
      'imageUrl': 'http://52.207.241.142:5006/images/onboarding/men.png',
      'theme': {'gender': 0, 'colorOne': '#000000', 'colorTwo': '#111111', 'colorThree': '#222222'},
      'gender': 0
    },
    {
      'name': 'WOMEN',
      'description': 'Çevrendeki en popüler bayan kuaförleri bir tık uzağında!',
      'imageUrl': 'http://52.207.241.142:5006/images/onboarding/women.png',
      'theme': {'gender': 1, 'colorOne': '#000000', 'colorTwo': '#efd181', 'colorThree': '#222222'},
      'gender': 1
    }
  ]
};
