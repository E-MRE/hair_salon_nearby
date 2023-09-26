import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/state_managers/bloc/cubit/base_cubit.dart';
import '../../../core/state_managers/bloc/states/base_state.dart';
import '../../../core/utils/enums/state_status.dart';

abstract class BaseBlocStatelessWidget<TCubit extends BaseCubit<TState>, TState extends BaseState>
    extends StatelessWidget {
  final BlocWidgetBuilder<TState>? customBuilder;
  final BlocWidgetBuilder<TState>? defaultBuilder;

  final BlocWidgetBuilder<TState>? initialChildBuilder;
  final BlocWidgetBuilder<TState>? loadingChildBuilder;
  final BlocWidgetBuilder<TState>? successChildBuilder;
  final BlocWidgetBuilder<TState>? errorChildBuilder;

  const BaseBlocStatelessWidget({
    Key? key,
    this.customBuilder,
    this.defaultBuilder,
    this.initialChildBuilder,
    this.loadingChildBuilder,
    this.successChildBuilder,
    this.errorChildBuilder,
  }) : super(key: key);

  Widget buildBody(BuildContext context, TState state) {
    switch (state.status) {
      case StateStatus.initial:
        return _buildWidgetByDefault(initialChildBuilder?.call(context, state) ?? defaultBuilder?.call(context, state));
      case StateStatus.success:
        return _buildWidgetByDefault(successChildBuilder?.call(context, state) ?? defaultBuilder?.call(context, state));
      case StateStatus.error:
        return _buildWidgetByDefault(errorChildBuilder?.call(context, state) ?? defaultBuilder?.call(context, state));
      case StateStatus.loading:
        return loadingChildBuilder?.call(context, state) ??
            defaultBuilder?.call(context, state) ??
            const Center(child: CircularProgressIndicator());
    }
  }

  Widget _buildWidgetByDefault(Widget? builder) {
    return builder ?? const SizedBox.shrink();
  }
}
