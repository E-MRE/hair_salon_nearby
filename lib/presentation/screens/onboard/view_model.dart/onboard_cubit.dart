import '../../../../core/state_managers/bloc/cubit/base_cubit.dart';
import 'onboard_state.dart';

class OnboardCubit extends BaseCubit<OnboardState> {
  OnboardCubit() : super(OnboardState.initial());

  void changeIndex(int index) {
    safeEmit(state.copyWith(pageIndex: index));
  }
}
