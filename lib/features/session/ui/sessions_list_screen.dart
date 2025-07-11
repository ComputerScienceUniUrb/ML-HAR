import 'package:aifit/features/session/application/session_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SessionsListScreen extends ConsumerWidget {
  const SessionsListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Osserva il provider che restituisce i dati già raggruppati
    final asyncGroupedSessions = ref.watch(groupedSessionsProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Le tue Sessioni'),
      ),
      body: asyncGroupedSessions.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stack) => Center(child: Text('Errore: $error')),
        data: (sessions) {
          if (sessions.isEmpty) {
            return const Center(child: Text('Nessuna sessione trovata.'));
          }
          // ListView per le sessioni
          return ListView.builder(
            itemCount: sessions.length,
            itemBuilder: (context, index) {
              final session = sessions[index];
              return Card(
                margin: const EdgeInsets.all(8.0),
                child: ExpansionTile(
                  title: Text(
                    'Sessione: ${session.sessionId}',
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text('${session.tracks.length} tracce registrate'),
                  children: [
                    // Lista delle tracce per QUESTA sessione
                    ...session.tracks.map((track) {
                      return ListTile(
                        leading: const Icon(Icons.sensors),
                        title: Text('Traccia ID: ${track.id}'),
                        subtitle: Text('Tipo: ${track.activityType?.name}'),
                      );
                    }).toList(),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}