import 'package:aifit/app/screens/app_shell/app_shell_provider.dart';
import 'package:aifit/app/screens/app_shell/widgets/navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class AppShell extends ConsumerWidget {
  final StatefulNavigationShell navigationShell;

  const AppShell({
    required this.navigationShell,
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(appShellNotifierProvider, (_, __) {});
    return Scaffold(
      extendBody: true,
      body: navigationShell,
      drawerEnableOpenDragGesture: false,
      bottomNavigationBar: Consumer(
        builder: (BuildContext context, WidgetRef ref, Widget? child) {
          ref.watch(appShellNotifierProvider
              .select((state) => state.activeTabsPaths));
          return child!;
        },
        child: const CustomNavigationBar(),
      ),
    );
  }
}
