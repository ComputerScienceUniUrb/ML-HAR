import 'dart:async';

import 'package:aifit/features/home/screens/sensor_tracking/application/sensor_tracking_provider.dart';
import 'package:aifit/features/home/screens/sensor_tracking/application/sensor_tracking_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/**/
enum ActivityType {
  jump,
}

// TODO tradurre
enum SmartphonePosition {
  mano,
  tasca,
  marsupio,
}

// in seconds
const defaultTestDuration = 30;

class SensorTrackingScreen extends HookConsumerWidget {
  const SensorTrackingScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedActivity = useState<ActivityType?>(null);
    final smartphonePosition = useState<SmartphonePosition?>(null);
    final testDuration = useState<double>(30);

    final state = ref.watch(sensorTrackingNotifierProvider);
    final isWorking = state is! SensorTrackingStateInitial;
    final buttonText = state is SensorTrackingStateInitial ? 'Start' : 'Stop';

    return Scaffold(
      appBar: AppBar(
        title: const Text('Sensor Tracking'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Row(
            children: [
              Expanded(
                child: DropdownMenu<ActivityType>(
                  label: const Text('Tipo di attività'),
                  expandedInsets: EdgeInsets.zero,
                  enabled: !isWorking,
                  dropdownMenuEntries: ActivityType.values
                      .map(
                        (e) => DropdownMenuEntry<ActivityType>(
                          value: e,
                          label: e.name,
                        ),
                      )
                      .toList(),
                  onSelected: (v) {
                    selectedActivity.value = v;
                  },
                ),
              ),
              IconButton(
                icon: const Icon(Icons.clear),
                color: Colors.red,
                onPressed: !isWorking
                    ? () {
                        selectedActivity.value = null;
                      }
                    : null,
              ),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: DropdownMenu<SmartphonePosition>(
                  label: const Text('Posizione smartphone'),
                  expandedInsets: EdgeInsets.zero,
                  enabled: !isWorking,
                  dropdownMenuEntries: SmartphonePosition.values
                      .map(
                        (e) => DropdownMenuEntry<SmartphonePosition>(
                          value: e,
                          label: e.name,
                        ),
                      )
                      .toList(),
                  onSelected: (v) {
                    smartphonePosition.value = v;
                  },
                ),
              ),
              IconButton(
                icon: const Icon(Icons.clear),
                color: Colors.red,
                onPressed: !isWorking
                    ? () {
                        smartphonePosition.value = null;
                      }
                    : null,
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: Slider(
                  value: testDuration.value,
                  min: 5,
                  divisions: 11,
                  max: 60,
                  label: '${testDuration.value.toStringAsFixed(0)} sec',
                  onChanged: !isWorking
                      ? (v) {
                          testDuration.value = v;
                        }
                      : null,
                ),
              ),
              Text(
                '${testDuration.value.toStringAsFixed(0)} sec',
              ),
            ],
          ),
          ElevatedButton(
            onPressed: () {
              if (state is SensorTrackingStateInitial) {
                ref
                    .read(sensorTrackingNotifierProvider.notifier)
                    .start(testDuration.value.toInt());
              } else {
                ref.read(sensorTrackingNotifierProvider.notifier).stop();
              }
            },
            child: Text(buttonText),
          ),
          if (state is SensorTrackingStateData)
            Center(
              child: Text(
                '${(state as SensorTrackingStateData).remainingInSecond.toStringAsFixed(1)} sec',
                style: const TextStyle(fontSize: 35),
              ),
            ),
        ],
      ),
    );
  }
}
