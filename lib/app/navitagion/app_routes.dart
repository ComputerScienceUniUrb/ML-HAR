import 'package:aifit/app/navitagion/routes/splash_route.dart';
import 'package:aifit/core/navigation/go_router.dart';
import 'package:aifit/core/navigation/models/custom_go_route.dart';
import 'package:aifit/core/ui/missing_params_screen.dart';
import 'package:aifit/features/intro/ui/intro_screen.dart';
import 'package:aifit/features/scan/scan_screen.dart';
import 'package:aifit/features/session/ui/session_screen.dart';
import 'package:aifit/features/settings/screens/user_details/user_details.dart';
import 'package:aifit/features/webview/webview_screen.dart';
import 'package:go_router/go_router.dart';

final appRoutes = <GoRoute>[
  CustomGoRoute(config: SplashRouteConfig()),
  GoRoute(
    path: '/intro',
    builder: (context, goRouteState) {
      return const IntroScreen();
    },
  ),
  GoRoute(
    path: '/webview',
    builder: (context, goRouteState) {
      final title = goRouteState.uri.queryParameters['title'] ?? '';
      final url = goRouteState.uri.queryParameters['url'] ?? '';

      if (title.isEmpty || url.isEmpty) {
        return const MissingParamsScreen(param: 'title or url');
      }
      return WebViewScreen(title: title, url: url);
    },
  ),
  GoRoute(
    path: '/scan',
    builder: (context, goRouteState) {
      return const ScanScreen();
    },
  ),
  GoRoute(
    path: '/user-details',
    builder: (context, goRouteState) {
      return const UserDetailsScreen();
    },
  ),
  GoRoute(
    path: '/session/:sessionId',
    parentNavigatorKey: rootNavigatorKey,
    builder: (context, goRouteState) {
      final sessionId = goRouteState.pathParameters['sessionId'];
      if (sessionId == null) {
        return const MissingParamsScreen(
          param: 'sessionId',
        );
      }
      return SessionScreen(sessionId: sessionId);
    },
  ),
];
