import 'package:aifit/app/database/database.dart';
import 'package:aifit/core/data/experiment/models/experiment.dart';
import 'package:aifit/core/ui/missing_params_screen.dart';
import 'package:aifit/features/home/core/navigation/ar_tracking_route.dart';
import 'package:aifit/features/home/core/navigation/records_route.dart';
import 'package:aifit/features/home/core/navigation/sensors_tracking_route.dart';
import 'package:aifit/features/home/screens/home/home.dart';
import 'package:aifit/features/home/screens/load_experiment.dart';
import 'package:aifit/features/home/screens/scan_screen.dart';
import 'package:aifit/features/home/screens/sensor_tracking/ui/sensor_tracking.dart';
import 'package:aifit/features/home/screens/test_selection_screen.dart';
import 'package:aifit/features/home/screens/test_setup_screen.dart';
import 'package:aifit/features/session/ui/session_screen.dart';
import 'package:aifit/features/session/ui/sessions_list_screen.dart';
import 'package:aifit/features/settings/core/navigation/settings_routes.dart';
import 'package:aifit/features/settings/screens/user_details/user_details.dart';
import 'package:aifit/features/wom/ui/wom_details_screen.dart';
import 'package:aifit/features/wom/ui/wom_screen.dart';
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
            ),GoRoute(
              path: 'sessions',
              builder: (context, goRouteState) => const SessionsListScreen(),
            ),
            GoRoute(
                path: 'wom',
                builder: (context, goRouteState) => const WomScreen(),
                routes: [
                  GoRoute(
                    path: 'details',
                    builder: (context, goRouteState) {
                      final womTransaction =
                          goRouteState.extra as WomTransaction?;
                      if (womTransaction == null) {
                        return const MissingParamsScreen(
                          param: 'womTransaction',
                        );
                      }
                      return WomDetailsScreen(
                        womTransaction: womTransaction,
                      );
                    },
                  ),
                ]),
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
              path: 'session/:sessionId',
              builder: (context, goRouteState) {
                final sessionId = goRouteState.pathParameters['sessionId'];
                if (sessionId == null) {
                  return const MissingParamsScreen(
                    param: 'sessionId',
                  );
                }
                return SessionScreen(
                  sessionId: sessionId,
                );
              },
            ),
            GoRoute(
              path: 'load-experiment',
              builder: (context, goRouteState) {
                final shortCode = goRouteState.uri.queryParameters['shortCode'];
                final experimentId =
                    goRouteState.uri.queryParameters['experimentId'];
                return LoadExperimentScreen(
                  initialShortCode: shortCode,
                  experimentId: experimentId,
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
              ],
            ),
            // GoRoute(
            //   path: 'load-experiment',
            //   builder: (context, goRouteState) {
            //     final sc = goRouteState.pathParameters['shortCode'];
            //     return LoadExperimentScreen(
            //       initialShortCode: sc,
            //     );
            //   },
            //   routes: [
            //     GoRoute(
            //       path: 'set-test',
            //       builder: (context, goRouteState) {
            //         final experiment = goRouteState.extra as Experiment?;
            //         return TestSetupScreen(
            //           initialExperiment: experiment,
            //         );
            //       },
            //     ),
            //   ],
            // ),
            GoRoute(
              path: 'scan',
              builder: (context, goRouteState) {
                // final sc = goRouteState.pathParameters['shortCode'];
                return const ScanScreen();
              },
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
