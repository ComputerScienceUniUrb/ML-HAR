import 'package:aifit/app/screens/app_shell/app_shell_state.dart';
import 'package:aifit/core/navigation/navigation_shell_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'app_shell_provider.g.dart';

@riverpod
class AppShellNotifier extends _$AppShellNotifier {
  /// Flag used to know if we are currently showing the DownTime snackbar.
  ///
  /// It's mainly used to avoid adding two times the same snackbar to the queue
  /// when resuming the app (after being in background)
  bool _isShowingDownTimeSnackBar = false;

  /// Flag used to know if we currently have an internet connection.
  ///
  /// It's mainly used to refresh the app if we come from a no connection state.
  bool _hasInternet = true;

  /// The NavigationShell that contains routes informations
  // final StatefulNavigationShell _navigationShell;

  @override
  AppShellState build() {
    return _start();
  }

  _start() {
    final activeTabsPaths = <String>[];
    ref.read(getNavigationShellProvider).route.branches.forEach((branch) {
      final path = branch.defaultRoute!.path;
      activeTabsPaths.add(path);
    });

    return AppShellState(
      activeTabsPaths: activeTabsPaths,
    );
  }
}
