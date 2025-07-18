import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';

/// The configuration of an [AppRoute].
abstract class AppRouteConfig extends Equatable {
  /// The full path of the route.
  ///
  /// It should include the complete path for this route,
  /// including also the pathParameters scheme when needed.
  ///
  /// ```dart
  /// @override
  /// String get fullPath => '/feature/screen/:path_param';
  /// ```
  abstract final String fullPath;

  /// Determines the allowed [UserState]s the route requires before
  /// entering it.
  ///
  /// This is mainly used in the [AuthGuard] class.
  ///
  /// It is a [List] because a route can allow different user states.
  /// - [UserState.loggedOut] if the route requires the user to be logged out
  /// e.g. login and register.
  /// - [UserState.transientUser] if the route requires the user to be a
  /// transient user.
  /// e.g. join mgm rewards.
  /// - [UserState.loggedIn] if the route requires the user to be logged in
  /// e.g. profile. will be redirected to the login page.
  ///
  /// - [null] default value, the route doesn't requires any user state
  /// to be accessed.
  // List<UserState>? get allowedAuthenticationStates => null;

  /// The key to be representing this route for analytics purposes.
  ///
  /// If null, the screen event will not emit automatically.
  // String? get analyticsPageState => null;

  const AppRouteConfig();

  /// Validates if [params] has the correct param values
  /// for this route
  bool hasValidParams(Map<String, String> params, {Object? extra});

  /// Converts [params] into [AppRoute].
  AppRoute getRouteFromParams(Map<String, String> params);

  @override
  List<Object?> get props => [fullPath];
}

/// The route represented by a [AppRoute] object.
abstract class AppRoute extends Equatable {
  const AppRoute();

  /// Converts the route into a URI scheme path.
  ///
  /// It should include all the query and path parameters.
  String toPath();

  /// Converts this route to a widget screen.
  ///
  /// [extra] is an optional parameter that can be used
  /// to pass complex objects that can't be parsed using [toPath].
  Widget toScreen({covariant Object? extra});
}

extension AppRouteX on AppRoute {
  Uri get toUri {
    return Uri.parse(toPath());
  }
}
