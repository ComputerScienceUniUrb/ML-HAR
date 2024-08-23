import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';

extension RouteExtensions on BuildContext {
  /// Navigates to a location.
  ///
  /// To pass complex and specific parameters that can't parsed,
  /// use the [extra] parameter.
  void goToRoute(String path, {Object? extra}) {
    if (GoRouter.maybeOf(this) == null) {
      return;
    }
    go(path, extra: extra);
  }

  Future<T?> pushRoute<T extends Object?>(
      String path, {
        Object? extra,
      }) {
    if (GoRouter.maybeOf(this) == null) {
      return Future.value(null);
    }
    return push<T>(path, extra: extra);
  }
}
