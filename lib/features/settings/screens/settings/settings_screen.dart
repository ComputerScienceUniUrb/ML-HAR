import 'package:aifit/core/navigation/route_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: ListView(
        children: [
          ListTile(
            onTap: () {
              context.pushRoute('/settings/logs');
            },
            title: const Text('Logs'),
          ),
          ListTile(
            onTap: () {
              context.pushRoute('/settings/user-details');
            },
            title: const Text('User details'),
          ),
        ],
      ),
    );
  }
}
