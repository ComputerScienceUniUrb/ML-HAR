import 'package:aifit/core/navigation/route_extensions.dart';
import 'package:aifit/features/settings/screens/user_details/application/user_details_notifier.dart';
import 'package:aifit/features/settings/screens/user_details/user_details_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UserDetailsScreen extends ConsumerWidget {
  const UserDetailsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userData = ref.watch(userDetailsNotifierProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text('User details'),
      ),
      // body: ListView(
      //   children: [
      //     ListTile(
      //       onTap: (){
      //         editInfo(context);
      //       },
      //       title: Text('Età'),
      //       trailing: Text(userData.age.toString()),
      //     ),
      //     ListTile(
      //       onTap: (){
      //         editInfo(context);
      //       },
      //       title: Text('Genere'),
      //       trailing: Text(userData.gender?.name.toString() ?? '-'),
      //     ),
      //     ListTile(
      //       onTap: (){
      //         editInfo(context);
      //       },
      //       title: Text('Altezza'),
      //       trailing: Text(userData.height.toString()),
      //     ),
      //     ListTile(
      //       onTap: (){
      //         editInfo(context);
      //       },
      //       title: Text('Peso'),
      //       trailing: Text(userData.weight.toString()),
      //     ),
      //   ],
      // ),
      body: UserDetailsFormScreen(),
    );
  }

  editInfo(BuildContext context){
    context.pushRoute('/settings/user-details/edit');
  }
}
