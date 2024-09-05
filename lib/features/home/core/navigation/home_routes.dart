import 'package:aifit/features/home/core/navigation/ar_tracking_route.dart';
import 'package:aifit/features/home/core/navigation/records_route.dart';
import 'package:aifit/features/home/core/navigation/sensors_tracking_route.dart';
import 'package:aifit/features/home/screens/home/home.dart';
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
          path: '/',
          builder: (context, goRouteState) => const HomeScreen(),
          routes: [
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
          ],
        );
}
