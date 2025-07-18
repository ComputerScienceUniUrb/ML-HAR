import 'package:aifit/core/navigation/models/route_configuration.dart';
import 'package:aifit/features/splash/screens/splash_screen.dart';
import 'package:flutter/material.dart';

class SplashRouteConfig extends AppRouteConfig {
  static const basePath = 'splash';

  @override
  final fullPath = '/$basePath';

  @override
  bool hasValidParams(Map<String, String> params, {Object? extra}) {
    return true;
  }

  @override
  AppRoute getRouteFromParams(Map<String, String> params) {
    return const SplashRoute();
  }
}

class SplashRoute extends AppRoute {
  const SplashRoute();

  @override
  String toPath() {
    return '/${SplashRouteConfig.basePath}';
  }

  @override
  Widget toScreen({Object? extra}) {
    return const SplashScreen();
  }

  @override
  List<Object?> get props => [];
}
