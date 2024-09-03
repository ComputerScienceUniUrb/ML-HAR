import 'package:aifit/core/navigation/route_extensions.dart';
import 'package:aifit/features/settings/screens/user_height/application/height_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UserDetailsScreen extends ConsumerWidget {
  const UserDetailsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userHeight = ref.watch(heightNotifierProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text('User details'),
      ),
      body: ListView(
        children: [
          ListTile(
            onTap: (){
              context.pushRoute('/settings/user-details/height');
            },
            title: Text('Altezza'),
            trailing: Text(userHeight.toString()),
          ),
        ],
      ),
    );
  }
}
