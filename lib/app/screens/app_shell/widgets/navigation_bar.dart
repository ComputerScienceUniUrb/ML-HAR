import 'package:aifit/app/screens/app_shell/app_shell_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class CustomNavigationBar extends ConsumerStatefulWidget {
  const CustomNavigationBar({super.key});

  @override
  ConsumerState<CustomNavigationBar> createState() =>
      _CustomNavigationBarState();
}

class _CustomNavigationBarState extends ConsumerState<CustomNavigationBar> {
  @override
  Widget build(BuildContext context) {
    // final state = ref.watch(appShellNotifierProvider);
    return BottomNavigationBar(
      // backgroundColor: VegaBottomNavBarColors.backgroundColor,
      // selectedFontSize: VegaBottomNavBarTypography.textStyle(
      //   isSelected: true,
      // ).fontSize!,
      // unselectedFontSize: VegaBottomNavBarTypography.textStyle(
      //   isSelected: false,
      // ).fontSize!,
      elevation: 0.0,
      type: BottomNavigationBarType.fixed,
      items: const [
        BottomNavigationBarItem(
          icon: Padding(
            padding: EdgeInsets.all(2),
            child: Icon(Icons.home),
          ),
          activeIcon: Padding(
            padding: EdgeInsets.all(2),
            child: Icon(
              Icons.home,
              color: Colors.orange,
            ),
          ),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Padding(
            padding: EdgeInsets.all(2),
            child: Icon(Icons.settings),
          ),
          activeIcon: Padding(
            padding: EdgeInsets.all(2),
            child: Icon(
              Icons.settings,
              color: Colors.orange,
            ),
          ),
          label: 'Settings',
        ),
      ],
      onTap: (index) => _onItemTap(index),
      // selectedLabelStyle: VegaBottomNavBarTypography.textStyle(
      //   isSelected: true,
      // ),
      // unselectedLabelStyle: VegaBottomNavBarTypography.textStyle(
      //   isSelected: false,
      // ),
      // selectedItemColor: VegaBottomNavBarColors.textColor(
      //   isSelected: true,
      // ),
      // unselectedItemColor: VegaBottomNavBarColors.textColor(
      //   isSelected: false,
      // ),
      currentIndex: _getBottomNavigationIndex(context),
    );
  }

  int _getBottomNavigationIndex(BuildContext context) {
    final activeTabsPaths = ref.read(appShellNotifierProvider).activeTabsPaths;
    if (activeTabsPaths.isEmpty) {
      return 0;
    }
    final goRouter = GoRouter.of(context);
    final fullPath = GoRouterState.of(context).fullPath!;
    final path = fullPath.split('/')[1];
    final selectedTabIndex = activeTabsPaths.indexOf('/$path');
    // final routes = goRouter.routerDelegate.currentConfiguration.routes;
    // if (selectedTabIndex < 0) {
    //   WidgetsBinding.instance.addPostFrameCallback((_) {
    //     context.goToRoute('/');
    //   });
    // }
    return selectedTabIndex < 0 ? 0 : selectedTabIndex;
  }

  void _onItemTap(int index) {
    final nextPath = ref.read(appShellNotifierProvider).activeTabsPaths[index];
    context.go(nextPath);
  }
}
