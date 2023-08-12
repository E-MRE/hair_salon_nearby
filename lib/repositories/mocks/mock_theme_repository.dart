import '../../core/services/models/api_response.dart';
import '../../core/services/models/api_response_model.dart';
import '../../core/services/models/friendly_message_model.dart';
import '../../core/utils/enums/process_status.dart';
import '../../models/entity/theme_model.dart';
import '../../utils/enum/gender.dart';
import '../abstracts/theme_repository.dart';

class MockThemeRepository extends ThemeRepository {
  @override
  Future<ApiResponse<List<ThemeModel>>> getThemes() async {
    await Future.delayed(Duration.zero);

    return ApiResponseModel(
        processStatus: ProcessStatus.success,
        friendlyMessage: FriendlyMessageModel(title: 'Get Themes', message: 'themes are ready'),
        data: [
          ThemeModel(
            gender: Gender.man,
            primaryColor: '#000000',
            secondaryColor: '#111111',
            alternativeColor: '#222222',
          ),
          ThemeModel(
            gender: Gender.woman,
            primaryColor: '#000000',
            secondaryColor: '#111111',
            alternativeColor: '#222222',
          ),
        ]);
  }
}
