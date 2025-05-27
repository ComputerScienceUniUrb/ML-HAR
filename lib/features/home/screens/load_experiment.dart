import 'package:aifit/features/home/screens/sensor_tracking/ui/sensor_tracking.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:aifit/core/data/experiment/models/experiment.dart';
import 'package:aifit/features/home/screens/sensor_tracking/application/experiment_notifier.dart';

class LoadExperimentScreen extends HookConsumerWidget {
  final String? initialShortCode;

  const LoadExperimentScreen({
    super.key,
    this.initialShortCode,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final experimentController = useTextEditingController();
    final shortCode = useState<String?>(initialShortCode);

    return Scaffold(
      appBar: AppBar(
        title: Text('Cerca esperimento'),
      ),
      body: GestureDetector(
        onTap: () {
          FocusManager.instance.primaryFocus?.unfocus();
        },
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    controller: experimentController,
                    textCapitalization: TextCapitalization.characters,
                    decoration: const InputDecoration(
                      hintText: 'CODE',
                      hintStyle: TextStyle(color: Colors.grey),
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                IconButton(
                  icon: const Icon(
                    Icons.clear,
                  ),
                  color: Colors.red,
                  onPressed: () {
                    experimentController.clear();
                  },
                ),
              ],
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () async {
                final sc = experimentController.text.trim();

                if (shortCode.value == sc) {
                  ref.invalidate(getExperimentByCodeProvider(sc));
                } else {
                  shortCode.value = sc;
                }
              },
              child: Text(
                'Applica esperimento',
              ),
            ),
            const SizedBox(height: 16),
            if (shortCode.value != null)
              Consumer(
                builder: (BuildContext context, WidgetRef ref, Widget? child) {
                  final state =
                      ref.watch(getExperimentByCodeProvider(shortCode.value!));

                  if (state.isLoading) {
                    return const CircularProgressIndicator();
                  }

                  if (state.hasError) {
                    return const Text(
                      'Esperimento inesistente o errore nel recuperarlo',
                    );
                  }

                  final experiment = state.valueOrNull;
                  if (experiment != null) {
                    final canDoTest =
                        experiment.smartphonePositionOverride != null &&
                            experiment.activityTypeOverride != null &&
                            experiment.duration != null;

                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        ExperimentInfo(
                          experiment: experiment,
                        ),
                        if(!canDoTest)
                        ElevatedButton(
                          onPressed: () {
                            context.go('/home/load-experiment/set-test',
                                extra: experiment);
                          },
                          child: const Center(
                            child: Text('Finisci di configurare'),
                          ),
                        ),
                        if (canDoTest) ...[
                          const SizedBox(height: 16),
                          ElevatedButton(
                            onPressed: () {
                              final extra = TestConfiguration(
                                experiment: experiment,
                                smartphonePosition:
                                    experiment.smartphonePositionOverride!,
                                sensorActivityType:
                                    experiment.activityTypeOverride!,
                                duration: experiment.duration!.toInt(),
                                retainNullValue: false,
                              );
                              context.go(
                                '/home/sensors-tracking',
                                extra: extra,
                              );
                            },
                            child: const Text('Esegui TEST'),
                          ),
                        ],
                      ],
                    );
                  }
                  return const SizedBox.shrink();
                },
              ),
          ],
        ),
      ),
    );
  }
}

class TextInfo extends StatelessWidget {
  final String text;
  final String? value;

  const TextInfo({required this.text, required this.value, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          text,
          style: const TextStyle(fontSize: 18, color: Colors.grey),
        ),
        Text(
          value ?? '-',
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}

class ExperimentInfo extends StatelessWidget {
  final Experiment experiment;

  const ExperimentInfo({
    required this.experiment,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextInfo(
          text: 'Nome',
          value: experiment.name,
        ),
        TextInfo(
          text: 'Descrizione',
          value: experiment.description,
        ),
        TextInfo(
          text: 'Attività',
          value: experiment.activityTypeOverride?.translate,
        ),
        TextInfo(
          text: 'Posizione smartphone',
          value: experiment.smartphonePositionOverride?.translate,
        ),
        TextInfo(
          text: 'Durata del test',
          value: experiment.duration?.toString(),
        ),
      ],
    );
  }
}
