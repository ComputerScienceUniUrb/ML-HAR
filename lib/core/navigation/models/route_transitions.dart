import 'package:aifit/core/navigation/models/route_configuration.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';

/// An abstract class representing a route transition.
abstract class RouteTransition {
  /// Creates a const [RouteTransition].
  const RouteTransition();

  /// Builds a page transition for a given [AppRouteConfig].
  ///
  /// Takes an [AppRouteConfig] as input and returns a [GoRouterPageBuilder].
  ///
  /// The [GoRouterPageBuilder] is a function that takes a [BuildContext] and
  /// [GoRouterState] and returns a [Page].
  GoRouterPageBuilder pageBuilder(AppRouteConfig config);
}

/// A class representing a fade transition for a route.
class RouteFadeTransition extends RouteTransition {
  /// Whether the route transition is opaque.
  ///
  /// Defaults to `true`.
  final bool opaque;

  /// The duration of the fade transition.
  ///
  /// Defaults to `300` milliseconds.
  final Duration duration;

  /// Whether the transition will use a dynamic key.
  ///
  /// This is needed if the user can navigate to a route while
  /// being on the same route but with different parameter, so the
  /// screen would need to reload
  final bool needsDynamicKey;

  /// Creates a const [RouteFadeTransition].
  const RouteFadeTransition({
    this.opaque = true,
    this.duration = const Duration(milliseconds: 300),
    this.needsDynamicKey = false,
  });

  @override
  GoRouterPageBuilder pageBuilder(AppRouteConfig config) => (context, state) {
        final params = {
          ...state.pathParameters,
          ...state.uri.queryParameters,
        };

        final route = config.getRouteFromParams(params);

        return CustomTransitionPage(
          key: needsDynamicKey ? UniqueKey() : state.pageKey,
          child: route.toScreen(extra: state.extra),
          name: state.path,
          opaque: opaque,
          transitionDuration: duration,
          transitionsBuilder: (_, animation, __, child) {
            return FadeTransition(opacity: animation, child: child);
          },
        );
      };
}

/// A class representing no transition for a route.
class RouteNoTransition extends RouteTransition {
  /// Creates a const [RouteNoTransition].
  const RouteNoTransition();

  @override
  GoRouterPageBuilder pageBuilder(AppRouteConfig config) => (context, state) {
        final params = {
          ...state.pathParameters,
          ...state.uri.queryParameters,
        };

        final route = config.getRouteFromParams(params);

        return NoTransitionPage(
          key: state.pageKey,
          name: state.path,
          child: route.toScreen(extra: state.extra),
        );
      };
}

/// A class representing slide transition for a route.
class RouteSlideTransition extends RouteTransition {
  /// The duration of the slide transition.
  ///
  /// Defaults to `300` milliseconds.
  final Duration duration;

  /// Creates a const [RouteSlideTransition].
  const RouteSlideTransition({
    this.duration = const Duration(milliseconds: 300),
  });

  @override
  GoRouterPageBuilder pageBuilder(AppRouteConfig config) => (context, state) {
        final params = {
          ...state.pathParameters,
          ...state.uri.queryParameters,
        };

        final route = config.getRouteFromParams(params);

        return CustomTransitionPage(
          key: state.pageKey,
          name: state.path,
          child: route.toScreen(extra: state.extra),
          transitionDuration: duration,
          transitionsBuilder: (_, animation, __, child) {
            return SlideTransition(
              position: animation.drive(
                Tween(begin: const Offset(0.0, 1.0), end: Offset.zero)
                    .chain(CurveTween(curve: Curves.ease)),
              ),
              child: child,
            );
          },
        );
      };
}
