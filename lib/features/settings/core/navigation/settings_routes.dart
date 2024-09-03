import 'package:aifit/features/settings/screens/logs/logs_screen.dart';
import 'package:aifit/features/settings/screens/settings/settings_screen.dart';
import 'package:aifit/features/settings/screens/user_details/user_details.dart';
import 'package:aifit/features/settings/screens/user_height/user_height.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final _shellNavigatorSettingsKey = GlobalKey<NavigatorState>();
final settingsStatefulShell = StatefulShellBranch(
  navigatorKey: _shellNavigatorSettingsKey,
  routes: [SettingsRoutes()],
);

class SettingsRoutes extends GoRoute {
  SettingsRoutes()
      : super(
          path: '/settings',
          builder: (context, goRouteState) => const SettingsScreen(),
          routes: [
            GoRoute(
              path: 'logs',
              builder: (context, goRouteState) => const LogsScreen(),
            ),
            GoRoute(
              path: 'user-details',
              builder: (context, goRouteState) => const UserDetailsScreen(),
              routes: [
                GoRoute(
                  path: 'height',
                  builder: (context, goRouteState) => const HeightScreen(),
                ),
              ]
            ),
          ],
        );
}
