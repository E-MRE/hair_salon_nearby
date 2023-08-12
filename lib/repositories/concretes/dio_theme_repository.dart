import '../../core/repositories/base_remote_repository.dart';
import '../../core/services/models/api_response.dart';
import '../../models/entity/theme_model.dart';
import '../../utils/constants/endpoints/endpoint_constants.dart';
import '../abstracts/theme_repository.dart';

class DioThemeRepository extends BaseRemoteRepository implements ThemeRepository {
  DioThemeRepository.remote({required super.dataService}) : super.remote();
  DioThemeRepository.defaultRemote() : super.defaultRemote();

  @override
  Future<ApiResponse<List<ThemeModel>>> getThemes() {
    return dataService.getData<List<ThemeModel>>(
      fromMap: (data) => dataService.castFromJson(data, (json) => ThemeModel.fromJson(json)),
      endpoint: EndpointConstants.theme.themeList,
    );
  }
}
