import 'package:flutter/material.dart';

class MissingParamsScreen extends StatelessWidget {
  final String param;
  const MissingParamsScreen({super.key, required this.param});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(child: Text("$param mancante")),
    );
  }
}
