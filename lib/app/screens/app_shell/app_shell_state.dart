import 'package:equatable/equatable.dart';

class AppShellState extends Equatable {

  /// Contains the list of all active tabs paths
  ///
  /// For example, if the rewards tab is not enabled, the AppShell will contain
  /// all tabs but this list will not contain its path, which makes navigation
  /// to it impossible.
  final List<String> activeTabsPaths;

  /// Workaround for the [following issue](https://github.com/MGMResorts/mobile-indigo/pull/3418#pullrequestreview-1295891138)
  ///
  /// We are adding fake padding to the bottom of a list for each page
  /// because for transparent bottom navigation bar
  /// we need to have Scaffold.extendBody = true and it covers the bottom part
  /// of a page.
  final double bottomNavigationHeight;

  /// Height of the header to apply in the shell screens.
  final double headerHeight;

  /// Last time we refreshed the app.
  final int? lastRefreshTimestamp;


  const AppShellState({
    this.bottomNavigationHeight = 0,
    this.headerHeight = 0,
    this.lastRefreshTimestamp,
    this.activeTabsPaths = const [],
  });

  /// Wether we should refresh the app or not.
  ///
  /// Returns `true` if the app hasn't been refresh in the last 60 seconds.
  bool get shouldRefreshOnResume {
    final sixtySecondsInMillis = const Duration(seconds: 60).inMilliseconds;
    final nowTimestamp = DateTime.now().millisecondsSinceEpoch;

    final passedTime = nowTimestamp - (lastRefreshTimestamp ?? nowTimestamp);
    return passedTime > sixtySecondsInMillis;
  }

  AppShellState copyWith({
    bool? shouldShowRewardsTab,
    bool? isNewProfileMenuEnabled,
    bool? isResortsTabEnabled,
    double? bottomNavigationHeight,
    double? headerHeight,
    int? lastRefreshTimestamp,
    List<String>? activeTabsPaths,
  }) {
    return AppShellState(

      bottomNavigationHeight:
          bottomNavigationHeight ?? this.bottomNavigationHeight,
      headerHeight: headerHeight ?? this.headerHeight,
      lastRefreshTimestamp: lastRefreshTimestamp ?? this.lastRefreshTimestamp,
         activeTabsPaths: activeTabsPaths ?? this.activeTabsPaths,
    );
  }

  @override
  List<Object?> get props => [
        bottomNavigationHeight,
        headerHeight,
        lastRefreshTimestamp,
        activeTabsPaths,
      ];
}
