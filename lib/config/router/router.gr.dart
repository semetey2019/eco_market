// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i3;
import 'package:eco_market/features/about/presentation/pages/about/about_page.dart'
    as _i1;
import 'package:eco_market/features/card/presentation/pages/cart/placing_an_order_page.dart'
    as _i2;

abstract class $AppRouter extends _i3.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i3.PageFactory> pagesMap = {
    AboutRoute.name: (routeData) {
      return _i3.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.AboutPage(),
      );
    },
    PlacingAnOrderRoute.name: (routeData) {
      return _i3.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.PlacingAnOrderPage(),
      );
    },
  };
}

/// generated route for
/// [_i1.AboutPage]
class AboutRoute extends _i3.PageRouteInfo<void> {
  const AboutRoute({List<_i3.PageRouteInfo>? children})
      : super(
          AboutRoute.name,
          initialChildren: children,
        );

  static const String name = 'AboutRoute';

  static const _i3.PageInfo<void> page = _i3.PageInfo<void>(name);
}

/// generated route for
/// [_i2.PlacingAnOrderPage]
class PlacingAnOrderRoute extends _i3.PageRouteInfo<void> {
  const PlacingAnOrderRoute({List<_i3.PageRouteInfo>? children})
      : super(
          PlacingAnOrderRoute.name,
          initialChildren: children,
        );

  static const String name = 'PlacingAnOrderRoute';

  static const _i3.PageInfo<void> page = _i3.PageInfo<void>(name);
}
