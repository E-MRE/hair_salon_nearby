import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/state_managers/bloc/cubit/base_cubit.dart';
import '../../../core/state_managers/bloc/states/base_state.dart';
import '../../../core/utils/enums/state_status.dart';

abstract class BaseBlocStatelessWidget<TCubit extends BaseCubit<TState>, TState extends BaseState>
    extends StatelessWidget {
  final BlocWidgetBuilder<TState>? customBuilder;

  final BlocWidgetBuilder<TState>? initialChildBuilder;
  final BlocWidgetBuilder<TState>? loadingChildBuilder;
  final BlocWidgetBuilder<TState>? successChildBuilder;
  final BlocWidgetBuilder<TState>? errorChildBuilder;

  const BaseBlocStatelessWidget({
    Key? key,
    this.customBuilder,
    this.initialChildBuilder,
    this.loadingChildBuilder,
    this.successChildBuilder,
    this.errorChildBuilder,
  }) : super(key: key);

  Widget buildBody(BuildContext context, TState state) {
    switch (state.status) {
      case StateStatus.initial:
        return initialChildBuilder?.call(context, state) ?? const SizedBox.shrink();
      case StateStatus.loading:
        return loadingChildBuilder?.call(context, state) ?? const Center(child: CircularProgressIndicator());
      case StateStatus.success:
        return successChildBuilder?.call(context, state) ?? const SizedBox.shrink();
      case StateStatus.error:
        return errorChildBuilder?.call(context, state) ?? const SizedBox.shrink();
    }
  }
}
