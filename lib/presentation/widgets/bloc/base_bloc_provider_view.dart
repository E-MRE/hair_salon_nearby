import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/state_managers/bloc/cubit/base_cubit.dart';
import '../../../core/state_managers/bloc/states/base_state.dart';
import 'base_bloc_builder_view.dart';
import 'base_bloc_consumer_view.dart';

class BaseBlocProviderView<TCubit extends BaseCubit<TState>, TState extends BaseState> extends StatelessWidget {
  const BaseBlocProviderView({
    super.key,
    this.listener,
    this.customBuilder,
    this.defaultBuilder,
    required this.create,
    this.errorChildBuilder,
    this.successChildBuilder,
    this.initialChildBuilder,
    this.loadingChildBuilder,
  });

  final TCubit Function(BuildContext context) create;
  final BlocWidgetListener<TState>? listener;
  final BlocWidgetBuilder<TState>? customBuilder;
  final BlocWidgetBuilder<TState>? defaultBuilder;

  final BlocWidgetBuilder<TState>? initialChildBuilder;
  final BlocWidgetBuilder<TState>? loadingChildBuilder;
  final BlocWidgetBuilder<TState>? successChildBuilder;
  final BlocWidgetBuilder<TState>? errorChildBuilder;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<TCubit>(
      create: create,
      child: listener != null
          ? BaseBlocConsumerView<TCubit, TState>(
              listener: listener,
              customBuilder: customBuilder,
              defaultBuilder: defaultBuilder,
              initialChildBuilder: initialChildBuilder,
              loadingChildBuilder: loadingChildBuilder,
              successChildBuilder: successChildBuilder,
              errorChildBuilder: errorChildBuilder,
            )
          : BaseBlocBuilderView<TCubit, TState>(
              customBuilder: customBuilder,
              defaultBuilder: defaultBuilder,
              initialChildBuilder: initialChildBuilder,
              loadingChildBuilder: loadingChildBuilder,
              successChildBuilder: successChildBuilder,
              errorChildBuilder: errorChildBuilder,
            ),
    );
  }
}
