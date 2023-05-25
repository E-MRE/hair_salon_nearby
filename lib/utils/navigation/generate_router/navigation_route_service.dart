import 'package:flutter/material.dart';

///Sayfa yönlendirmede route operasyonları için kullanılır.
abstract class NavigationRouteService {
  Route<dynamic> generateRoute(RouteSettings settings);
}
