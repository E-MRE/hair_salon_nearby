import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../../presentation/screens/example/view/example_page.dart';
import '../../../presentation/screens/example/view/example_second_page.dart';

part 'app_router.gr.dart';

// extend the generated private router
@AutoRouterConfig(replaceInRouteName: 'Page,Route')
class AppRouter extends _$AppRouter {
  List<AutoRoute> get routes => <AutoRoute>[
        AutoRoute(page: ExampleRoute.page, initial: true, path: '/'),
        AutoRoute(page: ExampleSecondRoute.page, path: '/exampleSecondPage'),
      ];
}
