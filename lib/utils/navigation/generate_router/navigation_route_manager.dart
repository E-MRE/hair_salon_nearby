import 'package:flutter/material.dart';

import '../../../presentation/screens/example/view/example_page.dart';
import 'navigation_enum.dart';
import 'navigation_route_service.dart';

class NavigationRouteManager implements NavigationRouteService {
  @override
  Route generateRoute(RouteSettings settings) {
    var navigation = _getNavigationPage(settings.name ?? NavigationPages.initial.toString());

    switch (navigation) {
      case NavigationPages.initial:
        final argument = _getData<String>(settings.arguments) ?? '';
        return _normalNavigate(ExamplePage(property: argument));

      default:
        return _normalNavigate(const ExamplePage());
    }
  }

  MaterialPageRoute _normalNavigate(Widget widget, {RouteSettings? settings, bool isFullScreen = false}) {
    return MaterialPageRoute(builder: (context) => widget, settings: settings, fullscreenDialog: isFullScreen);
  }

  NavigationPages? _getNavigationPage(String name) {
    return name == '/'
        ? NavigationPages.initial
        : NavigationPages.values.firstWhere((element) => element.toString() == name);
  }

  T? _getData<T>(Object? arguments) {
    return arguments is T ? arguments : null;
  }
}
