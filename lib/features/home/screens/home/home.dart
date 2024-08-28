import 'package:aifit/core/navigation/route_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: ListView(
        children: const [
          Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: NavItem(
                  text: 'AR Tracking',
                  path: '/ar-tracking',
                ),
              ),
              Expanded(
                child: NavItem(
                  text: 'Sensors Tracking',
                  path: '/sensors-tracking',
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class NavItem extends StatelessWidget {
  final String text;
  final String path;
  final Function()? onTap;

  const NavItem({
    required this.text,
    required this.path,
    super.key,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.pushRoute(path);
      },
      child: AspectRatio(
        aspectRatio: 1,
        child: Card(
          child: Center(child: Text(text)),
        ),
      ),
    );
  }
}
