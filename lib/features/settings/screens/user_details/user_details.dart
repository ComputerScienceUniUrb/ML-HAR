import 'package:aifit/features/settings/screens/user_details/application/user_details_notifier.dart';
import 'package:aifit/features/settings/screens/user_details/user_details_form.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class UserDetailsScreen extends ConsumerWidget {
  const UserDetailsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userInfo = ref.watch(userDetailsNotifierProvider).valueOrNull;

    return Scaffold(
      appBar: AppBar(
        title: const Text('User details'),
        actions: [
          IconButton(
            onPressed: () {
              final dialog = AwesomeDialog(
                context: context,
                dialogType: DialogType.info,
                animType: AnimType.rightSlide,
                title: 'Sicuro di volere resettare i dati?',
                btnCancelOnPress: () {},
                btnOkOnPress: () {
                  ref.read(userDetailsNotifierProvider.notifier).clearAll();
                },
              );
              dialog.show();
            },
            icon: const Icon(Icons.clear),
          ),
        ],
      ),
      body: userInfo == null
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : UserDetailsFormScreen(
              initialUserInfo: userInfo,
            ),
    );
  }
}
