import 'package:aifit/core/utils/logger.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LogsScreen extends StatefulWidget {
  const LogsScreen({super.key});

  @override
  State<LogsScreen> createState() => _LogsScreenState();
}

class _LogsScreenState extends State<LogsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Logs'),
        actions: [
          IconButton(
            icon: const Icon(Icons.clear),
            color: Colors.red,
            onPressed: () {
              final dialog = AwesomeDialog(
                context: context,
                dialogType: DialogType.info,
                animType: AnimType.rightSlide,
                title: 'Sicuro di volere resettare i log?',
                btnCancelOnPress: () {

                },
                btnOkOnPress: () {
                  devOutput = '';
                  setState(() {});
                },
              );
              dialog.show();
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Text(
          devOutput,
          style: const TextStyle(fontSize: 12),
        ),
      ),
    );
  }
}
