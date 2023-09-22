import '../../../../core/state_managers/bloc/states/base_state.dart';
import '../../../../core/utils/enums/state_status.dart';
import '../../../../utils/enum/onboarding_option.dart';

class OnboardState extends BaseState {
  OnboardState.initial({this.pageIndex = 0}) : super.initial();

  final int pageIndex;

  List<OnboardingOption> get pages => OnboardingOption.values;

  bool get isLastPage => pageIndex == pages.length - 1;

  OnboardState({
    this.pageIndex = 0,
    required super.status,
    required super.errorMessage,
    required super.infoMessage,
  });

  @override
  OnboardState copyWith({
    int? pageIndex,
    StateStatus? status,
    String? infoMessage,
    String? errorMessage,
  }) {
    return OnboardState(
      status: status ?? this.status,
      pageIndex: pageIndex ?? this.pageIndex,
      infoMessage: infoMessage ?? this.infoMessage,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
