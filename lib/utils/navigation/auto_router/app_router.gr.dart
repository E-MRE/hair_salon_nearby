// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_router.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    ExampleSecondRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ExampleSecondPage(),
      );
    },
    ExampleRoute.name: (routeData) {
      final args = routeData.argsAs<ExampleRouteArgs>(
          orElse: () => const ExampleRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: ExamplePage(
          key: args.key,
          property: args.property,
        ),
      );
    },
  };
}

/// generated route for
/// [ExampleSecondPage]
class ExampleSecondRoute extends PageRouteInfo<void> {
  const ExampleSecondRoute({List<PageRouteInfo>? children})
      : super(
          ExampleSecondRoute.name,
          initialChildren: children,
        );

  static const String name = 'ExampleSecondRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ExamplePage]
class ExampleRoute extends PageRouteInfo<ExampleRouteArgs> {
  ExampleRoute({
    Key? key,
    String? property,
    List<PageRouteInfo>? children,
  }) : super(
          ExampleRoute.name,
          args: ExampleRouteArgs(
            key: key,
            property: property,
          ),
          initialChildren: children,
        );

  static const String name = 'ExampleRoute';

  static const PageInfo<ExampleRouteArgs> page =
      PageInfo<ExampleRouteArgs>(name);
}

class ExampleRouteArgs {
  const ExampleRouteArgs({
    this.key,
    this.property,
  });

  final Key? key;

  final String? property;

  @override
  String toString() {
    return 'ExampleRouteArgs{key: $key, property: $property}';
  }
}
