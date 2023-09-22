import '../../../../core/services/abstract/cache_service.dart';
import '../../../../core/state_managers/bloc/cubit/base_cubit.dart';
import '../../../../core/utils/enums/caching_keys.dart';
import '../../../../core/utils/enums/state_status.dart';
import '../../../../core/utils/helpers/dependency/core_dependencies.dart';
import 'onboard_state.dart';

class OnboardCubit extends BaseCubit<OnboardState> {
  OnboardCubit({CacheService? cacheService})
      : _cacheService = cacheService ?? kCacheService,
        super(OnboardState.initial());

  final CacheService _cacheService;

  void changeIndex(int index) {
    int fixedIndex = index < 0 ? 0 : index;
    fixedIndex = fixedIndex >= state.pages.length - 1 ? 0 : fixedIndex;

    safeEmit(state.copyWith(pageIndex: fixedIndex));
  }

  Future<void> completeOnboarding() async {
    safeEmit(state.copyWith(status: StateStatus.loading));
    final result = await _cacheService.setValue<bool>(CachingKeys.onboarding, true);

    if (result) {
      safeEmit(state.copyWith(status: StateStatus.success));
    }
  }

  void showNextPage() {
    changeIndex(state.pageIndex + 1);
  }
}
