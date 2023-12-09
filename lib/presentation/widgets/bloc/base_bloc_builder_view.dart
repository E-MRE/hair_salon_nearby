import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hair_salon_nearby/presentation/widgets/bloc/base_bloc_stateless_widget.dart';

import '../../../core/state_managers/bloc/cubit/base_cubit.dart';
import '../../../core/state_managers/bloc/states/base_state.dart';

typedef BaseStateViewBuilder<TState extends BaseState> = Widget Function(BuildContext context, TState state);

class BaseBlocBuilderView<TCubit extends BaseCubit<TState>, TState extends BaseState>
    extends BaseBlocStatelessWidget<TCubit, TState> {
  const BaseBlocBuilderView({
    Key? key,
    super.customBuilder,
    super.defaultBuilder,
    super.errorChildBuilder,
    super.successChildBuilder,
    super.initialChildBuilder,
    super.loadingChildBuilder,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TCubit, TState>(
      builder: (context, state) => customBuilder?.call(context, state) ?? buildBody(context, state),
    );
  }
}
