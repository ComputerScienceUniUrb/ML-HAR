import 'package:aifit/core/data/experiment/models/experiment.dart';
import 'package:aifit/features/home/core/navigation/ar_tracking_route.dart';
import 'package:aifit/features/home/core/navigation/records_route.dart';
import 'package:aifit/features/home/core/navigation/sensors_tracking_route.dart';
import 'package:aifit/features/home/screens/home/home.dart';
import 'package:aifit/features/home/screens/load_experiment.dart';
import 'package:aifit/features/home/screens/scan_screen.dart';
import 'package:aifit/features/home/screens/sensor_tracking/ui/sensor_tracking.dart';
import 'package:aifit/features/home/screens/test_selection_screen.dart';
import 'package:aifit/features/home/screens/test_setup_screen.dart';
import 'package:aifit/features/settings/core/navigation/settings_routes.dart';
import 'package:aifit/features/settings/screens/user_details/user_details.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final _shellNavigatorHomeKey = GlobalKey<NavigatorState>();

final homeStatefulShell = StatefulShellBranch(
  navigatorKey: _shellNavigatorHomeKey,
  routes: [HomeRoutes()],
);

class HomeRoutes extends GoRoute {
  HomeRoutes()
      : super(
          path: '/home',
          builder: (context, goRouteState) => const HomeScreen(),
          routes: [
            GoRoute(
              path: 'user-details',
              builder: (context, goRouteState) => const UserDetailsScreen(),
            ),
            GoRoute(
              path: 'set-test',
              builder: (context, goRouteState) {
                final experiment = goRouteState.extra as Experiment?;
                return TestSetupScreen(
                  initialExperiment: experiment,
                );
              },
            ),
            GoRoute(
                path: 'load-experiment',
                builder: (context, goRouteState) {
                  final sc = goRouteState.pathParameters['shortCode'];
                  return LoadExperimentScreen(
                    initialShortCode: sc,
                  );
                },
                routes: [
                  GoRoute(
                    path: 'set-test',
                    builder: (context, goRouteState) {
                      final experiment = goRouteState.extra as Experiment?;
                      return TestSetupScreen(
                        initialExperiment: experiment,
                      );
                    },
                  ),
                ]),
            GoRoute(
              path: 'scan',
              builder: (context, goRouteState) {
                // final sc = goRouteState.pathParameters['shortCode'];
                return ScanScreen();
              },
            ),
            ARTrackingRoute(
              routes: [
                RecordsRoute(),
              ],
            ),
            SensorsTrackingRoute(
              routes: [
                GoRoute(
                  path: 'user-details',
                  builder: (context, goRouteState) => const UserDetailsScreen(),
                ),
              ],
            ),
            SettingsRoutes(),
          ],
        );
}
