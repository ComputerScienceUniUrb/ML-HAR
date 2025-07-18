import 'package:aifit/app/navitagion/routes/splash_route.dart';
import 'package:aifit/app/screens/app_shell/app_shell.dart';
import 'package:aifit/app/navitagion/app_routes.dart';
import 'package:aifit/core/navigation/navigation_shell_provider.dart';
import 'package:aifit/features/home/core/navigation/home_routes.dart';
import 'package:aifit/features/home/core/navigation/sensors_tracking_route.dart';
import 'package:aifit/features/session/navigation/sessions_routes.dart';
import 'package:aifit/features/settings/core/navigation/settings_routes.dart';
import 'package:aifit/features/settings/screens/user_details/user_details.dart';
import 'package:aifit/features/splash/screens/splash_screen.dart';
import 'package:aifit/features/wom/navigation/wom_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

final rootNavigatorKey = GlobalKey<NavigatorState>();
final appKey = GlobalKey<NavigatorState>();

late GoRouter goRouter;

void initializeGoRouter() {
  goRouter = GoRouter(
    extraCodec: const MyExtraCodec(),
    navigatorKey: rootNavigatorKey,
    initialLocation: const SplashRoute().toPath(),
    debugLogDiagnostics: true,
    observers: [
      FlutterSmartDialog.observer,
      SentryNavigatorObserver(),
    ],
    routes: [
      StatefulShellRoute.indexedStack(
        pageBuilder: (context, state, navigationShell) {
          return CustomTransitionPage(
            key: state.pageKey,
            child: ProviderScope(
              overrides: [
                getNavigationShellProvider.overrideWithValue(navigationShell),
              ],
              child: AppShell(
                navigationShell: navigationShell,
              ),
            ),
            transitionDuration: const Duration(milliseconds: 300),
            transitionsBuilder: (_, animation, __, child) {
              return FadeTransition(opacity: animation, child: child);
            },
          );
        },
        branches: [
          homeStatefulShell,
          sessionsStatefulShell,
          womStatefulShell,
          settingsStatefulShell,
        ],
      ),
      ...appRoutes,
    ],
  );
}
