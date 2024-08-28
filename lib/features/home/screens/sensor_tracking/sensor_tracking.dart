import 'package:aifit/core/data/sensors/models/sensor_activity_type.dart';
import 'package:aifit/core/data/sensors/models/smartphone_position.dart';
import 'package:aifit/core/utils/csv_mixin.dart';
import 'package:aifit/core/utils/utils.dart';
import 'package:aifit/features/home/screens/sensor_tracking/application/sensor_tracking_provider.dart';
import 'package:aifit/features/home/screens/sensor_tracking/application/sensor_tracking_state.dart';
import 'package:aifit/features/home/screens/sensor_tracking/application/sensor_tracks_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_activity_recognition/models/activity_type.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:wakelock_plus/wakelock_plus.dart';

// in seconds
const defaultTestDuration = 30;

class SensorTrackingScreen extends HookConsumerWidget with CSVMixin {
  const SensorTrackingScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(getSensorTracksProvider, (p, n) {
      if (p is SensorTrackingStateInitial && n is SensorTrackingStateData) {
        WakelockPlus.enable();
      } else if (n is SensorTrackingStateCompleted) {
        WakelockPlus.disable();
      }
    });
    final selectedActivity = useState<SensorActivityType?>(null);
    final smartphonePosition = useState<SmartphonePosition?>(null);
    final testDuration = useState<double>(30);

    final state = ref.watch(sensorTrackingNotifierProvider);
    final isWorking = state is SensorTrackingStateData;
    final buttonText = !isWorking ? 'Start' : 'Stop';

    return PopScope(
      onPopInvoked: (didPop) {
        if (didPop) {
          WakelockPlus.disable();
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Sensor Tracking'),
        ),
        body: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            Row(
              children: [
                Expanded(
                  child: DropdownMenu<SensorActivityType>(
                    label: const Text('Tipo di attività'),
                    expandedInsets: EdgeInsets.zero,
                    enabled: !isWorking,
                    dropdownMenuEntries: SensorActivityType.values
                        .map(
                          (e) => DropdownMenuEntry<SensorActivityType>(
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
              onPressed: selectedActivity.value != null &&
                      smartphonePosition.value != null
                  ? () async {
                      if (!isWorking) {
                        final isGranted = await isPermissionGrants();
                        if (isGranted) {
                          ref
                              .read(sensorTrackingNotifierProvider.notifier)
                              .start(
                                testDuration.value.toInt(),
                                selectedActivity.value!,
                                smartphonePosition.value!,
                              );
                        }
                      } else {
                        ref
                            .read(sensorTrackingNotifierProvider.notifier)
                            .stop();
                        WakelockPlus.disable();
                      }
                    }
                  : null,
              child: Text(buttonText),
            ),
            if (state is SensorTrackingStateData)
              Center(
                child: Text(
                  '${state.remainingInSecond.toStringAsFixed(1)} sec',
                  style: const TextStyle(fontSize: 35),
                ),
              )
            else if (state is SensorTrackingStateCompleted)
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text('Current track'),
                      ...[
                        const SizedBox(height: 16),
                        Text('Id: ${state.track.id}'),
                        Text(
                            'Totali campioni: ${state.track.sensorsData?.length}'),
                        TextButton(
                            onPressed: () {},
                            child: const Text('Vedi traccia')),
                        TextButton(
                            onPressed: () {
                              downloadCSV(state.track);
                            },
                            child: const Text('Scarica traccia')),
                      ],
                    ],
                  ),
                ),
              ),
            const SensorTracks(),
          ],
        ),
      ),
    );
  }
}

class SensorTracks extends ConsumerWidget with CSVMixin {
  const SensorTracks({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(getSensorTracksProvider).valueOrNull ?? [];
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Tracks'),
                if (state.isNotEmpty)
                  TextButton(
                    onPressed: () {},
                    child: Text('View all'),
                  ),
              ],
            ),
            for (int i = 0; i < state.length; i++)
              ListTile(
                leading: Text(state[i].id.toString()),
                title: Text(
                    '${state[i].activityType?.name ?? ''} ${state[i].smartphonePosition?.name ?? ''} Samples ${state[i].sensorsData?.length ?? 0}'),
                subtitle: Text(state[i].timestamp?.toIso8601String() ?? '-'),
                trailing: IconButton(
                  icon: Icon(Icons.download),
                  color: Colors.black,
                  onPressed: () {
                    downloadCSV(state[i]);
                  },
                ),
              ),
          ],
        ),
      ),
    );
  }
}