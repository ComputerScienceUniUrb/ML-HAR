import 'package:aifit/features/home/screens/load_experiment.dart';
import 'package:aifit/features/home/screens/sensor_tracking/application/experiment_notifier.dart';
import 'package:aifit/features/session/models/activity_session.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class OpenedSessionWidget extends StatelessWidget {
  final ActivitySession session;

  const OpenedSessionWidget({required this.session, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          // title: Text('Session aperta alle iscrizioni'),
          ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const Center(
            child: Text(
              'Benvenuto in questa sessione!',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(height: 24),
          const Text('Resta in attesa dell\'avvio di un nuovo esperimento'),
          const SizedBox(height: 16),
          const Text('Dettaglio esperimento:'),
          const SizedBox(height: 16),
          if (session.selectedExperimentId != null)
            Consumer(
              builder: (BuildContext context, WidgetRef ref, Widget? child) {
                final experimentState = ref.watch(
                    getExperimentByIdProvider(session.selectedExperimentId!));
                return switch (experimentState) {
                  AsyncData(:final value) => value == null
                      ? const SizedBox.shrink()
                      : ExperimentInfo(
                          name: value.name,
                          duration: value.duration,
                          description: value.description,
                          activityType: value.activityTypeOverride,
                          smartphonePosition: value.smartphonePositionOverride,
                        ),
                  _ => const SizedBox.shrink(),
                };
              },
            ),
        ],
      ),
    );
  }
}
