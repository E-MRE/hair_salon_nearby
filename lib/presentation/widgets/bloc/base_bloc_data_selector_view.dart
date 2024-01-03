import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/state_managers/bloc/cubit/base_data_cubit.dart';
import '../../../core/state_managers/bloc/states/base_data_state.dart';

///Simple BlocSelector widget with [BaseDataCubit] and [BaseDataState].
///
///Example:
///
///```dart
///@override
///  Widget _build(BuildContext context) {
/// return BlocProvider<MyCubit>(
///     create: (_) => MyCubit(),
///     child: BlocConsumer<MyCubit, MyState>(
///         listener: (_, __) {},
///         builder: (context, state) {
///           return BaseBlocSelector<ExampleModel?>(
///             selectorCallback: (myState) => myState.status == StateStatus.success ? myState.data : null,
///             builder: (context, data) => MyCustomCard(child: data),
///           );
///         }));
///}
///```
class BaseBlocDataSelectorView<TCubit extends BaseDataCubit<TState>, TState extends BaseDataState, TSelected>
    extends StatelessWidget {
  const BaseBlocDataSelectorView({super.key, required this.selectorCallback, required this.builder});

  final TSelected Function(TState state) selectorCallback;
  final Widget Function(BuildContext context, TSelected data) builder;

  @override
  Widget build(BuildContext context) {
    return BlocSelector<TCubit, TState, TSelected>(
      selector: selectorCallback,
      builder: builder,
    );
  }
}
