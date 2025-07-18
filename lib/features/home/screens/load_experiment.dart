import 'package:aifit/core/data/sensors/models/sensor_activity_type.dart';
import 'package:aifit/core/data/sensors/models/smartphone_position.dart';
import 'package:aifit/features/home/screens/sensor_tracking/ui/sensor_tracking.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:aifit/core/data/experiment/models/experiment.dart';
import 'package:aifit/features/home/screens/sensor_tracking/application/experiment_notifier.dart';

class LoadExperimentScreen extends HookConsumerWidget {
  final String? initialShortCode;
  final String? experimentId;

  const LoadExperimentScreen({
    super.key,
    this.initialShortCode,
    this.experimentId,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final experimentController = useTextEditingController(
      text: initialShortCode?.toUpperCase(),
    );
    final shortCode = useState<String?>(initialShortCode?.toUpperCase());

    return Scaffold(
      appBar: AppBar(
        title: const Text('Cerca esperimento'),
      ),
      body: GestureDetector(
        onTap: () {
          FocusManager.instance.primaryFocus?.unfocus();
        },
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            if (experimentId == null) ...[
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
                  FocusManager.instance.primaryFocus?.unfocus();
                  final sc = experimentController.text.trim().toLowerCase();

                  if (shortCode.value == sc) {
                    ref.invalidate(getExperimentByCodeProvider(sc));
                  } else {
                    shortCode.value = sc;
                  }
                },
                child: const Text(
                  'Applica esperimento',
                ),
              ),
              const SizedBox(height: 16),
            ],
            if (shortCode.value != null || experimentId != null)
              Consumer(
                builder: (BuildContext context, WidgetRef ref, Widget? child) {
                  late AsyncValue<Experiment?> state;
                  if (shortCode.value != null) {
                    state = ref
                        .watch(getExperimentByCodeProvider(shortCode.value!));
                  } else if (experimentId != null) {
                    state = ref.watch(getExperimentByIdProvider(experimentId!));
                  } else {
                    return SizedBox.shrink();
                  }

                  if (state.isLoading) {
                    return Center(child: const CircularProgressIndicator());
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
                          name: experiment.name,
                          description: experiment.description,
                          smartphonePosition:
                              experiment.smartphonePositionOverride,
                          activityType: experiment.activityTypeOverride,
                          duration: experiment.duration,
                        ),
                        if (!canDoTest)
                          ElevatedButton(
                            onPressed: () {
                              context.go(
                                '/load-experiment/set-test',
                                extra: experiment,
                              );
                            },
                            child: const Center(
                              child: Text('Finisci di configurare'),
                            ),
                          )
                        else ...[
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
  final String? name;
  final String? description;
  final SensorActivityType? activityType;
  final SmartphonePosition? smartphonePosition;
  final int? duration;

  const ExperimentInfo({
    required this.name,
    required this.duration,
    required this.description,
    required this.activityType,
    required this.smartphonePosition,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (name != null)
          TextInfo(
            text: 'Nome Experimento',
            value: name,
          ),
        if (description != null)
          TextInfo(
            text: 'Descrizione',
            value: description,
          ),
        TextInfo(
          text: 'Attività',
          value: activityType?.translate,
        ),
        TextInfo(
          text: 'Posizione smartphone',
          value: smartphonePosition?.translate,
        ),
        TextInfo(
          text: 'Durata del test',
          value: '${duration ?? '-'} secondi',
        ),
      ],
    );
  }
}
