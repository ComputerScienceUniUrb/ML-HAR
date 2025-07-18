import 'package:aifit/constants.dart';
import 'package:aifit/core/navigation/route_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

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
          ListTile(
            onTap: () {
              final encodedUrl =
              Uri.encodeComponent(privacyPolicyUrl);
              context.push(
                  '/webview?title=Privacy%20Policy&url=$encodedUrl');

            },
            title: const Text('Privacy Policy'),
          ),
          ListTile(
            onTap: () {
              final encodedUrl = Uri.encodeComponent(
                  'https://docs.google.com/gview?embedded=true&url=$acceptanceUrl');
              context.push(
                  '/webview?title=Consenso%20Informato&url=$encodedUrl');

            },
            title: const Text('Assenso'),
          ),
        ],
      ),
    );
  }
}
