import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/state_managers/bloc/cubit/base_data_cubit.dart';
import '../../../core/state_managers/bloc/states/base_data_state.dart';
import '../../../core/utils/enums/state_status.dart';
import 'base_bloc_data_builder_view.dart';

class BaseBlocDataProviderView<TData> extends StatelessWidget {
  const BaseBlocDataProviderView({
    Key? key,
    required this.create,
    this.errorChildBuilder,
    this.successChildBuilder,
    this.listener,
    this.customBuilder,
    this.initialChild,
    this.loadingChild,
  }) : super(key: key);

  final BaseDataCubit<BaseDataState<TData>> Function(BuildContext context) create;
  final BlocWidgetListener<BaseDataState<TData>>? listener;
  final BlocWidgetBuilder<BaseDataState<TData>>? customBuilder;

  final BaseDataStateViewBuilder<TData>? errorChildBuilder;
  final BaseDataStateViewBuilder<TData>? successChildBuilder;

  final Widget? initialChild;
  final Widget? loadingChild;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<BaseDataCubit<BaseDataState<TData>>>(
      create: create,
      child: BlocConsumer<BaseDataCubit<BaseDataState<TData>>, BaseDataState<TData>>(
        listener: (context, state) => listener?.call(context, state),
        builder: (context, state) {
          if (customBuilder != null) {
            return customBuilder!.call(context, state);
          }

          return _buildBody(context, state);
        },
      ),
    );
  }

  Widget _buildBody(BuildContext context, BaseDataState<TData> state) {
    switch (state.status) {
      case StateStatus.initial:
        return initialChild ?? const SizedBox.shrink();
      case StateStatus.loading:
        return loadingChild ?? const Center(child: CircularProgressIndicator());
      case StateStatus.success:
        return successChildBuilder?.call(context, state) ?? Text(state.infoMessage);
      case StateStatus.error:
        return errorChildBuilder?.call(context, state) ?? Text(state.errorMessage);
    }
  }
}
