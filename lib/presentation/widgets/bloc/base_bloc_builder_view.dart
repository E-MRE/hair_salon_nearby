import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/state_managers/bloc/cubit/base_data_cubit.dart';
import '../../../core/state_managers/bloc/states/base_data_state.dart';
import '../../../core/utils/enums/state_status.dart';

typedef BaseDataStateViewBuilder<TData> = Widget Function(BuildContext context, BaseDataState<TData> state);

///Simple BlocBuilder view with [BaseDataCubit] and [BaseDataState].
///
///Example:
///

///```dart
///Widget _buildData() {
///  return BaseBlocBuilderView<ExampleModel>(
///    errorChildBuilder: (context, state) => Text('Error: ${state.errorMessage}'),
///    successChildBuilder: (context, state) => MyCard(child: state.data),
///    loadingChild: const CircularProgressIndicator(),
///  );
///}
///```
class BaseBlocBuilderView<TData> extends StatelessWidget {
  const BaseBlocBuilderView({
    Key? key,
    required this.errorChildBuilder,
    required this.successChildBuilder,
    this.initialChild,
    this.loadingChild,
  }) : super(key: key);

  final BaseDataStateViewBuilder<TData> errorChildBuilder;
  final BaseDataStateViewBuilder<TData> successChildBuilder;

  final Widget? initialChild;
  final Widget? loadingChild;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BaseDataCubit<BaseDataState<TData>>, BaseDataState<TData>>(
      builder: (context, state) {
        switch (state.status) {
          case StateStatus.initial:
            return initialChild ?? const SizedBox.shrink();
          case StateStatus.loading:
            return loadingChild ?? const Center(child: CircularProgressIndicator());
          case StateStatus.success:
            return successChildBuilder.call(context, state);
          case StateStatus.error:
            return errorChildBuilder.call(context, state);
        }
      },
    );
  }
}
