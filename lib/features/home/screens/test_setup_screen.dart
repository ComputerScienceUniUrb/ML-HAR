import 'package:aifit/constants.dart';
import 'package:aifit/core/data/experiment/models/experiment.dart';
import 'package:aifit/core/data/sensors/models/sensor_activity_type.dart';
import 'package:aifit/core/data/sensors/models/smartphone_position.dart';
import 'package:aifit/features/home/screens/sensor_tracking/ui/sensor_tracking.dart';
import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class TestSetupScreen extends HookConsumerWidget {
  final Experiment? initialExperiment;

  const TestSetupScreen({
    super.key,
    this.initialExperiment,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sensorActivityType =
        useState<SensorActivityType?>(initialExperiment?.activityTypeOverride);
    final smartphonePosition = useState<SmartphonePosition?>(
        initialExperiment?.smartphonePositionOverride);
    final testDuration = useState<double>(
      initialExperiment?.duration?.toDouble() ?? defaultTestDurationInSeconds,
    );
    final retainNullValue = useState<bool>(false);

    final canGoNext =
        sensorActivityType.value != null && smartphonePosition.value != null;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Nuovo test'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          if (initialExperiment != null)
            Padding(
              padding: const EdgeInsets.only(bottom: 16.0),
              child: Text(
                initialExperiment!.name,
                style: TextStyle(fontSize: 20),
              ),
            ),
          Row(
            children: [
              Expanded(
                child: CustomDropdown(
                  hintText: 'Tipo di attività',
                  initialItem: sensorActivityType.value,
                  headerBuilder: (context, item, enabled) {
                    return Text(
                      item.translate,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    );
                  },
                  listItemBuilder: (context, item, isSelected, onSelect) {
                    return Text(item.translate);
                  },
                  items: SensorActivityType.values,
                  onChanged: (v) {
                    if (v == sensorActivityType.value) return;
                    if (sensorActivityType.value ==
                            SensorActivityType.onBicycle ||
                        v == SensorActivityType.onBicycle) {
                      smartphonePosition.value = null;
                    }
                    sensorActivityType.value = v;
                  },
                ),
              ),
              IconButton(
                icon: const Icon(Icons.clear),
                color: Colors.red,
                onPressed: () {
                  sensorActivityType.value = null;
                },
              ),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: CustomDropdown(
                  hintText: 'Posizione smartphone',
                  initialItem: smartphonePosition.value,
                  headerBuilder: (context, item, enabled) {
                    return Text(
                      item.translate,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    );
                  },
                  listItemBuilder: (context, item, isSelected, onSelect) {
                    return Text(item.translate);
                  },
                  items:
                      sensorActivityType.value != SensorActivityType.onBicycle
                          ? SmartphonePosition.values.toList()
                          : SmartphonePosition.values,
                  onChanged: (v) {
                    smartphonePosition.value = v;
                  },
                ),
              ),
              IconButton(
                icon: const Icon(Icons.clear),
                color: Colors.red,
                onPressed: () {
                  smartphonePosition.value = null;
                },
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: Slider(
                  value: testDuration.value,
                  min: 5,
                  max: 600,
                  label: '${testDuration.value.toStringAsFixed(0)} sec',
                  onChanged: (v) {
                    testDuration.value = v;
                  },
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                icon: const Icon(
                  Icons.remove_circle,
                ),
                color: Colors.red,
                onPressed: testDuration.value >= 6
                    ? () {
                        if (testDuration.value >= 1) {
                          testDuration.value = testDuration.value - 1;
                        }
                      }
                    : null,
              ),
              Text(
                '${testDuration.value.toStringAsFixed(0)} sec',
              ),
              IconButton(
                icon: const Icon(
                  Icons.add_circle,
                ),
                color: Colors.green,
                onPressed: testDuration.value < 600
                    ? () {
                        if (testDuration.value < 600) {
                          testDuration.value = testDuration.value + 1;
                        }
                      }
                    : null,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Consenti valori NULL?'),
              Switch(
                value: retainNullValue.value,
                onChanged: (value) {
                  retainNullValue.value = value;
                },
              ),
            ],
          ),
          ElevatedButton(
            onPressed: canGoNext
                ? () {
                    final td = testDuration.value.toInt();
                    final extra = TestConfiguration(
                      experiment: initialExperiment?.copyWith(duration: td),
                      smartphonePosition: smartphonePosition.value!,
                      sensorActivityType: sensorActivityType.value!,
                      duration: td,
                      retainNullValue: false,
                    );
                    context.go('/sensors-tracking', extra: extra);
                  }
                : null,
            child: const Text('Avanti'),
          ),
        ],
      ),
    );
  }
}
