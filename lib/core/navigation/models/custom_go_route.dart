import 'package:aifit/core/navigation/go_router.dart';
import 'package:aifit/core/navigation/models/route_configuration.dart';
import 'package:aifit/core/navigation/utils/route_extensions.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';

class CustomGoRoute extends GoRoute {
  final AppRouteConfig config;

  CustomGoRoute({
    required this.config,
    super.routes,
    GoRouterRedirect? redirect,
    GlobalKey<NavigatorState>? parentNavigatorKey,
    bool isRootNavigatorChild = true,
  }) : super(
          path: config.fullPath,
          redirect: (context, state) {
            if (state.uri.toString().isSplashRoute) return null;

            return redirect?.call(context, state);
          },
          parentNavigatorKey: parentNavigatorKey ??
              (isRootNavigatorChild ? rootNavigatorKey : null),
          builder: (_, state) {
            final params = {
              ...state.pathParameters,
              ...state.uri.queryParameters,
            };

            final route = config.getRouteFromParams(params);
            final extra = state.extra;

            return route.toScreen(extra: extra);
          },
          pageBuilder: null,
        );
}

class CustomShellRoute extends CustomGoRoute {
  CustomShellRoute({
    required super.config,
    required super.routes,
    super.redirect,
    super.parentNavigatorKey,
  });
}
