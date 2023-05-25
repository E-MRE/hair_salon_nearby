import 'package:flutter/material.dart';

import 'navigation_enum.dart';
import 'navigation_service.dart';

class NavigationManager extends NavigationService {
  @override
  Future<T?> navigateToPage<T>({required NavigationPages page, Object? data}) async {
    return await navigatorKey.currentState?.pushNamed(page.toString(), arguments: data);
  }

  @override
  Future<T?> navigateAndRemoveUntil<T>({required NavigationPages page, Object? data}) async {
    return await navigatorKey.currentState
        ?.pushNamedAndRemoveUntil(page.toString(), (Route<dynamic> route) => false, arguments: data);
  }

  @override
  void navigateToRoot() {
    navigatorKey.currentState?.popUntil((route) => route.isFirst);
  }
}
