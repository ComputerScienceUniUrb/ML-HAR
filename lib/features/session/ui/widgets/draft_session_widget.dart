import 'package:aifit/features/session/models/activity_session.dart';
import 'package:aifit/features/session/models/player.dart';
import 'package:flutter/material.dart';

class DraftSessionWidget extends StatelessWidget {
  final ActivitySession session;
  final Player player;

  const DraftSessionWidget({
    required this.session,
    super.key,
    required this.player,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Session incompleta'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const Column(
            children: [
              Text('Benvenuto in questa sessione!'),
            ],
          ),
          Center(
            child: Text(
              session.name,
              style: const TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
            ),
          ),
          const Center(child: Text('Sei registrato con il numero:')),
          Center(
            child: Text(
              player.id,
              style: const TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
            ),
          ),
          const Center(
            child: Text(
              'Resta in questa pagina e attendi che la sessione inizi.',
            ),
          ),
        ],
      ),
    );
  }
}
