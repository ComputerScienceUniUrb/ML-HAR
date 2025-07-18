// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_shell_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$appShellNotifierHash() => r'5065370d30bd5480d70bfb5fda24bd6f66687b08';

/// See also [AppShellNotifier].
@ProviderFor(AppShellNotifier)
final appShellNotifierProvider =
    AutoDisposeNotifierProvider<AppShellNotifier, AppShellState>.internal(
  AppShellNotifier.new,
  name: r'appShellNotifierProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$appShellNotifierHash,
  dependencies: <ProviderOrFamily>[getNavigationShellProvider],
  allTransitiveDependencies: <ProviderOrFamily>{
    getNavigationShellProvider,
    ...?getNavigationShellProvider.allTransitiveDependencies
  },
);

typedef _$AppShellNotifier = AutoDisposeNotifier<AppShellState>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
