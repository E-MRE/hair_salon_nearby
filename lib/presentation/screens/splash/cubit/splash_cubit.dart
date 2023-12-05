import 'package:hair_salon_nearby/utils/constants/dependency_constants.dart';

import '../../../../core/state_managers/bloc/cubit/base_cubit.dart';
import '../../../../core/utils/enums/state_status.dart';
import '../../../../models/request/check_update_request_model.dart';
import '../../../../repositories/abstracts/public_repository.dart';
import 'splash_state.dart';

class SplashCubit extends BaseCubit<SplashState> {
  SplashCubit({required PublicRepository publicRepository})
      : _publicRepository = publicRepository,
        super(SplashState.initial());

  final PublicRepository _publicRepository;

  Future<void> checkUpdate() async {
    safeEmit(state.copyWith(status: StateStatus.loading));

    final request = CheckUpdateRequestModel(
      platform: DependencyConstants.deviceInfo.platformType,
      version: DependencyConstants.deviceInfo.appVersion,
    );

    final response = await _publicRepository.checkUpdate(request);

    safeEmit(state.copyWith(
      processStatus: response.processStatus,
      status: response.success ? StateStatus.success : StateStatus.error,
      errorMessage: response.isNotSuccess ? response.message : '',
    ));
  }
}
