import 'package:aifit/app/screens/app_shell/app_shell.dart';
import 'package:aifit/core/navigation/navigation_shell_provider.dart';
import 'package:aifit/features/home/core/navigation/home_routes.dart';
import 'package:aifit/features/settings/core/navigation/settings_routes.dart';
import 'package:aifit/features/settings/screens/user_details/user_details.dart';
import 'package:aifit/features/splash/screens/splash_screen.dart';
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
    navigatorKey: rootNavigatorKey,
    initialLocation: '/',
    debugLogDiagnostics: true,
    observers: [
      FlutterSmartDialog.observer,
      SentryNavigatorObserver(),
    ],
    routes: [
      GoRoute(
        path: '/',
        builder: (context, goRouteState) => const SplashScreen(),
      ),
      HomeRoutes(),
      // StatefulShellRoute.indexedStack(
      //   pageBuilder: (context, state, navigationShell) {
      //     return CustomTransitionPage(
      //       key: state.pageKey,
      //       child: ProviderScope(
      //         overrides: [
      //           getNavigationShellProvider.overrideWithValue(navigationShell),
      //         ],
      //         child: AppShell(
      //           navigationShell: navigationShell,
      //         ),
      //       ),
      //       transitionDuration: const Duration(milliseconds: 300),
      //       transitionsBuilder: (_, animation, __, child) {
      //         return FadeTransition(opacity: animation, child: child);
      //       },
      //     );
      //   },
      //   branches: [
      //     homeStatefulShell,
      //     settingsStatefulShell,
      //   ],
      // ),
      GoRoute(
        path: '/user-details',
        builder: (context, goRouteState) => const UserDetailsScreen(),
      ),
    ],
  );
}
