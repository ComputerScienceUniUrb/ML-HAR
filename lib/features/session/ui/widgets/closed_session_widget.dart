import 'package:aifit/app/database/database.dart';
import 'package:aifit/features/session/application/session_notifier.dart';
import 'package:aifit/features/session/models/activity_session.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ClosedSessionWidget extends StatelessWidget {
  final ActivitySession session;

  const ClosedSessionWidget({required this.session, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Session Chiusa'),
      ),
      body: ListView(
        children: [
          TestListWidget(
            sessionId: session.id,
          ),
        ],
      ),
    );
  }
}

class TestListWidget extends ConsumerWidget {
  final String sessionId;

  const TestListWidget({required this.sessionId, super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final listState = ref.watch(getTestsBySessionIdProvider(sessionId));
    return switch (listState) {
      AsyncData(:final value) => Column(
          children: [
            Text('Hai partecipato a ${value.length} test'),
            for (final test in value) ...[
              ListTile(
                title: Text(
                  test.id.toString(),
                ),
                isThreeLine: true,
                subtitle: Text('ExId: ${test.experimentId}\n ${test.testDuration} secondi'),
              )
            ],
          ],
        ),
      AsyncLoading() => const Center(child: CircularProgressIndicator()),
      _ => const SizedBox(),
    };
  }
}
