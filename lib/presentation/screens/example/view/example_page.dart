import 'package:auto_route/auto_route.dart';
import 'package:base_flutter_project/models/entity/example_model.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_framework/responsive_framework.dart';

import '../../../../core/utils/enums/state_status.dart';
import '../../../../utils/constants/lang/locale_keys.g.dart';
import '../../../../utils/navigation/auto_router/app_router.dart';
import '../view_model/example_state.dart';
import '../view_model/example_view_model.dart';

//View sınıf örneği. İhtiyacın yoksa kaldırabilirsin.
@RoutePage()
class ExamplePage extends StatefulWidget {
  const ExamplePage({Key? key, this.property}) : super(key: key);

  final String? property;

  @override
  State<ExamplePage> createState() => _ExamplePageState();
}

class _ExamplePageState extends State<ExamplePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(_getTitle())),
      body: BlocProvider(
        create: (_) => ExampleCubit()..getExamples(),
        child: BlocConsumer<ExampleCubit, ExampleState>(listener: (context, state) {}, builder: _buildBody),
      ),
    );
  }

  Widget _buildBody(BuildContext context, ExampleState state) {
    switch (state.status) {
      case StateStatus.loading:
        return const Center(child: CircularProgressIndicator());

      case StateStatus.error:
        return Center(child: Text('An error occured when get examples -> ${state.errorMessage}'));

      case StateStatus.success:
        if (ResponsiveBreakpoints.of(context).smallerThan(TABLET))
          return _buildListView(state);
        else if (ResponsiveBreakpoints.of(context).smallerThan(DESKTOP))
          return _buildGridView(state, 2);
        else
          return _buildGridView(state, 3);

      default:
        return const SizedBox.shrink();
    }
  }

  GridView _buildGridView(ExampleState state, int crossAxisCount) {
    return GridView.count(
      crossAxisCount: crossAxisCount,
      children: state.data?.map((item) => _buildGridViewItem(item)).toList() ?? [],
      physics: const BouncingScrollPhysics(),
    );
  }

  Container _buildGridViewItem(ExampleModel item) {
    return Container(
      color: _getColorById(item.id ?? 0),
      alignment: Alignment.center,
      child: Text('id: ${item.id ?? '-'}'),
    );
  }

  ListView _buildListView(ExampleState state) {
    return ListView.builder(
      itemCount: state.data?.length ?? 0,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(state.data?[index].name ?? '-'),
          subtitle: Text('id: ${state.data?[index].id ?? '-'}'),
          onTap: () => context.router.navigate(const ExampleSecondRoute()),
        );
      },
    );
  }

  Color _getColorById(int id) {
    return switch (id) {
      0 => Colors.red,
      1 => Colors.blue,
      2 => Colors.yellow,
      3 => Colors.orange,
      _ => Colors.pink,
    };
  }

  String _getTitle() {
    if (ResponsiveBreakpoints.of(context).smallerThan(TABLET))
      return LocaleKeys.welcome.tr(args: ['Developer']);
    else if (ResponsiveBreakpoints.of(context).smallerThan(DESKTOP))
      return TABLET;
    else if (ResponsiveBreakpoints.of(context).largerOrEqualTo(DESKTOP))
      return DESKTOP;
    else
      return ResponsiveBreakpoints.of(context).toString();
  }
}
