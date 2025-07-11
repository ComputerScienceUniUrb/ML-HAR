import 'package:aifit/core/data/firestore_reference.dart';
import 'package:aifit/features/session/models/player.dart';
import 'package:aifit/main.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

class PlayerSubscriptionWidget extends StatefulWidget {
  final String sessionId;

  const PlayerSubscriptionWidget({required this.sessionId, super.key});

  @override
  State<PlayerSubscriptionWidget> createState() =>
      _PlayerSubscriptionWidgetState();
}

class _PlayerSubscriptionWidgetState extends State<PlayerSubscriptionWidget> {
  // Chiave per validare il nostro form
  final _formKey = GlobalKey<FormState>();

  // Controller per leggere il valore del campo di testo
  final _nameController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

 /* Future<void> _subscribePlayer() async {
    if (_formKey.currentState!.validate()) {
      final playerName = _nameController.text.trim();
      final player = Player(
        id: const Uuid().v4(),
        name: playerName,
        subscribedOn: DateTime.now(),
      );

      try {
        await FirestoreReference.playerDoc(widget.sessionId, player.id)
            .set(player.toJson());

        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Benvenuto, $playerName! Iscrizione avvenuta.'),
              backgroundColor: Colors.green,
            ),
          );
        }
      } catch (e) {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Errore durante l\'iscrizione: $e'),
              backgroundColor: Colors.red,
            ),
          );
        }
      }
    }
  }*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Iscrizione alla sessione'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}
