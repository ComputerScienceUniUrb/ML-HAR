import 'package:aifit/constants.dart';
import 'package:aifit/core/clients/device_info.dart';
import 'package:aifit/core/data/sensors/models/sensor_activity_type.dart';
import 'package:aifit/core/data/sensors/models/smartphone_position.dart';
import 'package:aifit/core/utils/csv_mixin.dart';
import 'package:aifit/core/utils/logger.dart';
import 'package:aifit/core/utils/utils.dart';
import 'package:aifit/features/home/screens/sensor_tracking/application/sensor_tracking_provider.dart';
import 'package:aifit/features/home/screens/sensor_tracking/application/sensor_tracking_state.dart';
import 'package:aifit/features/home/screens/sensor_tracking/application/sensor_tracks_provider.dart';
import 'package:aifit/features/home/screens/sensor_tracking/ui/widgets/start_dialog.dart';
import 'package:aifit/features/home/screens/sensor_tracking/ui/widgets/user_info.dart';
import 'package:aifit/features/home/screens/track_viewer/track_viewer.dart';
import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:wakelock_plus/wakelock_plus.dart';

class SensorTrackingScreen extends ConsumerStatefulWidget {
  const SensorTrackingScreen({super.key});

  @override
  ConsumerState<SensorTrackingScreen> createState() =>
      _SensorTrackingScreenState();
}

class _SensorTrackingScreenState extends ConsumerState<SensorTrackingScreen>
    with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    logger.i('AppState $state');
    if (state == AppLifecycleState.paused) {
      if (ref.exists(getSensorTracksProvider)) {
        ref.read(sensorTrackingNotifierProvider.notifier).stop();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return const SensorTrackingWidget();
  }
}

class SensorTrackingWidget extends HookConsumerWidget with CSVMixin {
  const SensorTrackingWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedActivity = useState<SensorActivityType?>(null);
    final smartphonePosition = useState<SmartphonePosition?>(null);
    final testDuration = useState<double>(defaultTestDurationInSeconds);
    final retainNullValue = useState<bool>(false);

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
            const UserInfoWidget(),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: CustomDropdown(
                    hintText: 'Tipo di attività',
                    enabled: !isWorking,
                    initialItem: selectedActivity.value,
                    headerBuilder: (context, item, enabled) {
                      return Text(
                        item.name,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      );
                    },
                    listItemBuilder: (context, item, isSelected, onSelect) {
                      return Text(item.name);
                    },
                    items: SensorActivityType.values,
                    onChanged: (v) {
                      if (v == selectedActivity.value) return;
                      if (selectedActivity.value ==
                              SensorActivityType.onBicycle ||
                          v == SensorActivityType.onBicycle) {
                        smartphonePosition.value = null;
                      }
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
                  child: CustomDropdown(
                    hintText: 'Posizione smartphone',
                    enabled: !isWorking,
                    initialItem: smartphonePosition.value,
                    headerBuilder: (context, item, enabled) {
                      return Text(
                        item.name,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      );
                    },
                    listItemBuilder: (context, item, isSelected, onSelect) {
                      return Text(item.name);
                    },
                    items:
                        selectedActivity.value != SensorActivityType.onBicycle
                            ? SmartphonePosition.values
                                .take(SmartphonePosition.values.length - 1)
                                .toList()
                            : SmartphonePosition.values,
                    onChanged: (v) {
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
                    max: 600,
                    label: '${testDuration.value.toStringAsFixed(0)} sec',
                    onChanged: !isWorking
                        ? (v) {
                            testDuration.value = v;
                          }
                        : null,
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
              onPressed: selectedActivity.value != null &&
                      smartphonePosition.value != null
                  ? () async {
                      if (!isWorking) {
                        final isGranted = await isPermissionGrants();
                        if (isGranted) {
                          final res = await showDialog(
                            context: context,
                            builder: (_) => StartDialog(
                              smartphonePosition: smartphonePosition.value!,
                              sensorActivityType: selectedActivity.value!,
                            ),
                          );
                          if (res ?? false) {
                            ref
                                .read(sensorTrackingNotifierProvider.notifier)
                                .start(
                                  testDuration.value.toInt(),
                                  selectedActivity.value!,
                                  smartphonePosition.value!,
                                  retainNullValue.value,
                                );
                          }
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
            if (state is SensorTrackingStateData) ...[
              Center(
                child: Text(
                  '${state.remainingInSecond.toStringAsFixed(1)} sec',
                  style: const TextStyle(fontSize: 35),
                ),
              ),
              Center(
                child: Text(
                  'Activity Recognition: ${state.activityRecognized ?? '-'}',
                  style: const TextStyle(fontSize: 24),
                ),
              ),
            ] else if (state is SensorTrackingStateCompleted)
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const Text('Current track'),
                      ...[
                        const SizedBox(height: 16),
                        Text('Id: ${state.track.id}'),
                        Text(
                          'Totali campioni: ${state.track.sensorsData?.length}',
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) =>
                                    TrackViewerScreen(track: state.track),
                              ),
                            );
                          },
                          child: const Text('Vedi traccia'),
                        ),
                        TextButton(
                          onPressed: () async {
                            final androidInfo = await ref
                                .read(getAndroidDeviceInfoProvider.future);
                            downloadCSV(state.track, androidInfo);
                          },
                          child: const Text('Scarica traccia'),
                        ),
                      ],
                    ],
                  ),
                ),
              ),
            const SensorTracks(),
            const SizedBox(height: 64),
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
                const Text('Tracks'),
                if (state.isNotEmpty)
                  TextButton(
                    onPressed: () {},
                    child: const Text('View all'),
                  ),
              ],
            ),
            for (int i = 0; i < state.length; i++)
              ListTile(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => TrackViewerScreen(track: state[i]),
                    ),
                  );
                },
                leading: Text(state[i].id.toString()),
                title: Text(
                  '${state[i].activityType?.name ?? ''} ${state[i].smartphonePosition?.name ?? ''}, samples ${state[i].sensorsData?.length ?? 0}',
                ),
                subtitle: Text(state[i].timestamp?.toIso8601String() ?? '-'),
                trailing: IconButton(
                  icon: const Icon(Icons.download),
                  color: Colors.black,
                  onPressed: () async {
                    final androidInfo =
                        await ref.read(getAndroidDeviceInfoProvider.future);
                    downloadCSV(state[i], androidInfo);
                  },
                ),
              ),
          ],
        ),
      ),
    );
  }
}
