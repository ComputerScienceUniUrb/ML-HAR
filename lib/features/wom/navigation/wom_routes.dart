import 'package:aifit/app/database/database.dart';
import 'package:aifit/core/data/experiment/models/experiment.dart';
import 'package:aifit/core/ui/missing_params_screen.dart';
import 'package:aifit/features/home/core/navigation/ar_tracking_route.dart';
import 'package:aifit/features/home/core/navigation/records_route.dart';
import 'package:aifit/features/home/core/navigation/sensors_tracking_route.dart';
import 'package:aifit/features/home/screens/home/home.dart';
import 'package:aifit/features/home/screens/load_experiment.dart';
import 'package:aifit/features/scan/scan_screen.dart';
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

final _shellNavigatorWomKey = GlobalKey<NavigatorState>();

final womStatefulShell = StatefulShellBranch(
  navigatorKey: _shellNavigatorWomKey,
  routes: [WomRoutes()],
);

class WomRoutes extends GoRoute {
  WomRoutes()
      : super(
          path: '/wom',
          builder: (context, goRouteState) => const WomScreen(),
          routes: [
            GoRoute(
              path: 'details',
              builder: (context, goRouteState) {
                final womTransaction = goRouteState.extra as WomTransaction?;
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
          ],
        );
}
