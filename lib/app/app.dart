import 'package:aifit/core/navigation/go_router.dart';
import 'package:flutter/material.dart';

class AIFitApp extends StatelessWidget {
  const AIFitApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routerConfig: goRouter,
    );
  }
}
