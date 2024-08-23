import 'package:aifit/core/utils/logger.dart';
import 'package:flutter/material.dart';

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
              devOutput = '';
              setState(() {});
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
