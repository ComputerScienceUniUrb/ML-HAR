import 'package:aifit/app/navitagion/routes/splash_route.dart';
import 'package:aifit/core/navigation/models/route_configuration.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';

extension RouteExtensions on BuildContext {
  /// Navigates to a location.
  ///
  /// To pass complex and specific parameters that can't parsed,
  /// use the [extra] parameter.
  void goToRoute(AppRoute route, {Object? extra}) {
    if (GoRouter.maybeOf(this) == null) {
      return;
    }
    go(route.toPath(), extra: extra);
  }

  /// Pushes a location onto the page stack.
  ///
  /// To pass complex and specific parameters (that can't parsed),
  /// use the [extra] parameter.
  ///
  /// See also:
  /// * [pushReplacementRoute] which replaces the top-most page of the page stack and
  ///   always uses a new page key.
  /// * [replaceWithRoute] which replaces the top-most page of the page stack but treats
  ///   it as the same page. The page key will be reused. This will preserve the
  ///   state and not run any page animation.
  Future<T?> pushRoute<T extends Object?>(
    AppRoute route, {
    Object? extra,
  }) {
    if (GoRouter.maybeOf(this) == null) {
      return Future.value(null);
    }
    return push<T>(route.toPath(), extra: extra);
  }

  /// Pops current route.
  ///
  /// Check if the current route can be popped, and pops it if true.
  bool maybePop<T extends Object?>([T? result]) {
    if (GoRouter.maybeOf(this) == null) return false;
    if (!canPop()) return false;

    pop<T>(result);
    return true;
  }

  /// Replaces the top-most page of the page stack with the given URL location
  /// w/ optional query parameters, e.g. `/family/f2/person/p1?color=blue`.
  ///
  /// To pass complex and specific parameters that can't parsed,
  /// use the [extra] parameter.
  ///
  /// See also:
  /// * [goToRoute] which navigates to the location.
  /// * [pushRoute] which pushes the given location onto the page stack.
  /// * [replaceWithRoute] which replaces the top-most page of the page stack but treats
  ///   it as the same page. The page key will be reused. This will preserve the
  ///   state and not run any page animation.
  void pushReplacementRoute(AppRoute route, {Object? extra}) {
    return pushReplacement(route.toPath(), extra: extra);
  }

  /// Replaces the top-most page of the page stack with the given one but treats
  /// it as the same page.
  ///
  /// To pass complex and specific parameters that can't parsed,
  /// use the [extra] parameter.
  ///
  /// The page key will be reused. This will preserve the state and not run any
  /// page animation.
  ///
  /// See also:
  /// * [pushRoute] which pushes the given location onto the page stack.
  /// * [pushReplacementRoute] which replaces the top-most page of the page stack but
  ///   always uses a new page key.
  void replaceWithRoute(AppRoute route, {Object? extra}) {
    return replace(route.toPath(), extra: extra);
  }

  /// Pushes a location onto the page stack and removes all the pages above it.
  ///
  /// To pass complex and specific parameters that can't parsed,
  /// use the [extra] parameter.
  ///
  /// See also:
  /// * [pushRoute] which pushes the given location onto the page stack.
  /// * [pushReplacementRoute] which replaces the top-most page of the page stack but
  ///  always uses a new page key.
  Future<T?> pushAndPopUntilRoutePath<T extends Object?>(
    AppRoute route,
    String path, {
    Object? extra,
  }) {
    final currentConfiguration =
        GoRouter.of(this).routerDelegate.currentConfiguration;
    while (canPop() &&
        (currentConfiguration.matches.last.route as GoRoute).path != path) {
      currentConfiguration.remove(currentConfiguration.matches.last);
    }

    return pushRoute<T>(route, extra: extra);
  }

  /// Returns the name of the current route.
  ///
  /// Remember to navigate first then ask for the route in order to
  /// get the correct route name.
  String? getLastRoutePath() {
    final matchesList =
        GoRouter.of(this).routerDelegate.currentConfiguration.matches;

    if (matchesList.isEmpty) {
      return null;
    }

    return (matchesList.last.route as GoRoute).path;
  }
}

extension QueryParamsX on String? {
  /// Works similar as [Uri.queryParametersAll] but for a [String] instead.
  List<String> get queryParametersAll {
    if (this == null) return [];

    return this!.split(',');
  }

  bool get isSplashRoute {
    return this == '/${SplashRouteConfig.basePath}';
  }
}
