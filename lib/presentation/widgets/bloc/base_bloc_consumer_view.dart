import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/state_managers/bloc/cubit/base_cubit.dart';
import '../../../core/state_managers/bloc/states/base_state.dart';
import 'base_bloc_stateless_widget.dart';

class BaseBlocConsumerView<TCubit extends BaseCubit<TState>, TState extends BaseState>
    extends BaseBlocStatelessWidget<TCubit, TState> {
  const BaseBlocConsumerView({
    super.key,
    this.listener,
    super.customBuilder,
    super.errorChildBuilder,
    super.successChildBuilder,
    super.initialChildBuilder,
    super.loadingChildBuilder,
  });

  final BlocWidgetListener<TState>? listener;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TCubit, TState>(
      listener: (context, state) => listener?.call(context, state),
      builder: (context, state) => buildBody(context, state),
    );
  }
}
